
float angle = random (0, 1);   
float aVelocity = 0.003;
float aAcceleration = .00001;

float startTheta = .0001;
float thetaVel = .02;
float amplitude = .00003;

float circleSize = random(0, 12);

void setup () {
  smooth();
  background(255);
  size(700, 700);
}

void draw () {

  aVelocity += aAcceleration;
  angle += aVelocity;

  startTheta += 0.5;
  float theta = startTheta;
  
  float y = map(sin(theta), -1, 0, 4, height);
  //ellipse(y + aVelocity, y * amplitude * startTheta, circleSize, circleSize);
  
  translate(width/2, height/2);

  for (int i = 50; i < 800; i =  i +10) {
    //for (int j = 0; j < 80; j = j+5) {

    stroke(45, 5, 3);  
    rotate(angle/200);
    //point(y + aVelocity, y * 10);

    strokeWeight(random(0, 1));
    
    point(y + amplitude/6, i - y);
    point(i + aVelocity - 5, i * amplitude);
    point(-i + aVelocity - 5, y * amplitude);


    //stroke(4, 5, 3);
    strokeWeight(random(0, 1.2));

    point(- y + aVelocity * angle, - i * 45);
    point(y + aVelocity * angle, i * 45);
    point(- y + aVelocity , - i * 125);


    point(y + aVelocity, 1);
    point(-y + aVelocity, - i);
    //ellipse(y * aVelocity, i * aVelocity * angle, amplitude, amplitude);



    //ellipse(random(1), random(100), startTheta + circleSize * PI, angle * PI);

    //ellipse(y + aVelocity, y * amplitude * startTheta, 1, 1);
  }
  
  for (int i = 50; i < 500; i =  i + 50) {  
    stroke(45, 5, 83);  
    point(y + aVelocity - 100, y * 125 - 100);
    
  }

}




void keyPressed() {

  if (key == 's') {
    save("normal.png");
    saveHiRes(5);
    exit();



    if (key == 'k') {
      aVelocity = 0;
      startTheta = 0;
      aVelocity = 0;
      angle = 0;
      circleSize = 100;
    }
  }
}

void saveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires.png");
}


