
int[] ex = new int[0], ey = new int[0];
int drawFlag = 1; //1: drawSmile 2:drawSad

PImage bgImg;  //Inport an image as background 

import ddf.minim.*;  // Import Audio Source by Minim

Minim minim;
AudioSample smile;
AudioSample sad;
AudioPlayer bgsound;

void setup() {
  size(600, 600);
  noStroke();
  smooth();
  textFont(createFont("MarkerFelt-Wide", 20, true));
  rectMode(CENTER);

 // Load Image
 bgImg = loadImage("abstract-pattern-hd.jpg");
 image(bgImg, 0, 0, width, height);                //show the image as background

 // Setting of Audio
  minim = new Minim(this);             
  smile = minim.loadSample("button-8.mp3"); // Sound with Smile face
  sad = minim.loadSample("button-14.mp3");  // Sound with Sad face
  bgsound = minim.loadFile("freebgmusic.mp3"); // background music
  bgsound.loop();        // Loop background music
}

void draw() {
  
  for (int i=0; i<ex.length; i++) {  //draw eye
    eye(ex[i],ey[i]);
  }
  if (drawFlag == 1 && mousePressed)  // After pressed "1", click to show smile face with sound effect
    smile.trigger();
  else if (mousePressed)              // click to show smile face with sound effect
   sad.trigger();
}

void mousePressed() {
  ex = append(ex,mouseX);
  ey = append(ey,mouseY); 
 
  if (drawFlag == 1)
    drawSmile(mouseX, mouseY);
  else
   drawSad(mouseX, mouseY);
   
  println(ex.length+" ("+ex[ex.length-1]+","+ey[ey.length-1]+")");
}

void keyPressed() {
  if (key=='1')          //Press "1" to draw Smile Face
    drawFlag = 1;
  else if (key=='2')     //Press "2" to draw sad Face
    drawFlag = 2;
  
}

void drawSmile(float x, float y) {
  
  strokeWeight(4);          //Thicker stroke
  stroke(0,255,0);          //Green Color
  line(x,y, x+25, y+30);
  line(x+25, y+30, x+50, y);
  text("Let's Smile!",x-20, y+50);
  
}

void drawSad(float x, float y) {
  
  strokeWeight(4);        //Thicker stroke
  stroke(255,0,0);        //Red Color
  line(x-10,y-40, x+25, y-25);
  line(x+25, y-25, x+60, y-40);
  text("Don't Angry!",x-20, y+50);
 
}

void eye(int x, int y) {
  
  noStroke();
  fill(255);
  ellipse(x, y, 60, 60);
  fill(255);
  ellipse(x+50, y, 60, 60);
  
  //Setting of rounding eye
  
  float dx = map(mouseX-x,0,width,0,10);    
  float dy = map(mouseY-y,0,height,0,10);
  
  strokeWeight(1);
  smooth();
  fill(0);                          
  ellipse(x+dx, y+dy, 30, 30);
  fill(255);
  ellipse(x+dx*2, y+dy*2, 6, 6);
  
  fill(0);
  ellipse(x+dx+50, y+dy, 30, 30);
  fill(255);
  ellipse(x+dx*2+50, y+dy*2, 6, 6);
  
}




