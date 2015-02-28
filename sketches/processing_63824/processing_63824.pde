
//3.3 Variation Formm

void setup (){
 size(500, 500);
  smooth();
  background(255); 
 
float distanz = 15;
//float offset = 20;
   
  strokeWeight(random(1,6));
  distanz = random(0,30);
   
for (float y = 30; y <= height - 30; y = y + random(distanz)) {
  for (float x = 30; x <= width - 30; x = x + random(distanz)) {
    point(x,y);

    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(200);
   
    strokeWeight(random(1,10));
    stroke(r,g,b,a);
  }
}



}
 
void draw(){
  



}
 
void mousePressed (){
  saveFrame("was_ist_das.png");
}


