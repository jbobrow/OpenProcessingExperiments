
boolean button = false;

float state = 0;
float speed = 10;

float snowX = 250;
float snowY = 10;
float bodyX = 200;
float bodyY = 200;
float hatY = 50;


void setup() {
  size(500,500);


  smooth();
}

void draw() {
  background(0,50,150);


  //make snow
  fill(250);
  for (int x=0; x<height;x+=30) {
    for (int y=0;y<width;y+=30) {
      float a = random(5);
      float b = random(5);
      ellipse(x,y,a,b);
    }
  }

  fill(255);
  rect(0,600,1000,500);



  //make hat

  stroke(5);
  fill(0);
  rectMode(CENTER);
  rect(snowX,bodyY-50,50,hatY);

  //make body
  fill(250);
  ellipse(snowX,bodyY,100,100);
  ellipse(snowX,bodyY+100,bodyX,bodyX);

  //make buttons
  fill(0);
  ellipse(snowX,bodyY+40,17,17);
  ellipse(snowX,bodyY+90,20,20);
  ellipse(snowX,bodyY+140,17,17);

  //make face
  float eyeR = random(255);
  float eyeG = random(255);
  float eyeB = random(255);
  fill(eyeR,eyeG,eyeB);
  ellipse(snowX+20,bodyY-25,snowY,snowY);
  ellipse(snowX-20,bodyY-25,snowY,snowY);
  frameRate(30);
  fill(snowX,snowY,0);
  rectMode(CENTER);
  rect(snowX,bodyY-10,10,10);


  snowY = snowY+1;
  if(snowY > 30) {
    snowY = 0;
  }


  if(state == 0) { 
    snowX = snowX + speed;
    if(snowX > width-10) {
      snowX = width-10;
      state = 1;
    }
  }
  else if(state == 1) {
    snowX = snowX - speed;
    if(snowX < 10) {
      snowX = 10;
      state = 2;
    }
  } 
  else if(state == 2) {
    snowX = snowX + speed;
    if(snowX > width/2) {
      snowX = width/2;
      state = 3;
    }
  }
  else if(state == 3) {
    bodyY = bodyY-speed;
    if(bodyY < 10) {
      bodyY = 10;
      state = 4;
    }
  }
  else if(state == 4) {
    bodyY = bodyY+speed;
    if(bodyY > 200) {
      bodyY = 200;
      state = 0;
    }
  }
}



void mousePressed() {
  button = !button;
}


