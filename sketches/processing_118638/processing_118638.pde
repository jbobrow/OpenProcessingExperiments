
String apiKey = "055c96339005db09b9ed014f6cfd8de8:5:68305937";

// Assuming you got the API Key for Article search, all of your search requests are going to start out with this URL String
String baseURL = "http://api.nytimes.com/svc/search/v2/articlesearch,json?q=";
PFont f;
int results;
String article;
Spray[] myspray = new Spray[2];
void setup() {
  size(500, 500);
  background(255);
  f = loadFont("Stencil-48.vlw");
  for (int i=0; i<myspray.length; i++) {
    myspray[i]= new Spray();
  }
    JSONArray articles = getDroneArticles();
  for (int i = 0 ; i < articles.size(); i++) {
    article= (articles.getJSONObject(i).getJSONObject("headline").getString("main"));
  }

}

void draw() {
 
  for (int i=0; i<myspray.length; i++) {
    myspray[i].display();
    if (mousePressed) {
      myspray[i].shake();
      filter(BLUR, 2);
    }
    else {
      myspray[i].home();
      background(255);
    }
  }
}


JSONArray getDroneArticles() {


  String request = baseURL + "Banksy&api-key=" + apiKey;
  try {

    // Load the search results into a JSONObject so Processing can parse the JSON data structure
    JSONObject nytData = loadJSONObject(request);
    results = nytData.getJSONObject("response").getJSONObject("meta").getInt("hits");

    // Get the "total" result number and store is an integer
    // println ("There were " + results + " occurences of the term Banksy in the last 3 days");

    return nytData.getJSONObject("response").getJSONArray("docs");
  }
  catch (Exception e) {
    // println ("There was an error parsing the JSONObject.");
  }
  return new JSONArray();
};

 class Spray{
  float homex,homey;

  float x,y;
  
  Spray(){
    x=random(width);
    y=random(height);
    homex = width/2;
    homey = height/2;
  }

  void display() {
    fill(0);
    stroke(0);
    textAlign(LEFT);
    text(article, x, y);
  }
  
  // Move the letter randomly
  void shake() {
    x += random(-50,50);
    y += random(-50,50);
  }
  
  // At any point, the current location can be set back to the home location by calling the home() function.
  void home() { 
    x = homex;
    y = homey;
  }
  
 }


