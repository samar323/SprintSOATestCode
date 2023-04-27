public class HttpCalloutHandler {
	public static void makeCallout() {
        // Defined the endpoint URL and parameters
        // endpoint should be whitelisted in remote site settings
        String endpoint = 'https://postman-echo.com/get';
        String params = 'foo1=bar1&foo2=bar2';

        // Created an instance of the HTTP class and send the request
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint + '?' + params);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        System.debug(response.getBody());
    }
}