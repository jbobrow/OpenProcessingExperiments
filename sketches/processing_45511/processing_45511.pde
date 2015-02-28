
float x;
int timex;
int xposition = 0;
int step = 5;
int step2 = 2;
int xposition2 = 500;

void setup(){
  size(500, 500);
  background(255,124,32);
  noStroke();
}

void draw(){
  fill(random(255),random(255),random(255),random(1,5));
  rect(0,0,500,500);
  
  fill(random(255),random(255),random(255),random(10,100));
  ellipse(random(250,450),random(250,450),random(300),random(300));
  
  fill(random(255),random(255),random(255),random(10,60));
  ellipse(random(150,450),random(150,450),random(300),random(300));
  
  fill(random(255),random(255),random(255),random(10,20));
  ellipse(random(0,550),random(0,550),random(200),random(200));

  fill(random(255),random(255),random(255),random(10,150));
  ellipse(random(300,500), random(300,500), random(200), random(200));
  
  
  stroke(0,191,255,random(10,255));
  line(450,450,mouseX,mouseY);
  noStroke();
  ellipse(mouseX,mouseY,random(100),random(100));
  
  fill(255,255,255,random(1,10));
  rect(xposition,0,random(1,10),500);
  xposition = xposition + step;
  rect(0,xposition,500,random(1,10));
  xposition = xposition + step;
  
  if(xposition > 500){
  step = -5;
  }
  if(xposition < 0){
  step = 5;
  }
  
  x = random(1,150);
  timex = round(x);
  delay(timex);
}


