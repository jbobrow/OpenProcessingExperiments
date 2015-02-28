
void setup () {
 size(600, 600);
 background(#006666);
 smooth();
}//closes setup

void draw () {
  translate (300, 300);
 for (float i=0; i<360; i += 0.5) {
  pushMatrix();
   rotate(radians (frameCount*i));
   translate(0, 200);
   rotate(radians (frameCount*i*3));
   scale(map(sin(radians(frameCount*i*6)), -1,1,.5,1));
   map(sin(radians(frameCount*i*3)), -1, 1, .5, 1);
   drawFigure();
  popMatrix();
 }//closes for
}



void drawFigure() {
  fill(#ffcc99,10);
  stroke (0, 0, 0, 128);
  triangle(0, 0, 180, 160, 0, 160);
}
  
          
                                
