





float px;
float py;
float radius = 300;
 float xpos, ypos;
  float speed;
float button =160;

PImage b;
String weatherStream;
String lat;
String longt;
String city;
int temp;
int wind;
int condc;
String condt;
String input = "Fairbanks,Alaska";
String woeid2;
String previousWoeid2;
String city2;
XMLElement report;
PFont font;
PFont font2;
PFont font3;

String tcond;
int tlow;
int thigh;

boolean locked = false;
String unitf="f";
color ccolor;
int humi;
int winddir;
String date;
String unit4 = "F";
String unit5 = "C";
String unitmph = "mph";
int low;
int high;


void setup()
{
  size(600, 750);
  smooth();
  colorMode(HSB, 360, 100, 100);

  color baseColor = color(0);
  ccolor = baseColor;


    

  font2 = loadFont("VAGRoundedStd-Thin-18.vlw");
  updateWoeid2(input);
  updateWeather2(input, unitf);
  
  font3 = loadFont("VAGRoundedStd-Thin-72.vlw");
  


 
}

void draw()
{
  noStroke();


  
  fill(43,5,93);
  rect(0, 0, width, height);
  b = loadImage("back.jpg");
  image(b,0,0);
    
    //////
    
    
   fill(360,45,99);
  rect(0,27,300,55);
    
     fill(340,45,99);
  rect(0,82,300,55);
  
     fill(320,45,99);
  rect(0,137,300,55);
  
  
      fill(300,45,99);
  rect(0,192,300,55);
  
  
      fill(280,45,99);
  rect(0,247,300,55);
  
  
      fill(260,45,99);
  rect(0,302,300,55);
  
    
      fill(240,45,99);
  rect(0,357,300,55);
  
  
      fill(220,45,99);
  rect(0,412,300,55);
  
 
    
    fill(180,45,99);
  rect(0,466,300,50);
  
  
    if (temp <= 0){ 
      fill(temp-140,50,99);                //big ellipse
            }else{
    
  fill(temp+260,50,99);}                //big ellipse
  
  
  ellipse(width/2, 270, 490, 490);
    
    
  

  fill(43, 5, 93);
  ellipse(width/2, 270, 200, 200); //inner
  


noFill();
 ellipse(width/2, 270, 245, 245);
 
 px=width/2+cos(radians(winddir+270))*(radius/2);
 py=270+sin(radians(winddir+270))*(radius/2);


 

fill(43,5,93);
ellipse(px,py,35,35);
stroke(43,5,93);
strokeWeight(5);
line(width/2,270,px,py);


  


  pushMatrix();
  fill(100);
  textAlign(LEFT, LEFT);
  textFont(font2, 18);
  
  
  textFont(font2,12);
  text("Updated "+date,70,730);

  textFont(font2, 24);
  text("Location: "+input, 70, 570);
  
  textFont(font2, 14);
  text(date,165,600);
  textFont(font2, 14);
  text("latitude "+lat + ", "+"longtitude "+longt, 165,620);
  
  
  textFont(font2, 14);
  text(condt, 165, 660);
  
  textFont(font2, 14);
  text("low "+low +"°F, "+ "high "+high+"°F", 165,680);
  

  
  textFont(font2, 14);
  text("Humidity " + humi + "%", 165,640);
  
    fill(130);
  ellipse(300,675,22,22);
 fill(43,5,93); 
 textSize(12);
 text("C°",296,680);
 

  popMatrix();


fill(43,5,93);
textFont(font2, 14);
text("N", width/2, 160);
text("S", width/2, 390);
text("W",180, 275);
text("E",410, 275);

noStroke();
fill(160);
ellipse(440,585,100,100);

if (dist(mouseX,mouseY,450,570)<(50)){
 fill(100);
ellipse(440,585,100,100);
textSize(14);
fill(100);
text(tcond, 404,655);
text("low "+tlow +"°F, "+ "high "+thigh+"°F", 404,675);


}


textSize(18);
fill(43,5,93);
text("tomorrow",404,595);




textSize(14);
 if (dist(mouseX,mouseY,300,675)<25){
    fill(100);
  text("low "+(low-32)*5/9 +"°C,"+" high "+(high-32)*5/9 +"°C", mouseX+5, mouseY+30);

 }
 

  if ( dist(mouseX,mouseY, px,py) <35)
  {

 
fill(100);
 text("wind direction: "+winddir+"°", mouseX+5, mouseY+30);
 text("wind speed: "+wind+unitmph,mouseX+5,mouseY+45);
  
}



  if ( dist(mouseX,mouseY, width/2,270) <70)
  {
    fill(100);
  text((temp-32)*5/9 +"°C", mouseX+5, mouseY+30);
  }







if ((mouseX>70)&&(mouseX<165)&&(mouseY>550)&&(mouseY<620))

{
  fill(0,45,99);
  text("please enter", mouseX-25, mouseY+30);
    text("city name", mouseX-25, mouseY+48);
}

  fill(360,99,99);
text("140F° / 60°C", 70, 60);
  fill(180,79,71);
text("-40F° / -40°C", 70, 495);

fill(100);
textSize(24);
text("today", 275,330);




  pushMatrix();
  fill(100);
  textAlign(LEFT, LEFT);
  textFont(font3, 72); ///////////

  if (unitf == "f") { 
    text(temp + "°F", 230, 300);
    unitmph = "mph";
  }
  else {
    text(temp + "°C", 50, 550);
    unitmph = "km/h";
  }

  popMatrix();
  
  



  

}



String getCity(String _url)
{
  String city2 = "where is that place?";

  try {
    report = new XMLElement(this, _url);
  XMLElement[] city = report.getChildren("results/matches/match/place/name");
  for (int i=0; i<city.length; i++)
  {
    city2 = city[i].getContent();
  }
  }

  catch (Exception e) {
    city2 = "Can't find it.";
  }

  return city2;
}

String getWeoid(String _url)
{
  String woeid2 = "what is the number?";
  report = new XMLElement(this, _url);
  XMLElement[] woeid = report.getChildren("results/matches/match/place/woeId");
  for (int i=0; i<woeid.length; i++)
  {
    woeid2 = woeid[i].getContent();
  }

  try {
  }

  catch (Exception e) {
    woeid2 = "Can't find it.";
  }
 
  return woeid2;
}

void updateWoeid2(String _input) {
  String url = "http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20geo.placemaker%20%20%0A%20%20%20%20WHERE%20documentContent%20%3D%20%22"+_input+"%22%0A%20%20%20%20AND%20documentType%3D%22text%2Fplain%22&diagnostics=true";
  woeid2 = getWeoid(url);
  city2 = getCity(url);
}

String getWeather(String _url)
{
  String weatherStream="null!";

  try {
    XMLElement weather0 = new XMLElement(this, _url);

    city = weather0.getChild("channel/yweather:location").getString("city");
    temp = weather0.getChild("channel/item/yweather:condition").getInt("temp");
    wind = weather0.getChild("channel/yweather:wind").getInt("speed");
    condt = weather0.getChild("channel/item/yweather:condition").getString("text");
    condc = weather0.getChild("channel/item/yweather:condition").getInt("code");
    date = weather0.getChild("channel/item/yweather:condition").getString("date");
    humi = weather0.getChild("channel/yweather:atmosphere").getInt("humidity");
   lat = weather0.getChild("channel/item/geo:lat").getContent();
   longt = weather0.getChild("channel/item/geo:long").getContent();
   winddir = weather0.getChild("channel/yweather:wind").getInt("direction");
    low = weather0.getChild("channel/item/yweather:forecast").getInt("low");
   high = weather0.getChild("channel/item/yweather:forecast").getInt("high");

    tcond = weather0.getChild("channel/item/yweather:forecast").getString("text");
    tlow = weather0.getChild("channel/item/yweather:forecast").getInt("low");
     thigh = weather0.getChild("channel/item/yweather:forecast").getInt("high");
    weatherStream = city + " " + temp + " " + wind + " " + condc + " " + date + " " + humi;
  }

  catch (Exception e) {
    weatherStream = "Re type the number please";
  }
  println (weatherStream);
  return weatherStream;
}


void updateWeather2(String _woeid2, String _unitf) {
  String url = "http://weather.yahooapis.com/forecastrss?w="+woeid2+"&u="+unitf+"";
  println("unitf is " + unitf);
  weatherStream = getWeather(url);
}





void keyPressed()
{
  if ((key == BACKSPACE) &&(input.length()>0))
  {
    input = input.substring(0, input.length()-1);
  }

  else if ((key == RETURN) || (key == ENTER))
  {
    updateWoeid2(input);
    updateWeather2(input, unitf);
  }

  else if ((key == ' '))
  {
    input = input+"_";
  }

  else
  {
    input = input +key;
  }
}





