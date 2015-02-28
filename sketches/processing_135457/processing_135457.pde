
/*
  Andor Salga
  Moire Circles
*/
  
void setup(){
  size(400, 400);
}

void draw(){
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);

  pushMatrix();
    translate(-sin(frameCount/10.0)* 5, -cos(frameCount/10.0)* 5);
    rotate(frameCount/1000.0);
    stroke(255,255, 0);
    drawLines();
  popMatrix();

  pushMatrix();
    translate(sin(frameCount/10.0)* 5, cos(frameCount/10.0)* 5);
    rotate(-frameCount/1000.0);
    stroke(255, 0, 0);
    drawLines();
  popMatrix();

  popMatrix();
}

void drawLines(){
  for(float i = 0;i < TWO_PI; i += 0.1){
    rotate(i);
    line(0, 0, width/2, height/2);
    rotate(-i);
  }
}


