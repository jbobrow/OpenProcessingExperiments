
//  angle from this coord to the origin =  atan2( y , x );


void draw() {
  
  background(255);
  line(0,0, mouseX,mouseY);
  
  fill(200,100,200);
  float angle = atan2(mouseY, mouseX);
  arc(0,0, 200,200, 0, angle);
  
  
  
}


