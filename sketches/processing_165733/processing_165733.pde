
float angle;
float jitter;

void setup() {
  size(1280, 720);
  frameRate(90000);
}
void draw() {

  if (key=='q'|| key== 'Q') {
    Continuity();
  } 
  if (key=='w'|| key== 'W') {
    Closure();
  } 
  if (key=='e'|| key== 'E') {
    proximity();
  }
}

void Continuity() {
background(0);


  noStroke();
  fill(255);
  rectMode(mouseX+Y);





  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 80== 3) {  
    jitter = random(10, .0000001);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  rect(mouseX, mouseY, 0, 0);
}



void Closure() {
  size(1280, 720);
  noStroke();
  fill(0);
  background(0);


  stroke(180);
  fill(0);
  rect(640, 360, 200, 200);

  stroke(0);
  fill(0);
  rect(540, 460, 100, 100);
  stroke(0);
  fill(0);
  rect(840, 660, 300, 300);

  stroke(0);
  fill(0);
  rect(540, 460, 100, 100);
}

void proximity() { 
 // background(180);



  if (mousePressed) {
    background(180);
  } 


  stroke(180);
  fill(180);
  triangle(-640, -360, -100, 200, 200, 400);
  stroke(180);
  fill(180);
  triangle(640, 360, 100, -200, 200, 400);
  stroke(180);
  fill(180);
  triangle(6, 3, 100, 200, 200, 400);
  stroke(180);
  fill(180);
  triangle(6, 360, 900, 900, 900, 900);
  stroke(180);
  fill(180);
  triangle(640, 360, 900, 900, 900, 900);

  stroke(random(100), random(100), random(250));
  fill(random(255), random(100), random(100));
  ellipse(mouseX, mouseY, 300, 300);
}







