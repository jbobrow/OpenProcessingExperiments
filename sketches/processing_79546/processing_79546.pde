
//Idea:  Processing: Creative Coding and Computanal Art textbook 
//Coding:  Elizabeth And Dad
int counter;
int mode=0;

void setup() {
  size(500,500);
  background (0);
 // colormode(HSB);
  counter=0;
  
}

void draw() {
  counter++;
  noStroke();
  fill(random(255),random(255),random(255),50);
  if (mousePressed == true) {
    if (mode==0) {
      ellipse (mouseX,mouseY,20,20);
    }
    if (mode==1) {
      rect(mouseX, mouseY, 20, 20);
    }
    
  } else {
    if (mode==0) {
      ellipse(width/2,height/2,80*sin(counter),80*sin(counter));
    }
    if (mode==1) {
      rect(width/2, height/2, 80*sin(counter), 80*sin(counter));
    }
  }
}

void keyPressed() {
  if (key == 'c') {
    background(0);
  }
  if (key == 'e') {
    mode=0;
  }
  if (key == 'b') {
    mode=1;
  }
  if (key == 'C') {
    background (random(255),random(255),random(255));
  }
}



