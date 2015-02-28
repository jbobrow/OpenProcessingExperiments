

float x = 15;
float y = 15;
float z = 40;


void setup() {
  size (500, 500);
  smooth();
}

void draw() {
  background (255);


  if (mousePressed) {

    if (mousePressed && (mouseButton == LEFT));{
 for (int i = 0; i < 40; i = i+1) {
  line(30, i, 80, i);
}
    fill(mouseY,65, 86, mouseY);
noStroke();
    ellipse (mouseX, mouseY, x+20,y+20);
     ellipse (mouseX, mouseY,x,y);
     ellipse (mouseY, mouseX,z,z);
     ellipse (-mouseY, -mouseX,z,z);
     
stroke(194, mouseY, 34, 40);
fill(0);
   strokeWeight (mouseX);
   ellipse (mouseY, mouseY, z, z);
    ellipse (mouseY, mouseY, z+90, z+90);
    
  } 
  if (mousePressed && (mouseButton == RIGHT)) {
    if (x<200 && x> 400){
   stroke(0);
   fill(0);
   strokeWeight (mouseX);
   ellipse (mouseY, mouseY, -z, -z);}
    
   stroke(194, 65, 34, 40);
   fill(0);
   strokeWeight (mouseX);
   ellipse (mouseY, mouseY, -z, -z);
  } }}
  

