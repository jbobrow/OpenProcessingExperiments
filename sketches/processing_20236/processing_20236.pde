
//RULES:
//Left and right keys must change the rotation
//Mouse movement must have an effect on size of shapes (x) 
//Mouse movement must change color (y)

float rotation;

void setup(){
  size(600, 600);
  background(0, 0, 0);

}

void draw(){
 translate(width/2, height/2);
 rotate(rotation);
 if (mouseX > 100) {
   strokeWeight (1);
 }
 if (mouseX > 200) {
   strokeWeight (2);
 }
  if (mouseX > 300) {
   strokeWeight (4);
 }
 if (mouseX > 400) {
   strokeWeight (6);
 }
  if (mouseX > 500) {
   strokeWeight (10);
 }
 
  if (mouseY > 0) {
   stroke (random(255), 0, 0);
 }
   if (mouseY > 200) {
   stroke (0, 0, random(255));
 }
  if (mouseY > 400) {
   stroke (0, random(255), 0);
 }
  line (0, 0, 300, 300);



 
}

 void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      rotation = rotation+1;
    } else if (keyCode == RIGHT) {
      rotation = rotation-1;
    } 
  } else {
    rotation = 0;
  }
 }                              
