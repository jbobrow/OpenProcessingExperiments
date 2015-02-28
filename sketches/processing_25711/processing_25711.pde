

float t=0;// time
float delta=0.02;//time step
void setup() 
{
  size(600, 600);
  background(51);
  stroke(255);
  smooth();
  frameRate(60);

}

void draw() 
{
  t=(t+delta);
  if(t>4*PI){
    t=0;
  }
  background(51);

  // inner and outer circle
  fill(150);
  ellipse(300,300,383,383);
  fill(100);
  ellipse(300,300,180,180);
  line(210,300,390,300);

  fill(40);
  pushMatrix();
  translate(300,300);
  rotate(t/2);
  translate(100,100);
  rotate(t);
  murmel();
  popMatrix();

  pushMatrix();
  translate(300,300);
  rotate(t/2+PI);
  translate(100,100);
  rotate(t);
  murmel();
  popMatrix();

  pushMatrix();
  translate(300,300);
  rotate(t/2+PI/2);
  translate(100,100);
  rotate(t);
  murmel();
  popMatrix();

  pushMatrix();
  translate(300,300);
  rotate(t/2-PI/2);
  translate(100,100);
  rotate(t);
  murmel();
  popMatrix();

  pushMatrix();
  translate(300,300);
  rotate(t);
  translate(0,243);
  line(0,-50,0,50);
  popMatrix();
}

void murmel(){
  ellipse(0,0,100,100);
  fill(255);
  arc(0,0,100,100,0,PI/2);
  arc(0,0,100,100,PI,3*PI/2);
  fill(40);
  
  line (0,-50,0,50);
}


