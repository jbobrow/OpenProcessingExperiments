
void setup() {
  
  size (500,500);
  background (255);
}
  
void draw() {
  

  

 float distance_top = random(100);
  stroke(#f9f5f1);
  line(0,distance_top, 500,distance_top);
  //line(distance_top, 0, distance_top, 500);
  
    float distance_left = random (300);
  line (0,distance_left, 500, distance_left);
  
  float distance_bottom = random (500);
   line (0,distance_bottom, 500, distance_bottom);
   fill(random(173), random(207), random(211), random (30));
  
  rect( 150, 150, 175, 175);

  //line(  150, 150, random(150), random(200));
  
}

