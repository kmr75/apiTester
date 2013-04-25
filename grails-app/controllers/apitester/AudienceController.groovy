package apitester
import groovyx.net.http.*
import org.apache.http.*
import org.apache.http.protocol.*
import org.apache.http.params.*
import org.apache.http.client.methods.*
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.commons.codec.binary.Base64
import org.apache.http.util.EntityUtils
import grails.converters.*
import org.apache.http.entity.StringEntity;

class AudienceController {

    def index = { 
	
	
	}
	
	def viewAudiences = {
		def rows = params.rows.toInteger()
		def currPage = params.page.toInteger()
		def startIndex = ((currPage - 1) * rows)
		def endIndex = (currPage * rows)
		def sortColumn = params.sidx
		def sortOrder=params.sord
		
		DefaultHttpClient hc = new DefaultHttpClient();
		HttpPost get = new HttpPost("https://api.lotame.com?email=rossokr@gmail.com&password=retype55&reset=");

		org.apache.http.message.BasicHttpResponse response = hc.execute(get);
		HttpEntity entity = response.getEntity();
		String token = EntityUtils.toString(entity);
		//println token
		//def token = JSON.parse(json)["access_token"];
		def requestString = "https://api.lotame.com/audstats/reports/topAudiences?page_count=20"
		if(sortColumn)
			requestString+="&sort_attr="+sortColumn+"&sort_order="+sortOrder
		HttpGet httpost = new HttpGet(requestString);
		httpost.addHeader("Accept","application/json")
		httpost.addHeader("Authorization",token);
		
		org.apache.http.message.BasicHttpResponse response2 = hc.execute(httpost);
		//println response2
		HttpEntity entity2 = response2.getEntity();
		String json2 = EntityUtils.toString(entity2);
		def searchResults = JSON.parse(json2)
		def resultSize = searchResults["reportInfo"]["pageInfo"]["@pageSize"] as Integer
		//println resultSize
		
		if(searchResults){
			
		def results = []
		if(endIndex > resultSize) {
			endIndex = resultSize
		}
		searchResults["stat"].each { result ->
		//println result
		def cells = []
		cells << result["uniques"]
		cells << result["pageViews"]
		cells << result["audienceTargetingCode"]
		cells << result["audienceName"]
		results << [id: result["uniques"], cell: cells]
		}
				

		def jsonObject = [
			page: currPage,
			total: 20,
			records: resultSize,
			rows:results
		]
		//log.debug jsonObject
				
		render jsonObject as JSON
	} else {
		def jsonObject = [
			page: 0,
			total: 0,
			records: 0,
			rows:[]
		]
		//log.debug jsonObject
		
		render jsonObject as JSON
	}

  }
}
