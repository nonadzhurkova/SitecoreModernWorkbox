# Custom Sitecore Modern Workbox for Improved Performance
This project resolves performance issues with the Sitecore Workbox in environments with large volumes of content items, particularly those in Draft state. Out-of-the-box (OOTB) Sitecore Workbox loads all items across all workflow states, causing timeouts and high database usage for non-admin users.

Our solution involves upgrading and customizing the Sitecore Advanced Workbox to work with Sitecore 9.2, focusing on an optimized initial load that fetches only items in the "Awaiting Approval" state. This reduces database load and cuts non-admin user load times from 20+ minutes to 30 seconds in worst-case scenarios.
