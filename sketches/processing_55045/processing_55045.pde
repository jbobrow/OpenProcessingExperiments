
void setup() { size(400, 400);
smooth(); noStroke();
} 
  void draw() {
background(255);
for(int x = 0; x <= width; x += 5) {
for(int y = 0; y <= height; y += 5) {
  fill(x,255-y,y);
  rect(x,y,3,3);  
}
}
}

