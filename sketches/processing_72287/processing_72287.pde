
float circleX=350;
float circleY=250;
float circleH1=100;
float circleH2=50;
float circleW1=100;
float circleW2=50;
float r1=25;
float r2=163;
float r3=250;
float g1=130;
float g2=0;
float g3=140;
float b1=140;
float b2=37;
float b3=130;
float change=0.5;


void setup(){
  size(700,500);
  smooth();
  frameRate(30); //was too fast otherwise
}

void draw(){
  background(r1,g1,b1);
   //first largest elipse
  stroke(0);
  fill(r2,g2,b2);
  ellipse(circleX,circleY,circleH1,circleW1);
  //second ellipse inside first
  stroke(0);
  fill(r3,g3,b3);
  ellipse(circleX,circleY,circleH2,circleW2);
  
  //change vlaue of all varaibles
  circleX=circleX+change;
  circleY=circleY+change;
  circleH1=circleH1+change;
  circleH2=circleH2+change;
  circleW1=circleW1+change;
  circleW2=circleW2+change;
  r1=r1+change;
  r2=r2-change;
  r3=r3-change;
  g1=g1-change;
  g2=g2+change;
  g3=g3-change;
  b1=b1-change;
  b2=b2+change;
  b3=b3-change;
}

  
  

