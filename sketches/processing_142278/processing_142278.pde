
/*
Konkuk University
SOS iDesign

Name:201420106 JEONG eunyeah 
ID: 201420106 JEONG eunyeah 

*/


import ddf.minim.*;

Minim minim;

AudioInput in;

float volume = 0;
float volumeF = 0;

void setupAudio(){
minim = new Minim(this);
in = minim.getLineIn(Minim.MONO, 512);
}

void getVolume(){
volumeF = in.right.level()*1000;
volume = 0.8*volume + 0.8*volumeF; 
}

void stop(){
in.close();
minim.stop();
super.stop();
}

int value = 0;



void setup(){
  setupAudio();
size (600, 600);
background(#E6FF83);
// noLoop();
smooth();
}

void draw(){
  
  println(mouseX + " : " + mouseY);
   colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);

  //hair
  stroke(0);
  fill(127,65,28);
  noStroke();
  triangle(77,260,5,501,191,506);
  triangle(491,256,384,504,561,502);
  
  //face
  fill(238,227,174);
  ellipse(285,314,423,423);
  
  //hair
  fill(127,65,28);
  noStroke();
  bezier(75,278,72,32,499,30,498,279);
  noStroke();
  
  fill(238,227,174);
  triangle(214,137,162,285,210,284);
  triangle(285,167,257,279,286,283);
  triangle(351,173,329,284,378,285);
  triangle(451,202,429,284,472,282);
  
  //eyebrow
  stroke(0);
  strokeWeight(3);
  bezier(104,299,113,267,208,267,220,303);
  bezier(336,304,345,268,440,268,447,303);
  
  //eyes
  fill(255);
  stroke(0);


  
  float mx1 = constrain(mouseX, 360,401);
  float mx2 = constrain(mouseX, 133, 180);
  float my = constrain(mouseY,308, 349);
  
  fill(0);
  ellipse(mx1,my,32,32);
  ellipse(mx2,my,32,32);
  
  
  
  
  
if(mousePressed) {
  
  float a=random(255);
  
  fill(a);
  stroke(0);
  quad(252,424,252,461,316,461,315,424);
  stroke(0);
  line(281,424,281,461);
  
  fill(mouseX,mouseY,0);
  noStroke();
  ellipse(414,410,102,102);
  ellipse(154,410,102,102);
  
  translate(mouseX, mouseY);
  fill(a,250,25,149);
  stroke(255);
  strokeWeight(2);
  ellipse(0,0,100,100);

 } 
 getVolume(); // this call fetches the microphone volume for the current frame.
 
float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!
 
float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.
 
 //mouse
  fill(#FF2424);
  noStroke();
  bezier(362,424,352,494,227,494,215,424);
 
 //nose
  fill(238,227,174);
  stroke(0);
  bezier(252,402,260,376,303,376,313,402);
  
  fill(0);
  ellipse(269,400,X,Y);
  ellipse(297,400,Y,X);
 }
 
