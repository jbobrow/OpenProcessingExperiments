
oid setup() {
  size(600,600);
  frameRate(10);
}
 
void draw() {
  //background(100);
  translate(width/2,height/2);
  for (int j = 0; j<10; j++) {
    pushMatrix();
    rotate(radians(random(360)));
    for (int i = 0; i<20; i++) {
      rotate(radians(random(-15,15)));
      scale(1.3);
      line(0,0,0,-15);
      translate(0,-15);
    }
    popMatrix();  
  }
}

