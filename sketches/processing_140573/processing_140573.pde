
//Diego. midterm planning document. ASS 7


float easing = 0.15;
int offset = 20;

void setup () {

size(800, 440);
smooth();
fill(255);
stroke(102);
strokeWeight(1);

}

void draw() {
  background(250,250,210);
  compositionA();
}






//defining compositionA

void compositionA(){
  for (float i = 40; i < height; i += 8) {
 line(i + i/2, 20, width + 50, i + i/2);
 line(20, i + i/2, i + i/2, height/2);
 for (float y = 20; y <= height-20; y += i) {
 for (float x = 20; x <= width-20; x += i) {
 ellipse(x + y, y, 4, 4);
noFill();
if (mouseX > x) {
   x += 1;
 offset = -10;
 stroke(0);
 } else if(mouseX < x) {
   x -= 1; 
 offset = 10;  
arc(mouseX + i, mouseY, mouseX + offset, mouseY - 6, HALF_PI, PI);
stroke(126);
arc(mouseX + i, mouseY, mouseX + offset, mouseY - 7, PI, PI+QUARTER_PI);
stroke(200);
arc(mouseX + i, mouseY, mouseX + offset, mouseY - 8, PI+QUARTER_PI, TWO_PI);
ellipse(mouseX, mouseY, 9, 9);
 }
}
 }

 }
 
}



