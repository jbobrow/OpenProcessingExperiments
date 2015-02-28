
PImage setting1;
PImage setting2;
PImage setting3;
PImage setting4;
PImage setting5;
PImage blackfur;
PImage scales;
PImage mike;
PImage mouth1;
PImage mouth2;
PImage mouth3;
PImage mouth4;
PImage mouth5;
PImage eye1;
PImage eye2;
PImage eye3;
PImage eye4;
PImage eye5;
PImage burgers;
PImage phone;
PImage donut;


int brush = 1;

void setup() {
  size(1024, 768);
  background(#C79FDB);
  setting1 = loadImage ("setting1.png");
  setting2 = loadImage ("setting2.png");
  setting3 = loadImage ("setting3.png");
  setting4 = loadImage ("setting4.png");
  setting5 = loadImage ("setting5.png");
  blackfur = loadImage ("blackfur.png");
  scales = loadImage ("scales.png");
  mike = loadImage ("mike.png");
  mouth1 = loadImage ("mouth1.png");
  mouth2 = loadImage ("mouth2.png");
  mouth3 = loadImage ("mouth3.png");
  mouth4 = loadImage ("mouth4.png");
  mouth5 = loadImage ("mouth5.png");
  eye1 = loadImage ("eye1.png");
  eye2 = loadImage ("eye2.png");
  eye3 = loadImage ("eye3.png");
  eye4 = loadImage ("eye4.png");
  eye5 = loadImage ("eye5.png");
  burgers = loadImage ("burgers.png");
  phone = loadImage ("phone.png");
  donut = loadImage ("donut.png");
  println(brush);
}

//runs continuously until the program is stopped
void draw() {
//  if (brush == 1) {
//   image(blackfur, mouseX, mouseY);
//  } 
//  if (brush == 2) {
//    image(burgers, mouseX, mouseY);
//  }
//  if (brush == 3) {
//    image(mouth2, mouseX, mouseY);
//  }
//  if (brush == 4) { 
//    image(setting1, 0, 0);
//  }
//  if (brush == 5) {
//    image(setting2, 0, 0);
//  }
//  if (brush == 6) {
//    image(setting3, 0, 0);
//  }
//  if (brush == 7) {
//    image(setting4, 0, 0);
//  }
//  if (brush == 8) {
//    image(setting5, 0, 0);
//  }
  if (keyPressed) {
    if (key == 'y' || key == 'Y') { // black fur
    brush = 1;
    }
    if (key == 'j' || key == 'J') { // burgers
    brush = 2;
    }
    if (key == 'a' || key == 'A') { // mouth1 tongue out
    brush = 3;
    }
    if (key == 's' || key == 'S') { // mouth2 with teeth exposed
    brush = 4;
    }
    if (key == '1') { // sal the cloud (setting1) 
    brush = 5;
    }
    if (key == '2') { // triangle monster (setting2)
    brush = 6;
    }
    if (key == '3') { //6 legged monster with tail and horns (setting3)
    brush = 7;
    }
    if (key == '4') { // blob with wings(setting4)
    brush = 8;
    }
    if (key == '5') { //pink background monster (setting5)
    brush = 9;
    }
    if (key == 'u' || key == 'U') { //scaly skin (scales)
    brush = 10;
    }
    if (key == 'i' || key == 'I') { //mike monsters ink skin (mike)
    brush = 11;
    }
    if (key == 'q' || key == 'Q') { //eye1
    brush = 12;
    }
    if (key == 'w' || key == 'W') { //eye2
    brush = 13;
    }
    if (key == 'e' || key == 'E') { //eye3
    brush = 14;
    }
    if (key == 'r' || key == 'R') { //eye4
    brush = 15;
    }
    if (key == 't' || key == 'T') { //eye5
    brush = 16;
    }
    if (key == 'd' || key == 'D') { //mouth3
    brush = 17;
    }
    if (key == 'f' || key == 'F') { //mouth4
    brush = 18;
    }
    if (key == 'g' || key == 'G') { //mouth5
    brush = 19;
    }
    if (key == 'k' || key == 'K') {
    brush = 20;
    }
    if (key == 'l' || key == 'L') {
    brush = 21;
    }
  }
}

void mousePressed() {
  if (brush == 1) {
   image(blackfur, mouseX-blackfur.width/2, mouseY-blackfur.width/2);
  }
  if (brush == 2) {
    image(burgers, mouseX-burgers.width/2, mouseY-burgers.width/2);
  }
  if (brush == 3) {
    image(mouth1, mouseX-mouth1.width/2, mouseY-mouth1.width/2);
  }
  if (brush == 4) {
    image(mouth2, mouseX-mouth2.width/2, mouseY-mouth2.width/2);
  }
  if (brush == 5) { 
    image(setting1, 0, 0);
  }
  if (brush == 6) {
    image(setting2, 0, 0);
  }
  if (brush == 7) {
    image(setting3, 0, 0);
  }
  if (brush == 8) {
    image(setting4, 0, 0);
  }
  if (brush == 9) {
    image(setting5, 0, 0);
  }
  if (brush == 10) {
    image(scales, mouseX-scales.width/2, mouseY-scales.width/2);
  }
  if (brush == 11) {
    image(mike, mouseX-mike.width/2, mouseY-mike.width/2);
  }
  if (brush == 12) {
    image(eye1, mouseX-eye1.width/2, mouseY-eye1.width/2);
  }
  if (brush == 13) {
    image(eye2, mouseX-eye2.width/2, mouseY-eye2.width/2);
  }
  if (brush == 14) {
    image(eye3, mouseX-eye3.width/2, mouseY-eye3.width/2);
  }
  if (brush == 15) {
    image(eye4, mouseX-eye4.width/2, mouseY-eye4.width/2);
  }
  if (brush == 16) {
    image(eye5, mouseX-eye5.width/2, mouseY-eye5.width/2);
  }
  if (brush == 17) {
    image(mouth3, mouseX-mouth3.width/2, mouseY-mouth3.width/2);
  }
  if (brush == 18) {
    image(mouth4, mouseX-mouth4.width/2, mouseY-mouth4.width/2);
  }
  if (brush == 19) {
    image(mouth5, mouseX-mouth5.width/2, mouseY-mouth5.width/2);
  }
  if (brush == 20) {
    image(phone, mouseX-phone.width/2, mouseY-phone.width/2);
  }
  if (brush == 21) {
    image(donut, mouseX-donut.width/2, mouseY-donut.width/2);
  }
}







