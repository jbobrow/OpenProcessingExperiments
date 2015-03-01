

float dx, dy, ex, ey, ax, ay;
float dist=100;
float degree, degree2, degree3;
float radian, radian2, radian3;



void setup()
{
  size(300, 300);
  smooth();
  background(205);
  degree=0;
  degree2=0;
}

void draw()
{
  degree+=0.5;
  degree2+=0.2;
  degree3+=0.4;
  radian = TWO_PI/180*degree;
  radian2=TWO_PI/150*degree2;
  radian3=TWO_PI/120*degree3;

  fill(205, 3);
  noStroke();
  rect(0, 0, width, height);
  noFill();
  
  ax=cos(radian3)*(dist-5)+width/2;
  ay=sin(radian3)*(dist-5)+height/2;
  stroke(200,20,15);
  strokeWeight(3);
  line(ax,ay,width/2,height/2);

  ex=cos(radian2)*(dist+10)+width/2;
  ey=sin(radian2)*(dist+10)+height/2;
  stroke(255, 100, 50);
  strokeWeight(3);
  line(ex, ey, width/2, height/2);

  dx = cos(radian)*dist+width/2;
  dy = sin(radian)*dist+height/2;
  stroke(255, 0, 0);
  strokeWeight(3);
  line(dx, dy, width/2, height/2);
  
  if(degree>360)
  {
    degree=0;
  }
  if(degree2>360)
  {
    degree2=0;
  }
  if(degree3>360)
  {
    degree3=0;
  }
  
}



