
//Andrew Herman
//Sunday, April 18th
//Adding Weather
//NMD102

//Sets the Radius and angle of the Suns Arc.
int radius = 600; 
int theta = 90; 
//Pulls the images into the program for use.
PImage b;
PImage c;
PImage a; 
PImage d; 
PImage e;
PImage z;
PImage g;
PImage m;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
//Floats the different variables.
float runtime;
float time = 0;
float percentage = 0;
float x,y;
//Pulls the font into the program for use.
PFont f;
//Declares the variabele "zips"
String zips = "";
//Declares the int for the counter variable.
int counter = 0;
//Declares the Weather Grabber Class.
WeatherGrabber wg;

void setup(){
  //Size of the screen
  size(800,600);
  //Loads the images into Processing.
  b = loadImage("sun.png");
  c = loadImage("8tree copy.png");
  a = loadImage("house.png");
  d = loadImage("black.png");
  e = loadImage("grass.png");
  z = loadImage("moon.png");
  g = loadImage("cloud.png");
  //Declares the variable "wg" as a function of Weather Grabber
  wg = new WeatherGrabber(zips);
  wg.requestWeather();
  //Creates the font Arial Black 16 so Processing knows how to draw it.
  f = createFont( "Arial-Black-16" ,16,true);
}

void draw(){
  //Updates the time.
  updateTime();
  //Background color
  background(135,206,250);
  //Declares that if the time is greater than 30 seconds, the background color will change.
  if(time > 30){
    background(4,12,22);
  }
  else{
    x = x + 0.4; 
    //If the time is less than 30 seconds, the sun will make an arc with those declared bezier points.
    if(time < 30){
      ellipseMode(CENTER);
      float percent = constrain((25 - time) / 25, 0,1);
      float x = bezierPoint(-150,200,600,950,percent);
      float y = bezierPoint(150,000,00,600,percent);
      image(b,x,y);
    }
    //Otherwise, the moon will make an arc with those declared bezier points.
    else{
      ellipseMode(CENTER);
      float percent = constrain((55 - time) / 25, 0,1);
      float x = bezierPoint(-150,200,600,950,percent);
      float y = bezierPoint(150,000,00,600,percent);
      image(z,x,y);
    }
  }
  //Create the stars so they "Sparkle"
  //If the time is greater than 30 Seconds the stars have the following characteristics
  if(time > 30){
    fill(255);
    ellipse(100,100,5,5);
    fill(255);
    ellipse(200,50,5,5);
    fill(255);
    ellipse(20,200,5,5);
    fill(255);
    ellipse(300,70,5,5);
    fill(255);
    ellipse(600,15,5,5);
    fill(255);
    ellipse(52,35,5,5);
    fill(255);
    ellipse(500,10,5,5);
    fill(255);
    ellipse(225,32,5,5);
    fill(255);
    ellipse(120,90,5,5);
    fill(255);
    ellipse(30,60,5,5);
    fill(255);
    ellipse(163,250,5,5);
    fill(255);
    ellipse(42,300,5,5);
    fill(255);
    ellipse(400,50,5,5);
    fill(255);
    ellipse(700,100,5,5);
    fill(255);
    ellipse(350,300,5,5);
    fill(255);
    ellipse(82,53,5,5);
    fill(255);
    ellipse(600,100,5,5);
    fill(255);
    ellipse(550,33,5,5);
    fill(255);
    ellipse(230,200,5,5);
    fill(255);
    ellipse(775,90,5,5);
    fill(255);
    ellipse(600,450,5,5);
    fill(255);
    ellipse(200,320,5,5);
    fill(255);
    ellipse(600,375,5,5);
    fill(255);
    ellipse(200,260,5,5);
    fill(255);
    ellipse(200,100,5,5);
    fill(255);
    ellipse(350,75,5,5);
    fill(255);
    ellipse(432,200,5,5);
    fill(255);
    ellipse(600,320,5,5);
    fill(255);
    ellipse(485,468,5,5);
    fill(255);
    ellipse(100,30,5,5);
    fill(255);
    ellipse(360,10,5,5);
    fill(255);
    ellipse(460,300,5,5);
    fill(255);
    ellipse(760,325,5,5);
    fill(255);
    ellipse(480,100,5,5);
    fill(255);
    ellipse(123,356,5,5);
    fill(255);
    ellipse(736,400,5,5);
    fill(255);
    ellipse(500,20,5,5);
    fill(255);
    ellipse(562,36,5,5);
    fill(255);
    ellipse(800,100,5,5);
    fill(255);
    ellipse(360,450,5,5);
    fill(255);
    ellipse(100,100,5,5);
    fill(255);
    ellipse(765,362,5,5);
    fill(255);
    ellipse(200,432,5,5);
    fill(255);
    ellipse(686,260,5,5);
    fill(255);
    ellipse(598,162,5,5);
    fill(255);
    ellipse(258,163,5,5);
    fill(255);
    ellipse(760,150,5,5);
    fill(255);
    ellipse(402,350,5,5);
    fill(255);
    ellipse(532,32,5,5);
    fill(255);
    ellipse(621,20,5,5);
  }
  //If time is greater than 30.2 seconds the stars have the following characteristics
  if(time > 30.2){
    fill(0);
    ellipse(100,100,5,5);
    fill(0);
    ellipse(600,100,5,5);
    fill(0);
    ellipse(550,33,5,5);
    fill(0);
    ellipse(230,200,5,5);
    fill(0);
    ellipse(775,90,5,5);
    fill(0);
    ellipse(600,450,5,5);
  }
  //If time is greater that 30.4 seconds, the stars have the following characteristics
  if(time > 30.4){
    fill(255);
    ellipse(100,100,5,5);
    fill(255);
    ellipse(600,100,5,5);
    fill(255);
    ellipse(550,33,5,5);
    fill(255);
    ellipse(230,200,5,5);
    fill(255);
    ellipse(775,90,5,5);
    fill(255);
    ellipse(600,450,5,5);
  }
  //If time is greater than 39.2 seconds, the stars have the following characteristics
  if(time > 39.2){
    fill(0);
    ellipse(686,260,5,5);
    fill(0);
    ellipse(598,162,5,5);
    fill(0);
    ellipse(258,163,5,5);
    fill(0);
    ellipse(760,150,5,5);
    fill(0);
    ellipse(402,350,5,5);
    fill(0);
    ellipse(532,32,5,5);
    fill(0);
    ellipse(621,20,5,5);
  }
  //If time is greater than 39.4 seconds, the stars have the following characteristics
  if(time > 39.4){
    fill(255);
    ellipse(686,260,5,5);
    fill(255);
    ellipse(598,162,5,5);
    fill(255);
    ellipse(258,163,5,5);
    fill(255);
    ellipse(760,150,5,5);
    fill(255);
    ellipse(402,350,5,5);
    fill(255);
    ellipse(532,32,5,5);
    fill(255);
    ellipse(621,20,5,5);
  }
  //If the time is greater than 45 seconds, the stars have the following characteristics
  if(time > 45){
    fill(0);
    ellipse(100,100,5,5);
    fill(0);
    ellipse(200,50,5,5);
    fill(0);
    ellipse(20,200,5,5);
    fill(0);
    ellipse(300,70,5,5);
    fill(0);
    ellipse(600,15,5,5);
    fill(0);
    ellipse(52,35,5,5);
    fill(0);
    ellipse(500,10,5,5);
  }
  //If the time is greater than 45.2 seconds the stars have the following characteristics
  if(time > 45.2){
    fill(255);
    ellipse(100,100,5,5);
    fill(255);
    ellipse(200,50,5,5);
    fill(255);
    ellipse(20,200,5,5);
    fill(255);
    ellipse(300,70,5,5);
    fill(255);
    ellipse(600,15,5,5);
    fill(255);
    ellipse(52,35,5,5);
    fill(255);
    ellipse(500,10,5,5);
  }

  //Sets the area for the Grass
  fill(34,139,34);
  rect(0,450,800,150);

  //Places the tree to the right of the house
  image(c,625,200,242,281);
  //Make the windows turn on and off
  //Draws the windows
  fill(120,140,167);
  rect(360,247,275,100);
  fill(120,140,167);
  rect(100,270,275,100);
  fill(120,140,167);
  rect(370,375,275,100);
  fill(120,140,167);
  rect(275,400,50,50);
  //If time is greater than 30 seconds, the windows have the following characteristics
  if(time > 30){
    fill(0);
    rect(360,247,275,100);
    fill(0);
    rect(100,270,275,100);
    fill(255,255,0);
    rect(370,375,275,100);
    fill(0);
    rect(275,400,50,50);
  }
  //If time is greater than 34 seconds, the windows have the following characteristics.
  if(time > 34){
    fill(0);
    rect(370,375,275,100);
    fill(255,255,0);
    rect(275,400,50,50);
  }
  //If the time is greater than 38 seconds, the windows have the following characteristics
  if(time > 38){
    fill(0);
    rect(275,400,50,50);
    fill(255,255,0);
    rect(360,247,275,100);
    fill(255,255,0);
    rect(100,270,275,100);
  }
  //If the time is greater than 40 seconds, the windows have the following characteristics
  if(time > 40){
    fill(0);
    rect(360,247,275,100);
  }
  //If the time is greater than 45 seconds, the windows have the following characteristics
  if(time > 45){
    fill(0);
    rect(100,270,275,100);
  }
  //Draws the house image
  image(a,0,75,800,588);
  //Draws the grassblade images
  image (e,20,465,50,50);
  image (e,75,504,50,50);
  image (e,200,522,50,50);
  //Sets the weather string to get the weather from the Weather Grabber class, which gets it from Yahoo.com
  String weather = wg.getWeather();
  //Sets the temperature integer
  int temp = wg.getTemp();
  //Declares the text Font variable
  textFont(f);
  //Declares the text fill color
  fill(255);
  //Draws the words at the location given
  text(zips,20,590);
  text(weather,20,570);
  text(temp,20,520);
  text("Click to accept zip." ,100,590);
  //Creates the themometer 
  //No stroke
  stroke(0);
  //Red Fill
  fill(255,0,0);
  //Sets the size according to Yahoo's given temperature
  rect(20,530,temp*2,20);
  //Sets up the Strings 1-14 to different weather conditions
  String str1 = weather;
  String str2 = "Tornado";
  String str3 = "Hurricane";
  String str4 = "Thunderstorms";
  String str5 = "Rain";
  String str6 = "Showers";
  String str7 = "Snow";
  String str8 = "Cloudy";
  String str9 = "Mostly Cloudy";
  String str10 = "Partly Cloudy";
  String str11 = "Heavy Snow";
  String str12 = "Heavy Rain";
  String str13 = "Fair";
  String str14 = "Light Rain";
  //Checks to see if the "weather" string is equal to any of the other strings 
  //and if it is, draws the temperature, themometer, condition, and a picture of the condition
  if(str1.equals(str13) == true){
    m = loadImage("fair.gif");
    x = x + 0.4;
    image(m,x,y);
  }
  else if(str1.equals(str2) == true){
    h = loadImage("tornado.gif");
    image(h, 0 ,0);
  }
  else if(str1.equals(str3) == true){
    i = loadImage("rain.gif");
    image(i, 0, 10);
    image(i, 470, 10);
  }
  else if(str1.equals(str4) == true){
    j = loadImage("thunder.gif");
    image(j, 0, 10);
    image(j, 470, 10);
  }
  else if(str1.equals(str5) == true){
    i = loadImage("rain.gif");
    image(i, 0, 10);
    image(i, 470, 10);
  }
  else if(str1.equals(str6) == true){
    i = loadImage("rain.gif");
    image(i, 0, 10);
    image(i, 470, 10);
  }
  else if(str1.equals(str7) == true){
    k = loadImage("snow.gif");
    image(k, 0, 10);
    image(k, 470, 10);
  }
  else if(str1.equals(str8) == true){
    l = loadImage("cloudy.gif");
    image(l, 0, 0);
    image(l, 130, 0);
    image(l, 260, 10);
    image(l, 270, 0);
    image(l, 400, 10);
    image(l, 500,10);
    image(l, 600, 0);
    image(l, 700, 10);
    image(l, 800,0);
  }
  else if(str1.equals(str9) == true){
    l = loadImage("cloudy.gif");
    image(l, 0, 0);
    image(l, 130, 0);
    image(l, 260, 10);
    image(l, 270, 0);
    image(l, 500,10);
    image(l, 800,0);
  }
  else if(str1.equals(str10) == true){
    l = loadImage("cloudy.gif");
    image(l, 270, 0);
    image(l, 400, 10);
    image(l, 600, 0);
  }
  else if(str1.equals(str11) == true){
    k = loadImage("snow.gif");
    image(k, 0, 10);
    image(k, 470, 10);
    image(k, 200,10);
    image(k, 700, 10);
  }
  else if(str1.equals(str12) == true){
    i = loadImage("rain.gif");
    image(i, 0, 10);
    image(i, 470, 10);
    image(i, 500,10);
    image(i, 700,10);
    image(i, 200,10);
  }
  else if(str1.equals(str14) == true){
    i = loadImage("rain.gif");
    image(i, 0, 10);
    image(i, 470, 10);
  }
  //Prints the time
  println(time);
}
//Allows the user to enter a zip code for acceptance.
void keyPressed(){
  if( ((key>='A')&&(key<='Z')) || ((key>='a')&&(key<='z')) || ((key>='0')&&(key<='9')) ){
    zips+= key;
    println( zips );
  }
}
void mousePressed() {
  // Increment the counter and get the weather at the next zip code
  //counter = (counter + 1) % zips.length;
  wg.setZip(zips);
  // The data is requested again with a new zip code every time the mouse is pressed.
  wg.requestWeather();
  zips = ""; 
}

//Updates the time so it is in millis.
void updateTime(){
  int mil = millis();
  if(mil - runtime >= 1000){
    runtime = mil;
    time++;
    time=floor(time);
    if(time >= 60) time = 0;
  } 
  else {
    float decimal = float(mil) - runtime;
    time = floor(time) + (decimal / 1000);
  }
  percentage = time / 30;
}






