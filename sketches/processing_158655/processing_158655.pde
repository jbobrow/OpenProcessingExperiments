

void setup() { 
size(300, 300);
fill(0, 102);
} 
void draw() {} 
void mouseMoved() { 

noFill();
for (int d = 350; d > 0; d -= 30) { 
ellipse(150, 150, d, d); 


noStroke();
for (int y = 0; y < 300; y += 10) {
for (int x = 0; x < 300; x += 10) {
fill((x+y)*0,4);
rect(x, y, 10, 10);
}
}
}

}
