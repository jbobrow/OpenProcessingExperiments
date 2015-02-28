

String baseURL = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Chihuahua&mode=json&units=metric&cnt=7";
JSONArray results;
float[] TMin = new float[7];
float[] TMax = new float[7];
float[] YMin = new float[7];
float[] YMax = new float[7];

void grafica(float[] lista)
{
  int tam = lista.length;
  noFill();
  strokeWeight(2);
  beginShape();
  int x = 100;
  curveVertex(x,lista[0]);
  for (int i=0; i<tam; i++, x+=50) {
    curveVertex(x,lista[i]);
  }
  curveVertex(x-50,lista[tam-1]);
  endShape();
  stroke(0);
  strokeWeight(8);
  x = 100;
  for (int i=0; i<tam; i++, x+=50) {
    point(x,lista[i]);
  }
}

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
  stroke(0,200,60);
  grafica(YMax);
  stroke(200,0,0);
  grafica(YMin);
}
 
void draw()
{
}
 
 
JSONArray getJSONdata()
{ 
  try { 
    JSONObject climaData = loadJSONObject(baseURL);
    return climaData.getJSONArray("list");
  }
  catch (Exception e) {
    println("There was an error inside getJSONdata()");
  }
  return new JSONArray();
}
