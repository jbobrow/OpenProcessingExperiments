
// animation
// white lines on black background
// the lines begin on the left border and end on the right border
// the lines must be horizontal.
void setup() {
  
  size(400,400);
  background(#72708f);

}
void draw() {
  //background(0);
  stroke(random(200,256),random(200,256),random(200,256));
  
  float distance_top = random(100);
  
  line(0,distance_top, 99,distance_top);
  
  float distance_top1 = random(300);
  
  line(200, distance_top1, 100,distance_top1);
  
  float distance_top2 = random (300);
  
  line(distance_top2,299,distance_top2,0);
  
  float distance_top3 = random (399);
  
  line(distance_top3,398,distance_top3,0);
  

  float distance_top4 = random (300,399);
  
  line (200,distance_top4,398,distance_top4);
  
}

