
//creating buttons and the interface--this first before array to handle data
//thanks to Eugene for showing me I didn't need to store the button check as a value, instead
//cut the middleman and go straight to "this is what I want to happen if I check this and it's true"
//ergo don't store values if you don't have to

int r = 0;
int g = 0;
int b = 0;
Buttonmash button = new Buttonmash(750, 100, 50, 50, 120, 200, 50);
Buttonmash button2 = new Buttonmash (700, 100, 50, 50, 200, 100, 0);

void setup() {
  size(800,700);
  background(255);
  rectMode(CENTER);
  frameRate(60); //increasing framerate to reduce lag between changing color
}

void draw() {
  mouseline();
  interfaceBox();
  button.display();
  button2.display();
}

void keyReleased() {
  if (key == ENTER) {
   background(255);
 }
}

void mouseline() {
  if (mousePressed==true) {
      stroke(r, g, b);
      line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void interfaceBox() {
  noStroke();
  fill(200, 200, 200);
  pushMatrix();
  translate(705, 245);
  rect(0, 0, 210, 510);
  popMatrix();
  pushMatrix();
  translate(395, 605);
  rect(0, 0, 810, 210);
  popMatrix();
}

void mousePressed() {
  button.buttonCheck();
  button2.buttonCheck();
}

class Buttonmash {
 
  int localX, localY, localW, localH, localR, localG, localB;
  
  Buttonmash(int x, int y, int w, int h, int r2, int g2, int b2) {
    localX = x;
    localY = y;
    localW = w;
    localH = h;
    localR = r2;
    localG = g2;
    localB = b2; 
  }
  
  void display() {
   buttonCheck();
   fill (localR, localG, localB);
   rect (localX, localY, localW, localH); 
  }
  
  void buttonCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     r = localR;
     g = localG;
     b = localB;
   } 
  }
  
}

