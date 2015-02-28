
float r=200;//15  // size or radius of the Bigger Circle
float inc =1,theta = 50;
float x, y,a=0;
//boolean flag=true;
//float left=150,right=30;

void setup()
{
  size(600, 600);
  frameRate(300);
}

void draw() {
  background(220, 100);

  translate(width/2, height/2);
  fill(255, 0, 0, 10);
   theta += inc;

 if(theta > 150 || theta < 50)
   inc *= -1;
  x = r * cos(radians(theta));
  y = r * sin(radians(theta));
  
  line(0,0,x,y);
  ellipse(x, y, 20, 20);
  
   //theta *=.007;
 
}

