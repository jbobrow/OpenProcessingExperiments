
//modify the code to create an interesting clock
//time - millis (), second (), minute (), hours ()
PImage myturtle, mycheetah, myrabbit; //declare my images
PFont myfont;
int myspacing;
color bgCol = color(50, 200, 50);
 
void setup(){
  size(500, 500);
  myspacing = 100;
  
  mycheetah = loadImage("mycheetah.png"); //load my images
  myrabbit = loadImage("myrabbit.png");
  myturtle = loadImage("myturtle.png");
  
  myfont = loadFont("BaskervilleSerial-48.vlw");
}
 
void draw(){

  background(bgCol);
  strokeWeight(10);
  stroke(255,0,0);
  line(20, 0, 20, height);
  line(480, 0, 480, height);
  text("Start!", 50, 20);
  text("Finish!", 420, 20);
  //processing already knows millis, second, minute, hour
  int ms = millis();
  int s = second(); //value from 0-59
  int m = minute();//values from 0-59
  int h = hour(); //values from 0-23
  float newS = map(s, 0, 59, 0, width); //this float maps the s value to the width of the screen
  float newM = map(m, 0, 59, 0, width); //this float maps the m value to the width of the screen
  float newH = map(h, 0, 59, 0, width); //this float maps the h value to the width of the screen
   
  //seconds
  image(mycheetah, newS, myspacing);
   //minutes
  image(myrabbit, newM, myspacing*2);
  //hours
  image(myturtle, newH, myspacing*3);

  
 
println ("MS = " + ms + ", S = "+ s + ", M = " + m + ", H = " + h);
 
}



