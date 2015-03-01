
float a = 0.0;
float s = 0.0;

void setup() {
  background(24, 205, 240);
  size(700, 400);
}

void draw() {

  if (key == 'q' || key == 'Q') {
      group();
  }
  if (key == 'w' || key == 'W') {
      group2();
  }
  if (key == 'e' || key == 'E') {
      group3();
  }
 
}

void group() {
  background(24, 205, 240);
  size(700, 400);
  noStroke();
  fill(128);
  rect (50, 20, 150, 170);
  rect (50, 200, 150, 170);
  rect (214, 200, 150, 170);
  rect (214, 20, 150, 170);
  rect (350, 20, 150, 170);
  rect (350, 200, 150, 170);
  rect (514, 200, 150, 170);
  rect (514, 20, 150, 170);

  noStroke();
  if (mouseX > width/2) {
    panda ();
  }else{
  }
}
  
void panda(){
  fill(24, 205, 240);
  ellipse(200, 200, 150, 150);
  ellipse(510, 200, 150, 150);
}
  


void group2() {
  
background(24, 205, 240);
  size(700, 400);
  noStroke();

fill(14, 82, 95);
rect(200, 100, 300, 10);
rect(200, 120, 300, 10);
rect(200, 140, 300, 10);
rect(200, 160, 300, 10);
rect(200, 180, 300, 10);
rect(200, 200, 300, 10);
rect(200, 220, 300, 10);
rect(200, 240, 300, 10);
rect(200, 260, 300, 10);
rect(200, 280, 300, 10);

}

void group3() {
  size(700, 400);
  background(24, 205, 240);
  noStroke();
  ellipseMode(CENTER);
  frameRate(30);


  fill(21, 211, 54);
  background(24, 205, 240);
  
  a = a + 0.04;
  s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s);
  ellipse(700, 400, 200, 200);
  
  translate(75, 0);
  scale(s); 
  ellipse(0, 0, 200, 200); 

}
