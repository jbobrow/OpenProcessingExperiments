
void setup () {
  size(300,200);
  background (random(200,256), random(200,256), random (200,256));
}
void draw() {
  //background (0);
  stroke(random(200,256), random(200,256), random (200,256));
  
  float distance_full = random (400);
  float distance_1 = random (0,50);
  float distance_2 = random (100,150);
  float distance_3 = random (200,250);
  
  line (distance_full,0, distance_full,399);
  line (0,distance_full, 399,distance_full);
  stroke (random (90,256), random (90,256), random (90,256));
  line (distance_1,0, distance_1,199); 
  line (distance_2,0, distance_2,199);
  line (0,distance_2, 150,distance_2);
  line (distance_3,0, distance_3, 199);  
  


}
