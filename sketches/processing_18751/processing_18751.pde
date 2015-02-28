
float x;
float y=300;
float radius=20.0;
float speed=2.5;

void setup()
{
  size(250,250);
  noFill();
  stroke(255,80);
  frameRate(65);
}

void draw()
{
  background(#041B3E);
  x=x+0.8;
  translate(x,x-5);
  fill(255,4);
  for(int ex=10; ex<200;ex+=25){
    for(int ey=10; ey<200; ey+=20){
      ellipse (80,80,ex,ey);
    }
  }



  if (x>200){
    x=-30.0;
  } 

  ellipseMode(RADIUS);
  fill(0,12);
  noStroke();
  rect(0,0,width,height);
  stroke(255,80);
  fill(255,180);
  ellipse(30,y,radius,radius);
  ellipse(x+40,y+40,radius,radius);
  ellipse(x-20,60,radius,radius);
  
  y+=speed;
  x+=speed;
  if(y>height+radius){
    y=-radius*3;
    x=radius;

}

}


