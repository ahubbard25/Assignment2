public with sharing class ExchangeRates {
    public HttpResponse makeGetCallout() {
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    //request endpoint URL
    req.setEndpoint('https://api.exchangeratesapi.io/history?start_at=2018-01-01&end_at=2018-07-01&base=USD&symbols=CAD');
    //request GET method
    req.setMethod('GET');
    HttpResponse res = h.send(req);
        if(res.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            Map<String, Object> records = (Map<String, Object>) results.get('rates');
            
            for (String rec : records.keySet()){
                System.debug(rec + ': ' + records.get(rec));
             }
        }
    //return response generated
    return res;
	}
}