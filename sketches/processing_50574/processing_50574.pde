
void setup () {
 size(600, 600);
 smooth();
 
}//closes setup

void draw () {
   background(#006666);
  strokeWeight(4);
   
   
  for(int i=0;i<600;i++) {
     stroke(#ff9900,200);
     line(10*i,0,10*i,600);
     //stroke (#990033, 180);
     line(600,10*i,0,10*i);
  }//closes for
  
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
  fill(#006666, 2.5);
  stroke (#990033,20);
  strokeWeight(3);
  triangle(0, 0, 180, 160, 0, 160);
}        
