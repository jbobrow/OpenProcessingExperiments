
int radius;
float bob;
color myColor;

PImage img;
PFont  a;
void setup (){
  background(255,255,255);
  size(800,600);

 img = loadImage("2.jpg");
 a= loadFont("Verdana-BoldItalic-80.vlw");
  }

  

void draw(){
background(255,255,255);
int i = 0 ; i++;
image(img ,random(800) , random(600) , 200, 200); 
fill(50);
float sinOfTime = sin( millis() * 0.007 );
  float sinMappedX = map( sinOfTime, -1.0, 1.0, 40, 80 );
 

textFont(a,sinMappedX);
text("can you catch me ", 50,500); 




}



