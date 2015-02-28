
int ballpos=180;
int time=0;
void setup() {
  size(400,400);
}

void uprightbody () {
  line(150,220,150,270);
  fill(170,170,170);
  ellipse(150,220,30,30);
  line(150,270,135,300);
  line(150,270,165,300);
  line(150,250,130,265);
}

void fallenbody () {
  fill(135,206,250);
    noStroke();
    rect(100,200,100,100);
    fill(170,170,170);
    stroke(0);
    line(300,310,230,310);
    ellipse(290,300,30,30);
    line(280,310,290,320);
    line(290,320,300,310);
    line(230,310,220,320);
    line(220,320,210,315);
    line(230,310,218,303);
}
 
void draw() {
  background(135,206,250);
  frameRate(30);
  stroke(0);
  fill(50,170,0);
  rect(0,300,400,400);
  uprightbody();
   
  time++;
   
  if ((ballpos==180)&&(time>=20)) {
    fill(255);
    line(150,250,180,265);
    ellipse(ballpos,235,5,5);
  }
  else if (time>20) {
    fill(255);
    line(150,250,175,265);
    ellipse(ballpos,235,5,5);
  }
  else {
    line(150,250,180,235);
    fill(255);
    ellipse(ballpos,235,5,5);
  }
  if (time>=20) {
  ballpos+=5;
  }
  if (ballpos>=400) {
    ballpos=0;
  }
  if (ballpos<100) {
    frameRate(10);
  }
  //fallen body
  if ((ballpos>=120)&&(ballpos<=179)) {
    fallenbody();
    time=0;
  }
  for (int a=0; a<100; a+=5) {
    float r=random(30,40);
    fill(255,255,0,r);
    noStroke();
    ellipse(10,10,a,a);
  }
}

