
/* JesÃºs C GonzÃ¡lez
 PrÃ¡ctica randomWalk
 2014 */
 
/* @pjs preload="bug.png";
 @pjs preload="withering-tulip.jpg";
 */



int total= 10;
float[] posY = new float [total];
float[] posX = new float [total] ;
float tam;
PImage bug, flowers; 
float v= 7;

void setup () {
  size(800, 532);
  background(0);
  tam=150;
  bug= loadImage("bug.png");
  flowers= loadImage("withering-tulip.jpg");
  imageMode(CORNER);
  image(flowers, 0,0,width,height);
 
  for (int i=0; i<total; i++) {
    posY[i] = random(width/2-300,width/2+300);
    posX[i] = random(height/2-300,height/2+300);
  }
}

void draw () {
    imageMode(CORNER);
  image(flowers, 0,0,width,height);
 
   for (int i=0; i<total; i++) {
   imageMode(CENTER);
image (bug, posX[i], posY[i], tam, tam);
  posY[i]=posY[i]+ random(-v, v);
  posX[i]=posX[i]+ random(-v, v);
   }
}


