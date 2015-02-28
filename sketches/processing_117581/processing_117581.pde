
int[] ex = new int[0], ey = new int[0];
int drawFlag = 1; //1: drawSmile 2:drawSad

float v;
// Using background from illustration of Jimmy "http://www.tuzuan.com/thread-39892-1-1.html"
PImage bgImg;  //Inport an image as background 
PImage bg1Img;
PImage bg2Img;
PImage smileImg; 
PImage sadImg; 
PImage coolImg;

import ddf.minim.*;  // Import Audio Source by Minim

Minim minim;
AudioSample smile;
AudioSample sad;
AudioSample cool;
AudioPlayer bgsound;

void setup() {
  size(363,434);
  smooth();
  textFont(createFont("Baskerville-SemiBoldItalic-48", 20, true));
  rectMode(CENTER);

 // Load Image
 bgImg = loadImage("bgbg.png");
 image(bgImg, 0, 0, width, height); //show the image as background
 bg1Img = loadImage("bgbg1.png");
 bg2Img = loadImage("bgbg2.png"); 
 smileImg = loadImage("happy.png");
 sadImg = loadImage("sad.png");

 // Setting of Audio
  minim = new Minim(this);             
  smile = minim.loadSample("meow.wav"); // Sound with Smile face
  sad = minim.loadSample("mmm.wav");  // Sound with Sad face
  
  bgsound = minim.loadFile("nothing on you.mp3"); // background music
  bgsound.loop();        // Loop background music
}

void draw() {
  
 //smile and sad facces
  if (drawFlag == 1 && mousePressed)  // After pressed "1", click to show smile face with sound effect
    smile.trigger();
  else if (drawFlag == 2 && mousePressed)  //// After pressed "2", click to show smile face with sound effect
    sad.trigger();

 // Display type
  fill(0,250,200);
  text("Stick my face to the body! Meow~",0,height/20);
  
 
}

void mousePressed() {
  ex = append(ex,mouseX);
  ey = append(ey,mouseY); 
 
  if (drawFlag == 1)
    drawSmile(mouseX, mouseY);
   else if (drawFlag == 2)
    drawSad(mouseX, mouseY);
 
   
  println(ex.length+" ("+ex[ex.length-1]+","+ey[ey.length-1]+")");
}

void drawSmile(float x, float y) {
  imageMode(CENTER);
  image(smileImg,mouseX,mouseY,80,100);  
}


void drawSad(float x, float y) {
  imageMode(CENTER);
  image(sadImg,mouseX,mouseY,90,90);
  
}

void keyPressed() {
  if (key == 'a') {
    bgImg = loadImage("bgbg.png");
 image(bg1Img, width/2, height/2, width, height); 
  }
  else if (key == 'b') {
    bg1Img = loadImage("bgbg1.png");
 image(bg2Img, width/2, height/2, width, height); 
  }
  else if (key == 'c') {
    bg2Img = loadImage("bgbg2.png");
    image(bgImg, width/2, height/2, width, height);  // erase the canvas
  }
  if (key=='1')        //Press "1" to draw Smile Face
    drawFlag = 1;
  if (key=='2')          //Press "2" to draw sad Face
    drawFlag = 2;   

}






