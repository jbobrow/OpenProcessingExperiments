
// clima ver. 1
String baseURL = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Chihuahua&mode=json&units=metric&cnt=7";
JSONArray results;
float[] TMin = new float[7];
float[] TMax = new float[7];
float[] YMin = new float[7];
float[] YMax = new float[7];

void setup()
{
  colorMode(RGB);
  size(500, 400, P2D);
  background(255);
  smooth();
  results = getJSONdata();
  for (int i=0; i<results.size(); i++) {
    JSONObject dia = results.getJSONObject(i).getJSONObject("temp");
    TMin[i] = dia.getFloat("min");
    TMax[i] = dia.getFloat("max");
    YMin[i] = map(TMin[i],-15.0,40.0,350.0,50.0);
    YMax[i] = map(TMax[i],-15.0,40.0,350.0,50.0);    
  }
//  println(TMax);
  noFill();
  stroke(200,0,0);
  strokeWeight(2);
  beginShape();
  int x = 100;
  curveVertex(x,YMin[0]);
  for (int i=0; i<YMin.length; i++, x+=50) {
    curveVertex(x,YMin[i]);
  }
  curveVertex(x-50,YMin[6]);
  endShape();
  stroke(0);
  strokeWeight(8);
  x = 100;
  for (int i=0; i<YMin.length; i++, x+=50) {
    point(x,YMin[i]);
  }
}
 
void draw()
{
}
 
 
JSONArray getJSONdata()
{ 
//  String request = baseURL + "Banksy&api-key=" + apiKey;
  try { 
    // Load the search results into a JSONObject so Processing can parse the JSON data structure
    JSONObject climaData = loadJSONObject(baseURL);
    return climaData.getJSONArray("list");
  }
  catch (Exception e) {
    println("There was an error inside getData()");
  }
  return new JSONArray();
}
