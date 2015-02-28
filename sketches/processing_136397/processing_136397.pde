
import com.francisli.processing.http.*;
//This library makes it easier to deal with network requests
//in Processing by wrapping up the relevant Java classes.

//The client object essentially pretends to be a web browser.
HttpClient client;
String data;
//JSON is a simple convention for sending data around over
//the web. A JSONObject is a code object that makes it easier to
//use whatever data comes back when I make a request.

//JSON is a very popular convention and there are a lot of tools
//for working with it (it can get unwieldy when there's a lot of
//data). My favorite is a free tool built into Chrome:
//   https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa
//
com.francisli.processing.http.JSONObject weatherInfo;

int last = 0;
PImage img;
float windSpeed = 18;



void setup() {
  size(500, 700, P3D);
  img = loadImage("palm_tree_stepped_trunk_transparent.png");
  
  //This tells Processing to make a sort of fake web browser to talk
  //to the Weather Underground API.
  client = new HttpClient(this, "api.wunderground.com");
  //In order to use Weather Underground's API, you have to sign up for a free "key".
  //The key is the string of gibberish between api/ and /geolookup below. It tells
  //the WU server who I am, so they can decide what kind of data I get access
  //to, whether I've made an unreasonable number of requests in the last few
  //minutes, and so on. Most online APIs, including Twitter, require this for
  //most requests. Normally you just give an email address and you're good.
  //The WU signup page is here:
  //   http://www.wunderground.com/weather/api/d/login.html
  
  //This line gives WU my key and tells it I want current conditions in Chicago.
  //It follows a convention that WU created for asking for its data (i.e. the API).
  //The API documentation, including how to ask for all sorts of other weather-related
  //things, is here:
  //   http://www.wunderground.com/weather/api/d/docs
  client.GET("/api/c369ddfd67e13bde/geolookup/conditions/q/IL/Chicago.json");
  
  background(255);
}

void responseReceived(HttpRequest request, HttpResponse response) {
  
  //This line just dumps the result of my web request to the browser so I can
  //see if anything's gone badly wrong.
  println(response.getContentAsString());
  //Then I tell Processing to understand it as a JSON object, which means
  //Processing sees it as structured data rather than a massive string of characters.
  weatherInfo = response.getContentAsJSONObject();
  
  //Because it's a JSON object now, I can tell Processing to look for
  //specific parts of the data. First I try to ask for a couple of small
  //pieces, to make sure I'm getting things out right.
  println(weatherInfo.get("current_observation").get("wind_mph"));
  println(weatherInfo.get("current_observation").get("wind_dir"));
  
  //Then I pull out the part I actually want and turn it back into a string...
  String windSpeedString = weatherInfo.get("current_observation").get("wind_mph").toString();
  //...so that I can then turn it into a number.
  windSpeed = Float.valueOf(windSpeedString).floatValue(); 
  
  //I use this line if there's not enough wind to be interesting :}
  //windSpeed = 1;
}

void draw() {
  if (millis() - last >= 300) {
    background(255);
    for (int i=0; i<=2; i++) {
      palmTree(random(windSpeed*.3,windSpeed*1.5), i*100, i*80);
    }
    last = millis();
  }   
}


//This function uses a 3D feature of Processing to skew
//the image. The technique came from
//    http://www.openprocessing.org/sketch/90467
void palmTree(float windSpeedThisFrame, int x, int y) {
  
  noStroke();
  
  beginShape();
  textureMode(NORMAL);
  texture(img);
  setVertices(windSpeedThisFrame, x, y);
  endShape();
  imageMode(CORNERS);
  //image(img, 10, 10, 90, 40);  
}



void setVertices(float windSpeedThisFrame, int x, int y) {
  vertex(x+10+windSpeedThisFrame*8, y+20, 0, 0);
  vertex(x+260+windSpeedThisFrame*16, y+20, 1, 0);
  vertex(x+260, y+370, 1, 1);
  vertex(x+10, y+370, 0, 1);
}


