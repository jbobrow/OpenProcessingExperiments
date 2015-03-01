
float x=100;
float y=100;

void setup() {
  size(1000, 800);
  background(255); 

  smooth();
}

void draw() {  
  frameRate(2000);
  rect(x, y, 100, 500);

  if (mousePressed) { 
    fill(random(10, 550), random(10, 100), random(10, 100));

    noStroke();
    rect(mouseX+random(100, 100), mouseY+random(50, 10), 10, 10);
    ellipse(mouseX-random(300, 100), mouseY-random(108, 100), 10, 10);
    ellipse(mouseX+random(800, 100), mouseY+random(10, 100), 10, 10);    
    rect(mouseX+random(300, 100), mouseY+random(108, 100), 10, 10);
    rect(mouseX-random(300, 100), mouseY-random(108, 100), 10, 10);
  } else {
  }
}

void keyPressed() {

  if (key=='r') {
    background(255);
  }
  if (key=='d') {
    x=x+100;
  }
  if (key=='z') {
    y=y+50;
  }
  if (key=='w') {
    y=y-100;
  }
  if (key=='a') {
    x=x-50;
  }
}

