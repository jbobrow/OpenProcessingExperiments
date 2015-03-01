
void setup(){
  size (800,600, P3D);
  background (255);
  stroke(0,0,0, 50); //play with the last parameter - opacity
  strokeWeight(5);  //play with the weight here
  noFill();
}

void draw(){
  ellipse (frameCount%width, sin(frameCount/100.0)*height/4+height/2, sin(frameCount/100.0)*100, cos(frameCount/50.0)*100);
}
