
int[] sx = new int[0], sy = new int[0];
int drawStar = 1; 
//1: Paint Van Gogh's Star, 
//2:Paint Real Star
 
float v;
PImage img1Img;
//Background Image:The Starry Night
PImage img2Img;
//Img2:A Wheatfield, with Cypresses
PImage img3Img;
//Img3:Starry Night Over the Rhone
PImage s1Img;//S1:Van Gogh's Star
PImage s2Img;//S2:Real Star

import ddf.minim.*;  
// Import Audio Source by Minim
Minim minim;
AudioSample s1;
AudioSample s2;
AudioPlayer bgmusic;
 
void setup() {
  size(720,482);
  textFont(createFont("BrushScriptStd-60", 30));
  smooth();
 
 // Image part
 img1Img = loadImage("img1.png");
 image(img1Img, 0, 0, width, height); 
 //show the image as background
 img2Img = loadImage("img2.png");
 img3Img = loadImage("img3.png");
 s1Img = loadImage("s1.png");
 s2Img = loadImage("s2.png");
 
 // Audio part
  minim = new Minim(this);            
  s1= minim.loadSample("Ding.wav"); 
  // Van Gogh's Star
  s2= minim.loadSample("Ting2.wav"); 
  // Real Star
  bgmusic = minim.loadFile("Vincent.mp3");
  // background music
  bgmusic.loop();        
  // Loop background music
}
 
void draw() {
   
//1:Paint Van Gogh's Star 
//2:Paint Real Star
  if (drawStar == 1 && mousePressed) 
  // After pressed "1", click to paint Van Gogh's with sound effect
    s1.trigger();
  else if (drawStar == 2 && mousePressed)  
  // After pressed "2", click to paint Real Star with sound effect
    s2.trigger();
 

  fill(0,250,200);
  text("Let's be Van Gogh together!",100,50);
  //To let player know how the game run
}
 
void mousePressed() {
  sx = append(sx,mouseX);
  sy = append(sy,mouseY);
  
  if (drawStar == 1)
   drawStarV(mouseX, mouseY);
   else if (drawStar == 2)
    drawStarR(mouseX, mouseY);
  
    
  println(sx.length+" ("+sx[sx.length-1]+","+sy[sy.length-1]+")");
}
 
void drawStarV(float x, float y) {
  imageMode(CENTER);
  image(s1Img,mouseX,mouseY,60,60); 
  // Both stars can paste in anywhere as player but only in one pic.
}
 
 
void drawStarR(float x, float y) {
  imageMode(CENTER);
  image(s2Img,mouseX,mouseY,60,60);   
}
  
void keyPressed() {
  
   if (key=='1')        
  //Press "1" to paint Van Gogh's star
    drawStar = 1;
  if (key=='2')       
  //Press "2" to paint Real star
    drawStar = 2;  
  
  if (key == 'a') {
    img1Img = loadImage("img1.png");
 image(img1Img, width/2, height/2, width, height);
  }
  else if (key == 'b') {
    img2Img = loadImage("img2.png");
 image(img2Img, width/2, height/2, width, height);
  }
  else if (key == 'c') {
    img3Img = loadImage("img3.png");
    image(img3Img, width/2, height/2, width, height);
  }  
 
}

