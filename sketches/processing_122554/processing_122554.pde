
int x, y;  
int speed =1;
int space =1000;
int i;

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  frameRate(120);
  smooth();
  fill(0);
  i =0;
} //setup

void draw() {
}

void mouseDragged() {
  for (int i=0; i<200; i+=5) {          
    fill(0, 0, i);
    ellipse(mouseX, mouseY, 5, 5);
    mouseX = mouseX+speed;
    mouseY = mouseY+speed;
  } //guradeishon blue
  if (key == CODED) {
    if (keyCode == UP) { 
      background(0);
    } //all delete
    else if (keyCode == DOWN) {   
      fill(0); // eraser
      ellipse(mouseX, mouseY, 200, 200);
    }
    else if (keyCode == LEFT) {    
      for (int i=0; i<200; i+=20) {          
        fill(i, i, 0);
        ellipse(mouseX, mouseY, 5, 5);
        mouseX = mouseX+speed;
        mouseY = mouseY+speed;
      } //guradeisyon yellow
    }
    else if (keyCode == RIGHT) {    
      for (int i=0; i<300; i+=20) {          
        fill(0, i, i);
        ellipse(mouseX, mouseY, 5, 5);
        mouseX = mouseX+speed;
        mouseY = mouseY+speed;
      } //guradeishon ligjt blue
    }
  }
}

void keyPressed() {
  switch(key) {
  case'd':
    for (int i=0; i<200; i+=5) {          
      fill(0, 0, i);
      ellipse(mouseX, mouseY, 5, 5);
      mouseX = mouseX+speed;
      mouseY = mouseY+speed;
    } //return default
  }
}



