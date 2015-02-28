
void setup () {
 size(600, 600);
 background(#006666);
 //noStroke();
 smooth();
 
}//closes setup

void draw () {
   translate (height/2, width/2);
 for (float i=0; i<360; i += 0.5) {
  pushMatrix();
   rotate(radians (i)*frameCount/2);
   translate(mouseY,mouseX);
   rotate(radians (i*3));
   scale(map(sin(radians(i*6)), -1,1,.5,1));
   map(sin(radians(i*3)), -1, 1, .5, 1);
   drawFigure();
  popMatrix();
 }
}



void drawFigure() {
  fill(#006666, 10);
  stroke (#996666, 90);
  strokeWeight(2);
  triangle(0, 0, 180, 160, 0, 160);
}
  
                                
