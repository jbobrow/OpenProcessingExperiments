
int numFrames = 5;
int frame = 0;
PImage glove; 
PImage[] images = new PImage[numFrames];
int x = 50;
int y = 50;
int x2;
int y2;
int size;

void setup(){
  size(600,600);
  x = 450;
  y = 450;
  glove = loadImage("glove1.gif");
  frameRate(8);
  
  images[0] = loadImage("Little_Dude.gif");
  images[1] = loadImage("Little_Dude2.gif");
  images[2] = loadImage("Little_Dude3.gif");
  images[3] = loadImage("Little_Dude4.gif");
  images[4] = loadImage("Little_Dude5.gif");
  
 
}

void draw(){
  background(255);
  frame = (frame+1) % numFrames;
 
  stroke(50);
  strokeWeight(3);
  line(0,220,600,220);
  line(0,250,600,250);
  
  strokeWeight(2);
  ellipse(90,125,50,24);
  line(66,125,80,210);
  line(80,210,105,210);
  line(105,210,115,125);
 
  image(images[frame],75,50);
  image(glove,x,y); 
   
}

  void mouseDragged(){
    if(dist(x,y,mouseX,mouseY) < 50){
      x = mouseX;
      y = mouseY;
      noCursor();
   
    }
 }

void mousePressed(){
 if(dist(75,50,mouseX,mouseY) < 100) {
   images[0] = loadImage("impact1.gif");
   images[1] = loadImage("impact2.gif");
   images[2] = loadImage("impact3.gif");
   images[3] = loadImage("impact4.gif");
   images[4] = loadImage("impact5.gif");
  frame++;
  if (frame ==numFrames){
  draw();
  
  

   
     if(x == 50){
       noFill();
       stroke(0);
       strokeWeight(3);
       rect(height,width,10,10);
     
     }  
     }       
   }
 }


