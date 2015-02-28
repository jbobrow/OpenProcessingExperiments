
//D10
//by maria fang

void setup(){
  size(500, 500);
  smooth();
}

void draw(){
  background(0);
  
  //Y shape
  pushMatrix();
  translate(width/2, height/2);
  for(int i= 0; i<360; i++){
    rotate(radians(36));
    stroke(96, 188, 232);
    strokeWeight(3);
    fill(96, 188, 232);
    beginShape();
    vertex(0, 40);
    vertex(20, -200);
    bezierVertex(20, -150, -20, -150, -20, -200);
    vertex(0, 40);
    endShape();
    //ball
    stroke(255);
    strokeWeight(3);
    ellipse(20, -200, 20, 20);
    ellipse(-20, -200, 20, 20);
    //inside triangle
    noStroke();
    fill(255);
    triangle(0, -30, 8, -140, -8, -140);
  }
  popMatrix();
  
  
}

