
//use mouse to draw color spot paint
boolean button =  false;
float r;
float g;
float b;
float a;
float s;

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(1, 180);
  s = random(2, 18);
  
//RED
  if (mouseButton == LEFT && key == 'r' || key == 'R') {
    noStroke();
    fill(r, 0, 0, a);
    ellipse(mouseX, mouseY, s, s);
    button = true;
  }
  else if(mouseButton == RIGHT){
    button = false;
  }
//GREEN  
  if (mouseButton == LEFT && key == 'g' || key == 'G') {
    noStroke();
    fill(0, g, 0, a);
    ellipse(mouseX, mouseY, s, s);
    button = true;
  }
  else if(mouseButton == RIGHT){
    button = false;
  }
 //BLUE 
    if (mouseButton == LEFT && key == 'b' || key == 'B') {
    noStroke();
    fill(0, 0, b, a);
    ellipse(mouseX, mouseY, s, s);
    button = true;
  }
  else if(mouseButton == RIGHT){
    button = false;
  }
//YELLOW
    if (mouseButton == LEFT && key == 'y' || key == 'Y') {
    noStroke();
    fill(255, 160, 0, a);
    ellipse(mouseX, mouseY, s, s);
    button = true;
  }
  else if(mouseButton == RIGHT) {
    button = false;
  }
}

//make window become white
void keyPressed() {
  if (key == 'z' || key == 'Z') {
    background(255);
  }
  if (key == 'x' || key == 'X') {
    background(0);
  }
}
//@< 2013/8/26~



