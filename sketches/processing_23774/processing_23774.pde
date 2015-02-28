


int circleX = 100;
int circleY = 100;
int circleW = 50;
int circleH = 50;

float eyeR; 
float eyeG; 
float eyeB;

void setup () {
  size(200,200);
  background(255);

  smooth();
}

void draw() {

  ellipseMode(CENTER);
  smooth();
  background(255);

  //draw head
  fill(183,54,159);
  ellipse( circleX,circleY-circleH,circleW,circleH);
  //ellipse(circleX,circleY-50,circleW,circleH);

  //draw body
  ellipse(circleX,circleY,circleW,circleH);

  if (mouseX>50&&mouseY<50) {
    fill(67,15,160);
    ellipse(circleX,circleY+50,circleW,circleH);

  }
    //draw eyes 

    eyeR = random(183); 
    eyeG = random(54); 
    eyeB = random(159); 
    fill(eyeR,eyeG,eyeB);

    ellipse(circleX-10,circleY-50,circleW-40,circleH-30);
    ellipse(circleX+10,circleY-50,circleW-40,circleH-30);

    //draw stinger
    line(100,25,100,15);
    triangle(90,15,110,15,100,5);

    //draw arms{
    eyeR = random(255); 
    eyeG = random(255); 
    eyeB = random(255); 
    fill(eyeR,eyeG,eyeB);
    line(125,100,135,100);
    ellipse(145,100,10,10);

    line(125,150,135,150);
    ellipse(145,150,10,10);

    line(75,100,65,100);
    ellipse(55,100,10,10);

    line(75,150,65,150);
    ellipse(55,150,10,10);
  }



