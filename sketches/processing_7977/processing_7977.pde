
PImage pet1;
PImage pet2;
PImage pet3;
PImage pet4;
PImage pet5;

float y = 0.0;
//float x = 0.0;
float speed = 0.1;

void setup(){
  size(640, 480);
  smooth();
  pet1 = loadImage("pet1.png");
  pet2 = loadImage("pet2.png");
  pet3 = loadImage("pet3.png");
  pet4 = loadImage("pet4.png");
  pet5 = loadImage("pet5.png");
}

void draw(){
  background(12, 21, 36); 
  image(pet1, 44, y);
 speed = map(mouseX, 0, 640, 1.3, 0.5);
  y = y + speed;
  if (y > 600){
    y = -30;
  }
  if (mouseX >= 120) {
  image(pet2, 76, y-15);
  }
  if (mouseX >= 240) {
  image(pet3, 65, y-60);
  }
  if (mouseX >=360){
  image(pet4, 20, y-60);
  }
  if (mouseX >=480){
  image(pet5, 10, y-20);
  }
  //flower 2 
  image(pet1, 244, y-80);
    if (mouseX >= 120) {
  image(pet2, 276, y-95);
  }
  if (mouseX >= 240) {
  image(pet3, 265, y-140);
  }
  if (mouseX >=360){
  image(pet4, 220, y-140);
  }
  if (mouseX >=480){
  image(pet5, 210, y-100);
  }
  //flower3
    image(pet1, 504, y-60);
    if (mouseX >= 120) {
  image(pet2, 536, y-75);
  }
  if (mouseX >= 240) {
  image(pet3, 525, y-120);
  }
  if (mouseX >=360){
  image(pet4, 480, y-120);
  }
  if (mouseX >=480){
  image(pet5, 470, y-80);
  }
  ///flower4
  image(pet1, 414, y-180);
    if (mouseX >= 120) {
  image(pet2, 446, y-195);
  }
  if (mouseX >= 240) {
  image(pet3, 435, y-240);
  }
  if (mouseX >=360){
  image(pet4, 390, y-240);
  }
  if (mouseX >=480){
  image(pet5, 380, y-200);
  }
  
  //flower5
  image(pet1, 114, y-160);
    if (mouseX >= 120) {
  image(pet2, 146, y-175);
  }
  if (mouseX >= 240) {
  image(pet3, 135, y-220);
  }
  if (mouseX >=360){
  image(pet4, 90, y-220);
  }
  if (mouseX >=480){
  image(pet5, 80, y-180);
  }
}


