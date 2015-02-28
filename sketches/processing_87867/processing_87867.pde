
float xPos=width/2;
float xDir=1;
float y=1;

void setup() {
  size (600,600);
}

void draw() {
  background(200);
  translate(width/7,height/7);
  pushMatrix();
  scale(.75);
  xPos=xPos+xDir;
  translate(xPos,y);
  if (xPos>width-75)
    {
      xDir=-1;
    }
  if (xPos<-50) {
   xDir=1;
  } 
  ellipse(0,45,35,40);//left ellipse (looking at bot)
  ellipse(100,45,35,40);//right ellipse
  fill(64,128,255);
  rect(0,0,100,100);//head
  fill(204,64,0);
  line(-17,45,-55,0);//left antenna
  line(117,45,127,-15);//right antenna
  fill(240);
  rect(15,25,25,25);//left eye
  rect(60,25,25,25);//right eye
  fill(random(255));
  rect(20,75,60,5);//mouth
  fill(255,255,70);
  rect(20,100,60,15);//neck
  fill(64,128,255);
  rect(-25,115,150,175);//body
  fill(255,255,70);
  ellipse(85,165,60,75);
  rect(-15,125,65,75);
  fill(204,64,0);
  rect(-15,215,130,60);
  fill(255,255,70);
  rect(-35,125,10,30);//left arm connector
  rect(125,125,10,30);//right arm connector
  fill(64,128,255);
  rect(-60,120,25,135);//left arm
  rect(135,120,25,135);//right arm
  fill(204,64,0);
  triangle(-48,290,-68,255,-48,255);
  triangle(-48,290,-28,255,-48,255);//left hand
  triangle(148,290,128,255,148,255);
  triangle(148,290,168,255,148,255);//right hand
  fill(64,128,255);
  rect(0,290,35,150);//left leg
  rect(65,290,35,150);//right leg
  fill(204,64,0);
  rect(-5,440,45,30);//left foot
  rect(60,440,45,30);//right foot
  popMatrix();
}
