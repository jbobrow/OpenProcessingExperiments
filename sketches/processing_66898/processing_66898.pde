
int mouseDragged;
int o;

void setup() {
  size (500, 500);
  o=20;
  smooth();
}

void draw() {
  if (keyPressed==true && key=='r') {
    fill(random(255), random(255), random(255));
    rect(random(width), random(height), 10, 10);
  }
}
void mouseDragged() {
 
  if (keyPressed == true) {
    if (keyCode== UP){
      o=o+1;
    }
    
    if (key == 'w') {
      noStroke();
 fill(0,0,0,20);
  ellipse(mouseX,mouseY,50,50); 
ellipse(mouseX+4,mouseY+4,50,50);
fill(random(90,255),100,200,60);
ellipse(mouseX-2,mouseY-2,50,50); 
    }
  }
}


void keyPressed() {
    if (key=='z') {
    fill(random(255), random(255), random(255));
    rectMode(CENTER);
    rect(0, 0, 1000, 1000);
    noStroke();
  }
  if (key=='r') {
    fill(random(255), random(255), random(255));
    rect(random(width), random(height), 10, 10);
    noStroke();
  }
  if (key=='w') {
    fill(random(255), random(255), random(255));
    ellipse(random(width), random(height), 10, 10);
    noStroke();
  }
  if (key=='s') {
    stroke(random(255), random(255), random(255));
    line(random(width), random(height), random(width/2), 100);
    strokeWeight(2);
  }
}


