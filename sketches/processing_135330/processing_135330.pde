

float eyeH[]= {30,67};
float eyeDiam[]= {25,35};
float noseOne[]= {32,255};
float noseTwo[]={222,400};
float hat[]= {89,255};
float cheeks[]= {0,25};
float noseSize[]= {30,45};
//
float _eyeH= 30;
float _eyeDiam= 25;
float _noseOne = 32;
float _noseTwo = 222;
float _hat = 89;
float _cheeks = 15;
float _noseSize = 30;
void setup() {
  size(300, 300);
  background(240, 237, 194);
  
}

void draw() {
  makeFace();
  smooth();
 
}

void keyPressed() {
  //intergers go here
  _eyeH = random(eyeH[0],eyeH[1]);
  _eyeDiam = random(eyeDiam[0],eyeDiam[1]);
  _noseOne = random(noseOne[0],noseOne[1]);
  _noseTwo = random(noseTwo[0],noseTwo[1]); 
  _hat = random(hat[0],hat[1]);
  _cheeks = random(cheeks[0],cheeks[1]);
  _noseSize = random(noseSize[0], noseSize[1]);
}

void makeFace() {
  //head
  size(300, 300);
  background(52,52,100);
  translate(150, 150);
  ellipseMode(CENTER);
  fill(255,255,255);
  noStroke();
  ellipse(0, 0, 145, 150);
  //eyes
  fill(255);
  stroke(0);
  ellipse(-25, -25, 20, _eyeH);
  ellipse(25, -25, 20, _eyeH);
  fill(0);
  ellipse(-25, -22, 15, _eyeDiam);
  fill(0);
  ellipse(25, -22, 15, _eyeDiam);
  //nose
  noStroke();
  ellipseMode(CENTER);
  fill(_noseTwo, 12, _noseOne);
  ellipse(0, 0, _noseSize, 30);

  //mouth
  fill(90);
  stroke(0);
  ellipse(0, 42, 72, 40);

  //mouth
  fill(255, 255, 255);
  stroke(255, 255, 255);
  ellipse(0, 25, 65, 20);

  //hat
  noStroke();
  fill(161, _hat, 228);
  triangle(0, -120, -54, -58, 50, -60);

  //hat on top
  fill(246, 243, 5);
  ellipse(0, -130, -30, 30);

  //cheeks
  fill(247,90,175);
  ellipse(-40, _cheeks, 25, 25);
  ellipse(40, _cheeks, 25, 25);
}


