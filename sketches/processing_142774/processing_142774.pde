
void setup() {
 size(500,500);
 smooth();
 noStroke();
}

void draw() {
  background(160,210,220);
  
  translate(width/2,height/2);
  fill(255);
  ellipse(0,0,400,400);
  fill(0);
  
  pushMatrix();
    for(int i=0; i<60; i++){
      rect(0,-200,1,10);
      if(i%15 == 0) {
        rect(-2,-200,4,20); 
      }
      rotate(radians(6));
    }
  popMatrix();
  
  pushMatrix();
    rotate(radians(minute()*6));
    fill(0);
    rect(-2,0,4,-150);
  popMatrix();
  
  pushMatrix();
    rotate(radians(hour()*30));
    rect(-4,0,8,-100);
  popMatrix();
  
  pushMatrix();
    rotate(radians(second()*6));
    fill(255,0,0);
    rect(-1,0,2,-170);
    ellipse(0,-140,20,20);
  popMatrix();
  
  fill(0);
  ellipse(0,0,20,20);
}
