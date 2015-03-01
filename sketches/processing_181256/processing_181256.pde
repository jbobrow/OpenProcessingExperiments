
float a;  // radious of the spiral
float t;  
float xp, yp; // x & y position of the starting point of the spiral
float angle;


void setup()
{
  size(500, 500);
  background(0);
  stroke(255, 153, 51);
  strokeWeight(20);
  strokeJoin(MITER);     
  noFill();
  a = 10;
  xp=width/2;
  yp=height/2;
 
  angle = 0.0;
}

void draw()
{  
  background(0);
  smooth();

 translate(xp,yp);
 
  for (float i=1; i<75; i+=0.1)
  {
    if (mouseX>width/2 && mouseX < width)   // changes stroke color based on mouse position 
    {
      stroke(255, 255, 0);
      strokeWeight(0.5);
      i=i+0.5;
    }
     else if(mouseX<width/2 && mouseY > height/2)    // for changing color in 3rd quater 
     {
     stroke(255,100,50);
      strokeWeight(2);
      i=i+1.2;
     }
    else                           // default rotation
    {
      stroke(random(0, 255), 153, random(0, 255));
      strokeWeight(2);
      i=i+3;
    }
   rotate(angle);

  bezier(0+a*(i*sin(i)+cos(i)),0+a*(sin(i)-i*cos(i)), 0+a*((i+1)*sin(i+1)+cos(i+1)),0+a*(sin(i+1)-(i+1)*cos(i+1)),0+a*(i+2)*sin(i+2)+cos(i+2),0+a*(sin(i+2)-(i+2)*cos(i+2)),0+a*(i+3)*sin(i+3)+cos(i+3),0+a*(sin(i+3)-(i+3)*cos(i+3)));
  }  
  angle=angle+0.004;  // angle of rotation
  

  
}
  



