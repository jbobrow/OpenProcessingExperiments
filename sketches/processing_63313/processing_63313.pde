
//3.3 Variation Position

void setup (){
 size(500, 500);
  smooth();
  background(255); 
 
float distanz = 15;
//float offset = 20;
   
  strokeWeight(random(1,6));
  stroke(0);
  distanz = random(0,30);
   
for (float y = 30; y <= height - 30; y = y + random(distanz)) {
  for (float x = 30; x <= width - 30; x = x + random(distanz)) {
    point(x,y);
  }
}



}
 
void draw(){}
 
void mousePressed (){
  saveFrame("was_ist_das.png");
}


