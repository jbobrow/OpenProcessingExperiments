
void setup() {
 size(600, 600);
 background(0);
}

int value =#FA0303;
void draw() {
   strokeWeight(2);
   stroke(0);
   fill(value);
   ellipseMode(CENTER);
   ellipse(300, 300, 175, 175);
  
}
void mousePressed() {
 if(value == 0) {
 value = #FA0303;
 } else {
 value = #03FA21;
 }
}


