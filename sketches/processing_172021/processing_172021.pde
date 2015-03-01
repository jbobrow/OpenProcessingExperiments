
int counter;

void setup() {  
  size(400, 400);
  background(255);  
  
  counter = 0;
}

void draw() {  
  fill(7, 20, 43);
ellipse(200, 200, 375, 375);
fill(60, 0, 255);
triangle(200, 104, 280, 280, 120, 280);
fill(255, 255, 255);

var answer = floor(random(0, 5));
if (answer >= 0 && answer< 1) {
    text("UNCERTAIN", 168, 200);
    
} 
if (answer>=1 && answer<2) {
    text("NO", 195, 200);
}
if (answer>=2 && answer<3) {
    text("YES", 195,200);
}
if (answer>=3 && answer<4) {
    text("MAYBE", 185,200);
}
if (answer>=4 && answer<5) {
    text("ASK AGAIN", 170,200);
}

ellipse(200, 40, 168,34);
strokeWeight(6);

ellipse(200, 36, 100, 15);
}
