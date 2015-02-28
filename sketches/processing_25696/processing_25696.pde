
import org.json.*;

String baseURL = "http://api.nytimes.com/svc/search/v1/article";
String apiKey = "27a1b64b0d34ca5789a9c603b3fc9138:7:54142336";

int margin = 100; // sets the padding at the bottom of th

void setup() {
  background(0);

size(500,500);

String[] words = {"Democrat", "Obama","Republican","Bush","Peace", "War","Terror","Terrorist","9/11", "Torture", "Internet", "twitter", "facebook"};
color[] colors = {#051BFF, #00208E, #FF0000, #460101, #018E21, #DE9904, #9AC11B, #0C6F6C, #2E2E2E, #4A0052,#CBA610,#10CBBD,#1310CB };
 

int barSize = 25;
int startY = 80;

//date is YEAR Month day
String start = "20000101";
String end = "20100101";
  




for (int i = 0; i < words.length; i++) {
   int freq = getArticleKeywordCount( words[i], start, end);
   fill(colors[i]);
   strokeWeight(2);
   rect(margin + (barSize * i),height-margin, barSize ,freq / - (height - margin));//Happy accident I left out a value by accident and it started working perfectly.
   pushMatrix();
    
   translate((margin+barSize/2) +(barSize * i) ,height-(margin-15));
   rotate(radians(45));

   //   rect(margin + (barSize * i),height-margin, barSize ,freq / - (height - margin));//Happy accident I left out a value by accident and it started working perfectly.
println("freq/height="+(freq / - (height - margin)));
   text(words[i],0, 0);
   popMatrix();


String charLength = Integer.toString(freq); 
    pushMatrix();
     translate((margin+(barSize/2) +5) +(barSize * i) ,(height-(margin + (10*charLength.length()))) - (freq / (height)));
     rotate(radians(-90));
     text(freq, 0,0);
     popMatrix();
 fill(255);

   
};
noLoop();
 text("Number Of Times  words are Mentioned in the New York Times Headlines from 2000 to 2010",margin,20,(barSize*words.length), 300);
};

void draw() {

};

int getArticleKeywordCount(String word, String beginDate, String endDate) {
String request = baseURL + "?query=" + word + "&begin_date=" + beginDate + "&end_date=" + endDate + "&api-key=" + apiKey;
String result = join( loadStrings( request ), "");

int total = 0;

try {
JSONObject nytData = new JSONObject(join(loadStrings(request), ""));
JSONArray results = nytData.getJSONArray("results");
total = nytData.getInt("total");
println ("There were " + total + " occurences of the term " + word + " between " + beginDate + " and " + endDate);
}
catch (JSONException e) {
println ("There was an error parsing the JSONObject.");
};

return(total);
};



