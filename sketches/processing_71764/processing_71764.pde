
//Eric Beasley
//GAM240 Project 3

void setup() {

size(1000, 800);
smooth();
background(255);

}
void draw() {

float c = random(2);

//loops blue dots
if (c < 1) {
  for (int l = 0; l < 100; l++) {
  fill(0,0,random(255));
  float r = random(300);
  ellipse(mouseX, mouseY, r, r); }}
 
 //loops green dots 
  else if (c < 2) {
  for (int l = 0; l < 100; l++) {
  fill(0,random(255),0);
  float r = random(300);
  ellipse(mouseX, mouseY, r, r);}}

//taking out red
 /*else if (c < 3) {
  for (int l = 0; l < 50; l++) 
  fill(random(255),0,0);
  float r = random(200);
  ellipse(mouseX, mouseY, r, r);
}*/
}




