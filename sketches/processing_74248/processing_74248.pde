
int s= 1;

void setup(){
  size(500,500);
  background(100);
  smooth();
  noStroke();
}

float size;
  
void draw (){
 if (mousePressed) {
   fill(mouseY, mouseX, mouseY, mouseX);
  random(0,3000);
  s=s+1;
  ellipse(mouseX, mouseY, s, s);

 } else {
    s= 0;
 }
}
