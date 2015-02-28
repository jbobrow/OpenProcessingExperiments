
int blocksize;

 void setup() {
  
   size(500,400);
   blocksize = 5;
   noStroke();
   
 }

 void draw() {
 //pressed to change to green
   for(int y=0; y<height; y+=blocksize) {
     for(int x=0; x<width; x+=blocksize) {
     if (mousePressed == true) {
    println("You're watching MTV. Apparently there's nothing on it.");
    fill(random(128,223),random(128,223),random(255),50);
  } else {
    fill(random(0,64),random(230),random(128,223), 200);
    
  }
 
    
 
       rect(x,y,blocksize,blocksize);

   
     }
   }
   /** if (mousePressed == true) {
    fill(0);
  } else {
    fill(255,0,0);
  }
  */
   int specialX = mouseX - (mouseX % blocksize);
   int specialY = mouseY - (mouseY % blocksize);
   
  /** if (mousePressed == true) {
    fill(0);
  } else {
    fill(255,0,0);
  }
  */
   fill(255,0,0);
   /**rect(specialX, specialY, blocksize, blocksize);
   */
   /**PImage face;
   face = loadImage("scaryface.gif");
   image(face, width*0.10, height*0.10, width*1.25, height*1.25);
   */
   PImage mtvlogo;
   mtvlogo = loadImage("mtv.gif");
   image(mtvlogo, 0, 0, width, height);
   
   PImage tv;
   tv = loadImage("tv.gif");
   image(tv, 0, 0, width, height);
   
   
   
   PImage tvcontrol;
   tvcontrol = loadImage("tvcontrol1.gif");
   fill(random(128,223),random(230),random(230), 200);
   ellipse(width*0.955, height*0.43, width*0.023, height*0.03);
   image(tvcontrol, specialX, specialY, width*0.25, height*0.25);
 
   
   
 
 
 }


 

