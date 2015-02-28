
void setup(){
size(500, 500);
smooth();
background(220);
}



void draw() {

for (float y = 60; y <= width; y *= 1.2) {
for (int x = 0; x <= height; x += 5) {
  
  noFill();
  stroke(255);
  line (x,y,x,y-2);
  
  noFill();
  stroke(195);
  line (y,x,y-2,x);
  
  
  noFill();
  stroke(0);
  strokeWeight(.25);
  line (y,x,x,y+2);
 



}
}
}




