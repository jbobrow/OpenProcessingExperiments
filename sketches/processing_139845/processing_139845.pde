
int cx = 300;
int cy = 300;


void setup(){
size(600, 600);
background(255);
}

void draw() {
}

void mouseClicked() {  
noStroke();
  cx= mouseX;
  cy= mouseY;


//LAYER 1:
  howMany = int(4);
  for (int i = 0; i < howMany; i++) {
fill(210);
triangle(cx, cy, cx-40, cy-60, cx, cy-40);
triangle(cx, cy, cx+40, cy-80, cx+30, cy-10);
triangle(cx, cy, cx+40, cy+60, cx, cy+40);
triangle(cx, cy, cx-60, cy+60, cx-40, cy);
     
  }


//LAYER 2:
 howMany = int(4);
  for (int i = 0; i < howMany; i++) {
fill(244, 116, 71, 50);
triangle(cx, cy, cx-60, cy-65, cx-5, cy-30);
triangle(cx, cy, cx+30, cy-70, cx+40, cy-25);
triangle(cx, cy, cx+50, cy+55, cx-10, cy+30);
triangle(cx, cy, cx-45, cy+55, cx-30, cy-5);
 }
 
 
 //LAYER 3:
 howMany = int(2);
  for (int i = 0; i < howMany; i++) {
fill(243, 231, 47, 120);
triangle(cx, cy, cx-45, cy-25, cx-10, cy-23);
triangle(cx, cy, cx+37, cy+27, cx+5, cy+25);

 }
  
}
