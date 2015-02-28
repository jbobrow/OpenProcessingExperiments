
//C6
//by maria fang

void setup(){
  size(500, 500);
  smooth();
  
}

void draw(){
  
  background(0);
  
  //change grid
  pushMatrix();
  translate(width/2, height/2);
  for(int i= 0; i<360; i ++){
    rotate(radians(60));
    //shape
    smooth();
    stroke(255);
    strokeWeight(2);
    fill(157, 58, 173);
    beginShape();
    vertex(0, 0);
    bezierVertex(50, 0, 75, -65, 15, -50);
    bezierVertex(15, -50, 75, -125, 15, -100);
    vertex(50, -150);
    vertex(0, -200);
    vertex(-50, -150);
    vertex(-15, -100);
    bezierVertex(-75, -125, -15, -50, -15, -50);
    bezierVertex(-75, -65, -50, 0, 0, 0);
    vertex(0, -125);
    vertex(-25, -150);
    vertex(0, -175);
    vertex(25, -150);
    vertex(0, -125);
    endShape();
  }
  popMatrix();
  
  
}

