
void setup()
{
  size(400,400);
  smooth();

  stroke(75,120,100);
  strokeWeight(10);

  //dial
  fill(150,120,10);
  ellipse(200,200,250,250);

  //pivot
  
  ellipse(200,200, 12,12);


  //line(200,200,200,70);
  line(200,200, 200,100);
}

float angle=1.5*PI;


void draw()
{

  background(200);
  ellipse(200,200,250,250); // Clock face

  
  if(mousePressed && insideCircle(200,200,100,mouseX,mouseY))
  {    
    fill(mouseX,(mouseX+mouseY),mouseY);
  }
  
  if(mousePressed && insideCircle(int(200+ 75*cos(angle)),int(200+ 75*sin(angle)),30,mouseX,mouseY))
  {    
    angle=lineAngle(200,200, mouseX,mouseY);
  }

  //pivot
  //fill(0);
  ellipse(200,200, 12,12);

  //line(200,200, 200+70*cos(angle),200+70*sin(angle));
  
  line(200,200, 200+100*cos(angle),200+100*sin(angle));
  
  //fill(75,120,100);
  ellipse(200+ 75*cos(angle),200+ 75*sin(angle), 30,30);
}


boolean insideCircle(int centerx,int centery,int radius,int x,int y)
{
  int dx,dy;
  dx=x-centerx;
  dy=y-centery;
  if(radius*radius >= dx*dx+dy*dy)
    return true;
  else
    return false;
}

float lineAngle(int startx,int starty,int endx,int endy)
{
  //float angle;
  angle=atan2(float(endy-starty),float(endx-startx));

  if(angle>=0)
    return angle;
  else
    return 2*PI+angle;
}
                                
