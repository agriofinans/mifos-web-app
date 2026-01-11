(function (window) {
  window['env'] = window['env'] || {};

  // BackEnd Environment variables
  window['env']['fineractApiUrls'] = 'https://fineract.agr.ist';
  window['env']['fineractApiUrl'] = 'https://fineract.agr.ist';

  window['env']['apiProvider'] = '';
  window['env']['apiVersion'] = '';

  window['env']['fineractPlatformTenantId'] = 'clickfinance';
  window['env']['fineractPlatformTenantIds'] = 'clickfinance';

  // Language Environment variables
  window['env']['defaultLanguage'] = 'en-US';
  window['env']['supportedLanguages'] = 'en-US';

  window['env']['preloadClients'] = '';

  // Char delimiter to Export CSV options: ',' ';' '|' ' '
  window['env']['defaultCharDelimiter'] = '';

  // Display or not the BackEnd Info
  window['env']['displayBackEndInfo'] = 'false';

  // Display or not the Tenant Selector
  window['env']['displayTenantSelector'] = 'false';

  // Time in seconds for Notifications, default 60 seconds
  window['env']['waitTimeForNotifications'] = '';

  // Time in seconds for COB Catch-Up, default 30 seconds
  window['env']['waitTimeForCOBCatchUp'] = '';

  // Time in milliseconds for Session idle timeout, default 300000 seconds
  window['env']['sessionIdleTimeout'] = '0';

  // OAuth Server Enabled
  window['env']['oauthServerEnabled'] = '';

  // OAuth Server URL
  window['env']['oauthServerUrl'] = '';

  // OAuth Client Id
  window['env']['oauthAppId'] = '';
})(this);
