
void setup(){
 size(200,200);
 background(255);
}

void draw() {
  stroke(random(200,256),random(200,256),random(50,100));
  float distance_top2 = random(200);
  line(distance_top2,0,distance_top2,200);
  
}
