
void setup() {
   size(512,512);
   rectMode(CENTER);
   noFill();
   stroke(255,255,255,200);
   frameRate(1);
}

void draw() {
   int i;
   background(0);   
   for (i=1; i<100; i++) {
      pushMatrix();
         translate(width/2, height/2);
         rotate(frameCount*i/20);
         rect(0,0,3*i,3*i);
      popMatrix();
   }
}

