
void setup() {
  size(500, 500);
background(40,50,150);
}
 
void draw(){
for(int i = 0; i < 5; i = i + 1) {
   
  float x = 50 + (i * 100);
  float y = 250;
   
  fill(255,2,50);
  noStroke(); 
  ellipse(x,y,50,50);
}
 
 
 }


