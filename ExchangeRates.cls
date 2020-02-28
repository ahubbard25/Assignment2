public with sharing class ExchangeRates {
    public HttpResponse makeGetCallout() {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    //request endpoint URL
    request.setEndpoint('https://api.exchangeratesapi.io/history?start_at=2018-01-01&end_at=2018-09-01&base=USD&symbols=CAD');
    //request GET method
    request.setMethod('GET');
    HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> records = (Map<String, Object>) results.get('rates');
            
            for (String rec : records.keySet()){
                System.debug(rec + ': ' + records.get(rec));
             }
        }
    //return response generated
    return response;
	}
}