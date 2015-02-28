
void setup() {
size(400,400);
}


void draw() {



for (int i = -20; i < 450; i = i + 10) {
  for (int j = 0; j < 450; j = j + 70) {
   line(j, -60, i, 400); 
    
  }
}

if (mousePressed) {
 background(random(100,255));
 line( mouseX, mouseY, random(0,400), random(0,400));
 rect( random(0,300), random(0,300), 40, 40);
 fill(237, 99, 74);
}
}                               
