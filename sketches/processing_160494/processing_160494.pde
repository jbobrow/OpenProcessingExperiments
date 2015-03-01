
//credit Anthony for origanal concept

float x;
float xSpeed;
float circleSize;
//mouseX
//mouseY

void setup() {
  frameRate(90);
  size(1000, 900);
  background(0);

  xSpeed = 4;

  //  circleSize = mouseY - height;
  //  x =circleSize/2;
}

void draw() {
  frameRate(random(15, 200));
  stroke(0,0,0,random(50)*50);
  // background(255,255,255,1);
  circleSize = mouseY - height/3;
  fill(mouseY, mouseX, 0, random(20+(mouseY/5)));
  //noStroke();
  
  x+=xSpeed;
  ellipse(x, (mouseY+random(-40, 40)), circleSize/random(2, 4), random(2, 4));
  noStroke();
  ellipse(x, (mouseY+random(-40, 40)), circleSize/random(2), random(2, 4));

  fill(random(mouseY/4), 0, mouseX/4, random((mouseY/70)));
  ellipse(x, (mouseY+random(-40, 40)), circleSize/random(2, 3), circleSize);

  circleSize = mouseY - height;
  fill(mouseY/3, mouseX, 255, (mouseY/130));
  x+=(xSpeed/10);
  ellipse(x, (mouseY+random(40)), mouseY/3, circleSize);


  if (x>=width-(circleSize/2)) {
    xSpeed *=-1;
    x=width - ((circleSize/2)+1);
  }

  if (x<=circleSize/2) {
    xSpeed *=-1;
    x=(circleSize/2) + 2;
  }

  //if (x>
}

void mousePressed() {
  fill(0,0,0,random(25));
 rect(0,0,width/10,height);
 rect(200,0,width/10,height);
 rect(400,0,width/10,height);
 rect(600,0,width/10,height);
 rect(800,0,width/10,height);
 
 }
