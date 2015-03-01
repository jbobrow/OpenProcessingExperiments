

int[] xpos = new int[40];
int[] ypos = new int[40];
int speed = -1;

void setup() {
  size(500, 500);
  background(57, 57, 57);
  smooth();
}

void draw() {

  move(mouseX/100);
  move(mouseY/100);

  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = xpos[i+1]; 
    ypos[i] = ypos[i+1];
  }

  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;

  for (int i = 0; i < xpos. length; i++) {
    noStroke(); 
    fill(random(255), 100); 
    ellipse(xpos[i], ypos[i], i, i);
  }
}

void move(int speedFactor) {
 mouseX=mouseX+speed*speedFactor;
 mouseY=mouseY-speed*speedFactor;
 }

void mousePressed() {
    setup();
  }




