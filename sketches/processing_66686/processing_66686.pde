
void setup(){
  size(500, 500);
  background(255);
  noFill();
  noStroke();
  smooth();
  frameRate(10);
}

void draw(){
  for(int x=0;x<200;x+=10){
    for(int y=0; y<255; y++){
    strokeWeight(5);
    stroke(y, 40, x);
    drawHeart(x);
  }
  }
}


void drawHeart(int s){
  beginShape();
  vertex(250, 300+s); //bottom point
  bezier(250, 300+s, 250, 300+s, 300+s, 250, 300+s, 225-0.5*s); //long right side
  bezier(300+s, 225-0.5*s, 300+s, 212-0.76*s, 300+s, 200-s, 275+0.5*s, 200-s); //outside right curve
  bezier(275+0.5*s, 200-s, 255+0.1*s, 200-s, 250, 225-0.5*s, 250, 225-0.5*s); //inside right curve 
  bezier(250, 225-0.5*s, 250, 225-0.5*s, 245-0.1*s, 200-s, 225-0.5*s, 200-s); //inside left curve
  bezier(225-0.5*s, 200-s, 200-s, 200-s, 200-s, 212-0.76*s, 200-s, 225-0.5*s); //outside left curve
  bezier(200-s, 225-0.5*s, 200-s, 250, 250, 300+s, 250, 300+s); //long left side
  vertex(250, 300+s); //bottom point
  endShape();
}

