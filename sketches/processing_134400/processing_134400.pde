

// Simple weather visualiser based on Daniel Shiffman "Parsing Yahoo's XML weather feed manually"
// Lee Scott 2013

//Get location codes from - http://edg3.co.uk/snippets/weather-location-codes/

//IGNORE THIS BIT
String location = "UKXX0085";   //initial location set to London.
String weather_condition = "";
String date;


// FONTS
PFont place_font;


// IMAGES
PImage map_img;
PImage sun_img;
PImage sun_rays;
PImage sun_box;
PImage flake_img;
PImage cloud1;
PImage cloud2;
PImage cloud3;
PImage cloud4;
PImage cloud5;
PImage cloud_1;
PImage cloud_2;
PImage cloud_3;
PImage rain_img;
PImage rain_box;
PImage snow_img;
PImage snow_box;
PImage cloud_bg;
PImage snow_bg;
PImage wind_bg;
PImage rain_bg;
PImage sun_bg;


// INTEGERS / FLOATS
float sun_x = 0;
float sun_x2 = 0;
int rays_a = 50;
int ray_pos_neg = 0;

int wind_x = -40;
int wind_x2 = 140;
int wind_x3 = 280;

int wind_z =-50;
int wind_z2 =10;
int wind_z3 =-70;
int wind_z4 =190;
int wind_z5 =-100;
int wind_z6 =-190;
int wind_z7 =80;

int cloud_x =-90;
int cloud_x2 =250;
int cloud_x3 =90;
int cloud_x4 =230;
int cloud_x5 =50;

int rain_img_y=-30;
int rain_a = 50;
int rain_pos_neg = 0;
int rain_y =-40;

int snow_y =0;
float snow_x = 0;
int snow_a = 50;
int snow_pos_neg = 0;

int pin = 5;

float degree = 0;

//int c = 0;


// The WeatherGrabber gets all the weather information for us. Do not amend the WeatherGrabber. 
//If you want alternative data ask how to get it.
WeatherGrabber wg; //DO NOT CHANGE - IGNORE THIS BIT


void setup() {
wg = new WeatherGrabber(location);  // DO NOT CHANGE - IGNORE THIS BIT

//frameRate(60);

size(400,800);

place_font = loadFont("Blanch120.vlw");

map_img = loadImage("Map.png");
sun_img = loadImage("Sun.png");
sun_rays = loadImage("Sun_Rays.png");
sun_box = loadImage("Sun_Box.png");
flake_img = loadImage("Flake.png");
cloud1 = loadImage("Cloud1.png");
cloud2 = loadImage("Cloud2.png");
cloud3 = loadImage("Cloud3.png");
cloud4 = loadImage("Cloud4.png");
cloud5 = loadImage("Cloud5.png");
cloud_1 = loadImage("Cloud_1.png");
cloud_2 = loadImage("Cloud_2.png");
cloud_3 = loadImage("Cloud_3.png");
rain_img = loadImage("Rain.png");
rain_box = loadImage("Rain_Box.png");
snow_img = loadImage("Snow_Img.png");
snow_box = loadImage("Snow_Box.png");

cloud_bg = loadImage("Cloud_BG.png");
snow_bg = loadImage("Snow_BG.png");
wind_bg = loadImage("Wind_BG.png");
rain_bg = loadImage("Rain_BG.png");
sun_bg = loadImage("Sun_BG.png");

}


void draw() {
  
  wg.setlocation(location); // DO NOT CHANGE - IGNORE THIS BIT
  wg.requestWeather();  // DO NOT CHANGE - IGNORE THIS BIT
  
  //IMPORTANT: THESE ARE THE VARIABLES YOU WILL NEED TO USE!
  String place  =wg.getPlace();
  String date  =wg.getDate();
  String weather_condition = wg.getWeather();
  int temp = wg.getTemp();
  int windspeed = wg.getWind();
  int humidity = wg.getHumidity();
  
  
//  WEATHER OVERRIDE:

//  weather_condition = "wind";

//  if (keyCode==49){
//    weather_condition = "snow";
//  }
//    if (keyCode==50){
//    weather_condition = "wind";
//  }
//    if (keyCode==51){
//    weather_condition = "rain";
//  }
//    if (keyCode==52){
//    weather_condition = "cloud";
//  }
//    if (keyCode==53){
//    weather_condition = "sun";
//  }
  
  
  //---------START YOUR CODING HERE---------//
  //CREATE YOUR DRAWING HERE USING IF STATEMENTS AND BY CALLING FUNCTIONS
  
  if (weather_condition=="cloud"){
    cloud();
  }
  if (weather_condition=="rain"){
    rain();
  }
  if (weather_condition=="sun"){
    sun();
  }
  if (weather_condition=="snow"){
    snow();
  }
  if (weather_condition=="wind"){
    wind();
  }
  
  smooth();
  image (map_img,44,410);
  
  
  //ADD TEXT ON TOP OF EVERYTHING ELSE
  fill(255,255,255);
  textAlign(RIGHT);
  textFont(place_font, 40);
  text(windspeed, 352, 506);
  textFont(place_font, 40);
  text(humidity, 352, 457);
  textAlign(CENTER);
  textFont(place_font, 112);
  text(place, width/2, 290);
  textFont(place_font, 72);
  text(temp, 130, 365);
  textFont(place_font,72);
  text(weather_condition, 250, 365);
  textFont(place_font, 50);
  text("f", 165, 355);
  textFont(place_font,24);
  text(date,width/2,765);

  if (pin==1) {
  fill(255,0,0);
  ellipse(225,508,10,10);
}
  if (pin==2) {
  fill(255,0,0);
  ellipse(178,539,10,10);
}
  if (pin==3) {
  fill(255,0,0);
  ellipse(278,549,10,10);
}
  if (pin==4) {
  fill(255,0,0);
  ellipse(222,650,10,10);
}
  if (pin==5) {
  fill(255,0,0);
  ellipse(305,660,10,10);
}
  
  
// CONVERT TO CELSIUS 
 
//[°C] = ([°F] − 32) × 5⁄9
//
//c = ((temp - 32) x5/9);
//c = temp2;


//stroke(0,0,0,0);
//fill(x,y,z);
//rect(100,780,200,3);

}

  

// CLOUD
void cloud(){
background(167,169,172);
  image(cloud_bg,-1,0);
  image(cloud1,cloud_x,80);
  image(cloud2,cloud_x2,70);
  image(cloud3,cloud_x3,30);
  image(cloud4,cloud_x4,20);
  image(cloud5,cloud_x5,15);

cloud_x = cloud_x +  5;
if (cloud_x>400)
   {cloud_x=-170;}
   
cloud_x2 = cloud_x2 +  4;
if (cloud_x2>400)
   {cloud_x2=-140;}
   
cloud_x3 = cloud_x3 +  3;
if (cloud_x3>400)
   {cloud_x3=-100;}
   
cloud_x4 = cloud_x4 +  2;
if (cloud_x4>400)
   {cloud_x4=-100;}
   
cloud_x5 = cloud_x5 +  1;
if (cloud_x5>400)
   {cloud_x5=-100;}


stroke(0,0,0,0);
fill(204,204,204);
rect(45,315,310,3);
rect(45,378,310,3);
rect(110,775,180,2);

}


// RAIN
void rain(){
background(0,74,128,255);  
  image(rain_bg,-1,0);

tint(255,rain_a);
  image(rain_img,65,rain_img_y);
tint(255,255);
  image(rain_box,0,160);


stroke(0,0,0,0);
fill(0,174,239);
rect(45,315,310,3);
rect(45,378,310,3);
rect(110,775,180,2);

rain_img_y = rain_img_y +  10;
if (rain_img_y>=10)
   { rain_img_y=-30;}
   
if (rain_pos_neg==1)
   { rain_a = rain_a + 20;}
 
if (rain_pos_neg==2)
   { rain_a = rain_a - 20;}
 
if (rain_a == 250)
    { rain_pos_neg=2; } 
if (rain_a == 50)
    { rain_pos_neg=1; } 

}



// SNOW
void snow(){
background(144,215,236); 
  image(snow_bg,-1,0);
smooth();

tint(255,snow_a);
  image(snow_img,43,snow_y);
tint(255,255);

  image(snow_box,40,162);

stroke(0,0,0,0);
fill(255,255,255);
rect(45,315,310,3);
rect(45,378,310,3);
rect(110,775,180,2);


translate(200,112);
rotate(snow_x);

  image(flake_img,-82.5,-82.5);

rotate(-snow_x);
translate(-200,-112);

snow_x = snow_x - 0.05;

snow_y = snow_y +  4;
if (snow_y>=49)
   {snow_y=0;}
   
 if (snow_pos_neg==1){
 snow_a = snow_a + 20;
 }
 if (snow_pos_neg==2){
 snow_a = snow_a - 20;
 }
 
 if (snow_a == 250)
    { snow_pos_neg=2; } 
 if (snow_a == 50)
    { snow_pos_neg=1; } 

}


// WIND
void wind(){
background(0,74,128);
  image(wind_bg,-1,0);

stroke(0,0,0,0);
fill(144,215,236);
rect(45,315,310,3);
rect(45,378,310,3);
rect(110,775,180,2);

//

fill(230,230,230);
rect(wind_z,55,40,3);
rect(wind_z3,145,70,4);
rect(wind_z5,40,60,2);
rect(wind_z7,180,90,3);

stroke(0,0,0,0);
fill(144,215,236);
rect(wind_z2,95,80,3);
rect(wind_z4,200,30,4);
rect(wind_z6,110,30,2);


  image(cloud_1,wind_x,30);
  image(cloud_2,wind_x2,35);
  image(cloud_3,wind_x3,30);


wind_x = wind_x +  8;
if (wind_x>400)
   {wind_x=-130;}
   
wind_x2 = wind_x2 +  5;
if (wind_x2>400)
   {wind_x2=-130;}
   
wind_x3 = wind_x3 +  8;
if (wind_x3>400)
   {wind_x3=-130;}
   
//   

wind_z = wind_z +  15;
if (wind_z>400)
   {wind_z=-90;}
   
wind_z2 = wind_z2 +  25;
if (wind_z2>400)
   {wind_z2=-90;}
   
wind_z3 = wind_z3 +  21;
if (wind_z3>400)
   {wind_z3=-90;}
   
wind_z4 = wind_z4 +  12;
if (wind_z4>400)
   {wind_z4=-90;}
   
wind_z5 = wind_z5 +  18;
if (wind_z5>400)
   {wind_z5=-90;}
   
wind_z6 = wind_z6 +  12;
if (wind_z6>400)
   {wind_z6=-90;}
   
wind_z7 = wind_z7 +  28;
if (wind_z7>400)
   {wind_z7=-90;}
    
    
//wind_x = sin(+5);
   
} 

// SUN
void sun(){
textAlign(CENTER);
background(30,144,255); 
  image(sun_bg,-1,0);
smooth();


stroke(0,0,0,0);
fill(255,242,0);
rect(45,378,310,3);
rect(110,775,180,2);



translate(200,111);
rotate(sun_x2);

tint(255,rays_a);
  image(sun_rays,-170,-170);
tint(255,255);


rotate(-sun_x2);
translate(-200,-111);

  image(sun_box,0,150);
  
translate(200,110);
rotate(sun_x);

  image(sun_img,-82.5,-82.5);

rotate(-sun_x);
translate(-200,-110);

fill(255,242,0);
rect(45,315,310,3);

 sun_x = sun_x + 0.02;
 sun_x2 = sun_x2 - 0.05;
 
  if (ray_pos_neg==1){
 rays_a = rays_a + 10;
 }
 if (ray_pos_neg==2){
 rays_a = rays_a - 10;
 }
 
 if (rays_a == 250)
    { ray_pos_neg=2; } 
 if (rays_a == 50)
    { ray_pos_neg=1; } 
 
}
  


//  Locations.
//UKXX0085 = London
//UKXX0030 = Cardiff
//UKXX0098 = Newcastle
//UKXX0061 = Glasgow
//UKXX0015 = Belfast


void keyReleased(){
  if (keyCode==49){
    location = "UKXX0061";
  }
  if (keyCode==49){
    pin = 1;
  }
  if (keyCode==50){
    location = "UKXX0015";
  }
  if (keyCode==50){
    pin = 2;
  }
  if (keyCode==51){
    location = "UKXX0098";
  }
  if (keyCode==51){
    pin = 3;
  }
  if (keyCode==52){
    location = "UKXX0030";
  }
  if (keyCode==52){
    pin = 4;
  }
  if (keyCode==53){
    location = "UKXX0085";
  }
  if (keyCode==53){
    pin = 5;
  }
 
  

}
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 18-5: Parsing Yahoo's XML weather feed manually

// A WeatherGrabber class
class WeatherGrabber {
  
  int temperature = 0;
  int humidity;
  String wind = "";
  int windspeed = 0;
  int weather;
  String weather_condition;
  String location;
  String date;
  String place;

  
  WeatherGrabber(String templocation) {
    location = templocation;
  }
  
  // Set a new location code
  void setlocation(String templocation) {
    location = templocation;
  }
  
  // Get the temperature
  int getTemp() {
    return temperature;
  }
  
  //Get humidity
  int getHumidity() {
    return humidity;
  }
  
  // Get the date
  String getDate() {
    return date;
  }
  
  // Get the weather
  String getWeather() {  //1 = cloud, 2 = rain, 3 = sun, 4 = snow, 5 = windy
    if ((weather==19)||(weather==20)||(weather==21)||(weather==22)||(weather==26)||(weather==27)||(weather==28)||(weather==29)||(weather==30)||(weather==44)){ weather_condition = "cloud"; }
    else if ((weather==1)||(weather==3)||(weather==4)||(weather==8)||(weather==9)||(weather==10)||(weather==11)||(weather==12)||(weather==35)||(weather==37)||(weather==38)||(weather==39)||(weather==40)||(weather==45)||(weather==47)){ weather_condition = "rain"; }
    else if ((weather==31)||(weather==32)||(weather==33)||(weather==34)||(weather==36)){ weather_condition = "sun"; }
    else if ((weather==5)||(weather==6)||(weather==7)||(weather==13)||(weather==14)||(weather==15)||(weather==16)||(weather==17)||(weather==18)||(weather==41)||(weather==42)||(weather==43)||(weather==46)){ weather_condition = "snow"; }
    else if ((weather==0)||(weather==2)||(weather==23)||(weather==24)){ weather = 5; } else { weather_condition = "wind"; }
  return weather_condition;
  }
  
  // Get the location
  String getPlace() {
    return place;
  }
  
  // Get the wind
  int getWind() {
    return windspeed;
  }
  
  
  // Make the actual XML request
  void requestWeather() {
    // Get all the HTML/XML source code into an array of strings
    // (each line is one element in the array)
    String url = "http://xml.weather.yahoo.com/forecastrss?p=" + location;
    String[] lines = loadStrings(url);
    
    // Turn array into one long String
    String xml = join(lines, "" );
    println(xml);
    
    // Searching for weather condition
    String lookforcondition = "code=\"";
    String end = "\"";
    
    //weather (partly cloudly etc)
    weather = int(giveMeTextBetween(xml,lookforcondition,end));
    
    // Searching for temperature
    String lookfortemp = "temp=\"";
    temperature = int(giveMeTextBetween (xml,lookfortemp,end));
    
    // Searching for humidity
    String lookforhumidity = "humidity=\"";
    humidity = int(giveMeTextBetween (xml,lookforhumidity,end));
    
    // Search for date
    String lookfordate = "date=\"";
    date = giveMeTextBetween (xml,lookfordate,end);
    
    //Search for location
    String lookforlocation = "city=\"";
    place = giveMeTextBetween (xml,lookforlocation,end);
    
    //Search for wind speed (crazy method)
    String lookforwind = "direction=\"";
    wind = giveMeTextBetween (xml,lookforwind,"/>");
    wind = wind.substring(3); 
    windspeed = Integer.parseInt(wind.replaceAll("[\\D]", ""));
  
  }
  
  // A function that returns a substring between two substrings
  String giveMeTextBetween(String s, String before, String after) {
    String found = "";
    int start = s.indexOf(before);    // Find the index of the beginning tag
    if (start == - 1) return"";       // If we don't find anything, send back a blank String
    start += before.length();         // Move to the end of the beginning tag
    int end = s.indexOf(after,start); // Find the index of the end tag
    if (end == -1) return"";          // If we don't find the end tag, send back a blank String
    return s.substring(start,end);    // Return the text in between
  }
  
}


