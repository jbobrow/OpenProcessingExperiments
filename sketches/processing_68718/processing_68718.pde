
void setup(){
 frameRate(1000); 
}

void draw() {
  background(0);
  stroke(255);
  float distance_top = random(100);
  line(0,distance_top,99,distance_top);
  
  stroke(255);
  float distance_top2 = random(100);
  line(distance_top2,0,distance_top2,99);
  
}
