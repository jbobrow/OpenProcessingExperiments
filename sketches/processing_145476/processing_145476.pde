
/* Project 2 - Art Cartography
** Written by Nicole Lee
** Credits to Alison Ho & Xiaoyang
** Feb 2014 
** Artist's Statement: THIS IS A MAP OF MY LIFE. I have put together my 21 years of life into a map of Hong Kong. I chose HK because I grew up mostly in Hong Kong.I decided to display my map of life in layers with a different category because I think this will provide a dissection of my life. */

String [] filenames = { "star.png", "state.png", "childhood.png" , "develop.png" , "fun.png" , "project.png" , "school.png" , "pic.png","plane.png", "logo1.png","logo2.png","logo3.png"};
PImage [] pics= new PImage[12];
PImage bg;
PImage name;
int i;
int a;

float grow = 0; 

void setup() {

  size(900, 600, P3D);
 for (int a=0; a<=11; a=a+1){
bg = loadImage("bg.jpg"); 
name = loadImage("name.png"); 
pics[a] = loadImage (filenames[a]);
 imageMode(CENTER);
 }
  }

void draw() {
background (bg);
    grow += 1.0;
translate(width/2, height/2 );

rotateX(radians(grow));
  for( i=0; i<12 ;i=i+1) {   
pushMatrix();  
  translate(0,0,i*20);
  image(pics[i], 0, 0);
 
  translate(0,0,-100);
  image(name, 0, 0);
popMatrix(); 
  }
translate(-width/2, -height/2 );
  }

void keyPressed() {
  final int STOP = keyCode;

  if (STOP == 'N')
    if (looping)  noLoop();
    else          loop();
}



