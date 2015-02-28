
float speed = 0.5;
int diameter = 5;
float x;
float y;

void setup(){
size(300, 300); 
background(0); 
stroke(102); 
smooth(); 
frameRate (10);
}
void draw(){
for (int y = 20; y <= height-20; y += 5) {
for (int x = 20; x <= width-20; x += 5) { 
  fill (random(255), random (255), random (255));
  rect(x, y, diameter, diameter);
}
}
}


