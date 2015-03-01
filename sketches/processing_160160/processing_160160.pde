
float i = 0, a =0, b =0, s = 0, t = 0, u = 0, v = 0;
float d = 4;
float e = 4;
int time;
float positionX = 50*sin(i);
float positionY = 50*cos(i);
float positionXb = 50*sin(b);
float positionYb = 50*cos(b);

float positionXs = 100*sin(s);
float positionYs = 100*cos(s);
float positionXt = 100*sin(t);
float positionYt = 100*cos(t);

float positionXp = 200*sin(u);
float positionYp = 200*cos(u);
float positionXq = 200*sin(v);
float positionYq = 200*cos(v);

void setup() {
  size(600, 600);
}
void draw() {
  if (time +4000 > millis()) {
  }
  else {
    //rect (100,100,500,500);

    // noStroke();
    time =millis();
  }
  noStroke();
  // background(20,20,200,0.1);
  fill (30, 30, 30, 10);
  rect (0, 0, width, height);
  //fill(255);
  stroke (254, 43, 42, 80);
  fill (255, 0, 0, 99);
  translate(0, 100);
  i=i+-0.004;
  b=b+0.004;
  s = s + 0.004;
  t = t - 0.004;
  u = u + 0.004;
  v = v - 0.004;

  positionX = 50*sin(i);
  positionY = 50*cos(i);
  positionXb = 50*sin(b);
  positionYb = 50*cos(b);

  positionXs = 100*sin(s);
  positionYs = 100*cos(s);
  positionXt = 100*sin(t);
  positionYt = 100*cos(t);

  positionXp = 200*sin(u);
  positionYp = 200*cos(u);
  positionXq = 200*sin(v);
  positionYq = 200*cos(v);


  pushMatrix();
  for (int i =0; i<2;i++) {
    translate (300, 100);
    ellipse( positionXs+-300*i, positionYs+-300*i, e, e);
    ellipse( positionXt+-300*i, positionYt+-300*i, e, e);

    rotate (PI);
    translate (0, 0);
    ellipse( positionXs+300*i, positionYs+300*i, e, e);
    ellipse( positionXt+300*i, positionYt+300*i, e, e);
  }
  popMatrix();
  pushMatrix();
  translate (200, 200);
  rotate (PI/2);

  for (int i =0; i<2;i++) {
    ellipse( positionXs+0*i, positionYs+-200*i, e, e);
    ellipse( positionXt+0*i, positionYt+-200*i, e, e);
  }
  popMatrix();
  pushMatrix();  
  translate (400, 200);
  rotate (PI+PI/2);
  for (int i =0; i<2;i++) {
    ellipse( positionXs+0*i, positionYs+-200*i, e, e);
    ellipse( positionXt+0*i, positionYt+-200*i, e, e);
  }
  popMatrix();

  pushMatrix();   
  translate (250, 100); 
  for (int i = 0;i<2; i++) {
    ellipse(positionX+100*i, positionY+0*i, d, d);
    ellipse(positionXb+100*i, positionYb+0*i, d, d);
  }
  translate (-100, 100); 
  for (int i = 0;i<4; i++) {
    ellipse(positionX+100*i, positionY+0*i, d, d);
    ellipse(positionXb+100*i, positionYb+0*i, d, d);
  }
  translate (100, 100); 
  for (int i = 0;i<2; i++) {
    ellipse(positionX+100*i, positionY+0*i, d, d);
    ellipse(positionXb+100*i, positionYb+0*i, d, d);
  }
  popMatrix(); 

  pushMatrix();   
  rotate (PI);
  translate (-350, -300); 
  for (int i = 0;i<2; i++) {
    ellipse(positionX+100*i, positionY+0*i, d, d);
    ellipse(positionXb+100*i, positionYb+0*i, d, d);
  }
  translate (-100, 100); 
  for (int i = 0;i<4; i++) {
    ellipse(positionX+100*i, positionY+0*i, d, d);
    ellipse(positionXb+100*i, positionYb+0*i, d, d);
  }
  translate (100, 100); 
  for (int i = 0;i<2; i++) {
    ellipse(positionX+100*i, positionY+0*i, d, d);
    ellipse(positionXb+100*i, positionYb+0*i, d, d);
  }
  popMatrix(); 
  pushMatrix();
  translate (300, 50); 
  rotate(PI/2);
  for (int i = 0;i<1; i++) {
    ellipse(positionX+0*i, positionY+-100*i, d, d);
    ellipse(positionXb+0*i, positionYb+-100*i, d, d);
  }
  translate (100, -100); 
  for (int i = 0;i<3; i++) {
    ellipse(positionX+0*i, positionY+100*i, d, d);
    ellipse(positionXb+0*i, positionYb+100*i, d, d);
  }
  translate (100, 0); 
  for (int i = 0;i<3; i++) {
    ellipse(positionX+0*i, positionY+100*i, d, d);
    ellipse(positionXb+0*i, positionYb+100*i, d, d);
  }
  translate (100, 100); 
  for (int i = 0;i<1; i++) {
    ellipse(positionX+0*i, positionY+100*i, d, d);
    ellipse(positionXb+0*i, positionYb+100*i, d, d);
  }
  popMatrix(); 
  pushMatrix();
  translate (300, 350); 
  rotate(PI+PI/2);
  for (int i = 0;i<1; i++) {
    ellipse(positionX+0*i, positionY+-100*i, d, d);
    ellipse(positionXb+0*i, positionYb+-100*i, d, d);
  }
  translate (100, -100); 
  for (int i = 0;i<3; i++) {
    ellipse(positionX+0*i, positionY+100*i, d, d);
    ellipse(positionXb+0*i, positionYb+100*i, d, d);
  }
  translate (100, 0); 
  for (int i = 0;i<3; i++) {
    ellipse(positionX+0*i, positionY+100*i, d, d);
    ellipse(positionXb+0*i, positionYb+100*i, d, d);
  }
  translate (100, 100); 
  for (int i = 0;i<1; i++) {
    ellipse(positionX+0*i, positionY+100*i, d, d);
    ellipse(positionXb+0*i, positionYb+100*i, d, d);
  }

  popMatrix();
}
void mousePressed() {
  background(54);
}
