
//import processing.xml.*;
import simpleML.*;

// Variables for temperature and weather
int temperature= -30;
String weather = " " ;
int code;
PFont f;
PImage b,w,p,g,s,sf,r,c;
boolean isWeather = false;

String beg = "it's ";
String and = "&";
String animal;

void setup() {
size(400,400);
background(255);
smooth();

f = loadFont( "Arial-Black-30.vlw" ); 


}

void draw() {

  
  if (!isWeather){
  getWeather();
 display();
  }

}
// Function that makes the weather request
void getWeather() {
String url = "http://weather.yahooapis.com/forecastrss?w=2459115";
XMLRequest req = new XMLRequest(this,url);
req.makeRequest();

}

//<yweather:condition  text="Mostly Cloudy"  code="28"  temp="54"  date="Thu, 18 Nov 2010 1:51 pm EST" /> 
void netEvent(XMLRequest ml) {
  
// Get the specific XML content 
temperature = int(ml.getElementAttributeText( "yweather:condition" , "temp" ));
weather = ml.getElementAttributeText( "yweather:condition" , "text" );
code = int(ml.getElementAttributeText( "yweather:condition" , "code" ));

isWeather = true;
}

void display(){

//assign images of animals
b=loadImage("squirrel.jpg");
w=loadImage("sun.jpg");
p=loadImage("penguin.jpg");
g=loadImage("gecko.jpg");
s=loadImage("sparrow.jpg");

//assign images of weather conditions
r=loadImage("rain2.jpg");
sf=loadImage("snow-flake.gif");
c=loadImage("clouds.jpg");

textFont(f,30);
fill(0);
println(temperature);
println(weather);

and=and+weather;
text(and, 60, 60);

if (temperature>-30 ){

//seasons
//spring
if (temperature>60 && temperature<75){
  image(s, 0, 250);
  
  
   animal="Sparrow says ";
   beg= animal+beg +temperature; 
   text(beg, 30, 30);
      
} 

//fall
if (temperature<60 && temperature>40){
  image(b, 0, 200);
  
   animal="Squirrel says ";
   beg= animal+beg+temperature; 
   text(beg, 30, 30);
   
   
} 

//summer
if(temperature >75){
  image(g, 0, 125);
  
  animal="Gecko says ";
  beg= animal+beg+temperature; 
  text(beg, 30, 30);

}


//winter
if(temperature <40){
  image(p, 0, 150);
  
  animal="Penguin says ";
  beg= animal+beg+temperature; 
  text(beg, 30, 30);

}

// weather conidition
//sunny or fair
if(code == 32 || code==34){
 
  image(w, 250, 50);

}

//rainy
if(code == 11 || code==12){
 
  image(r, 250, 50);

}

//snowy
if(code == 13 || code==14){
 
  image(sf, 250, 50);

}

//cloudy or mostly cloudy
if(code == 26 || code==27 || code==28){
 
  image(c, 225, 50);
  image(c, 360, 50);


}

//partly cloudy
if(code == 29 || code==30){
 
  image(c, 250, 100);

}


}
}

