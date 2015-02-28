
float snowX;
float snowY;
float hatY;
float bodyX;

void setup() {
  size(500,500);
  snowX = width/2;
  snowY = 10;
  bodyX = 200;
  hatY = 50;
  
  smooth();
}

void draw() {
  background(0,50,150);
  //make snow

  fill(250);
  for (int x=0; x<501;x+=30) {
    for (int y=0;y<501;y+=30) {
      ellipse(x,y,2,2);
    }
  }


  //make hat

  stroke(5);
  fill(0);
  rectMode(CENTER);
  rect(snowX,150,50,hatY);
  hatY = hatY+10;
  if(hatY > 500) {
    hatY = 50;
    
  }

  fill(255);
  rect(0,600,1000,500);

  //make body
  fill(250);
  ellipse(snowX,200,100,100);
  ellipse(snowX,300,bodyX,bodyX);
  bodyX = bodyX+10;
  if(bodyX > 230) {
    bodyX = 200;
  }

  //make buttons
  fill(0);
  ellipse(snowX,240,17,17);
  ellipse(snowX,290,20,20);
  ellipse(snowX,340,17,17);




  //make face
  float eyeR = random(255);
  float eyeG = random(255);
  float eyeB = random(255);
  fill(eyeR,eyeG,eyeB);
  ellipse(snowX+20,175,snowY,snowY);
  ellipse(snowX-20,175,snowY,snowY);
  frameRate(30);
  fill(snowX,snowY,0);
  rectMode(CENTER);
  rect(snowX,190,10,10);


  snowY = snowY+1;
  if(snowY > 30) {
    snowY = 0;
  }
  snowX = random(249,251);
}


