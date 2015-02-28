
int s;
int m;
int h;

void setup() {
  size(400, 400);  
}

void wall() {

  strokeWeight(2);
  stroke(0);
  for (int i = 0; i < 12; i++) {
    float dx = cos(i * TWO_PI / 12);
    float dy = sin(i * TWO_PI / 12); 
    line(200 + 130 * dx, 200 + 130 * dy, 200 +140 * dx, 200 + 140 * dy);
  }
}

void secondellipse() {
  noStroke();
  
  fill(255,12,3*s, 250-3*s);
  if (s<60) {
    ellipse(width/2, height/2, s*3, s*3);
  } 
  else {
    s=0;
  }
  
}

void minuteandhour() {
  
  if (!mousePressed){
  stroke(0);
  translate(width/2, height/2);
  strokeWeight(2);
  
  pushMatrix();
  rotate(radians (6*m));
  line(0, 0, 0, -100);
  popMatrix();
  
  pushMatrix();
  rotate(radians (30*h));
  line(0, 0, 0, -50);
  popMatrix();
  }
  
 if(mousePressed){
  int m=mouseX;  
  int h=mouseY;  
  
  stroke(0);
  translate(width/2, height/2);
  strokeWeight(2);
  
  pushMatrix();
  rotate(radians (6*m));
  line(0, 0, 0, -100);
  popMatrix();
  
  pushMatrix();
  rotate(radians (30*h));
  line(0, 0, 0, -50);
  popMatrix();
  }
}


  void draw() {
    background(255);

    s=second();
    m=minute();
    h=hour();
    
    secondellipse();
    wall();
    minuteandhour();
  }
