
using Sitecore;
using Sitecore.Data.Items;
using Sitecore.Globalization;
using Sitecore.Shell.Framework.Commands;
using Sitecore.Shell.Web.UI.WebControls;
using Sitecore.Web.UI.HtmlControls;
using Sitecore.Web.UI.WebControls.Ribbons;
using Sitecore.Workflows;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace SitecoreAdvancedWorkbox.Shell.Applications
{
    public class ActionsPanel : RibbonPanel
    {
        public override void Render(HtmlTextWriter output, Ribbon ribbon, Item button, CommandContext context)
        {
            IWorkflowProvider workflowProvider = Context.ContentDatabase.WorkflowProvider;
            if (workflowProvider == null)
                return;
            string string1 = Registry.GetString("/Current_User/Workbox/WorkflowID", ((IEnumerable<IWorkflow>)workflowProvider.GetWorkflows()).FirstOrDefault<IWorkflow>().WorkflowID);
            IWorkflow workflow = workflowProvider.GetWorkflow(string1);
            //string stateID = ((IEnumerable<WorkflowState>)workflow.GetStates()).FirstOrDefault<WorkflowState>().StateID;
            string stateID = workflow.GetStates()[1].StateID;
            if (Context.ClientPage.Session["StateID"] != null)
            {
                string string2 = Context.ClientPage.Session["StateID"].ToString();
                if (workflow.GetState(string2) != null)
                    stateID = string2;
            }
            foreach (WorkflowCommand filterVisibleCommand in WorkflowFilterer.FilterVisibleCommands(workflow.GetCommands(stateID)))
            {
                ribbon.BeginSmallButtons(output);
                string header1 = filterVisibleCommand.DisplayName + " " + Translate.Text("(selected)");
                string command1 = "wf:sendselected(command=" + filterVisibleCommand.CommandID + ",ws=" + stateID + ",wf=" + workflow.WorkflowID + ")";
                string icon = filterVisibleCommand.Icon;
                string header2 = filterVisibleCommand.DisplayName + " " + Translate.Text("(all)");
                string command2 = command1.Replace("sendselected", "sendall");
                this.RenderSmallButton(output, ribbon, string.Empty, header1, icon, string.Empty, command1, this.Enabled, false);

                if (header2 != "Approve For Publishing (all)")
                {
                    ribbon.BeginSmallButtons(output);
                    this.RenderSmallButton(output, ribbon, string.Empty, header2, icon, string.Empty, command2, this.Enabled, false);

                }

            }
        }
    }
}
