
float angle=0;
float s=1;
float scaleSpeed=.01;
float counter=0;
float hue=0.0;
float offset=10;
float s2=1;
float s3=1;
float scaleSpeed2=.015;
float scaleSpeed3=.02;
float angle2=0;
float angle3=0;
void setup()
{
  size(500,500);
}
void draw()
{
  counter+=1/30.0;
  println(counter);
  angle+=0.1;
  s+=scaleSpeed;
  if (s>3 ||s<0)
  {
    scaleSpeed=-scaleSpeed;
  }
  fill(random(0,255),random(0,255),random(0,255));
  if(counter<20)
  {
  float degrees=radians(45);
  rectMode(CENTER);
  pushMatrix();
  translate(300,20);
  rotate(degrees);
  scale(s);
  quad(0,0,100,100,150,200,100,300);
  popMatrix();
  }
 
 if(counter>20&&counter<30)
 {
  pushMatrix();
  translate(width/2,height/2);
  rotate(angle);
  rect(0,0,100,100);
  popMatrix();
 }
 else if (counter>30)
 {
   drawEllipse();
 }
}
float ellipseX=0.0;
void drawEllipse()
 {
   angle2+=.02;
   angle3+=.01;
   s2+=scaleSpeed2;
   s3+=scaleSpeed3;
   if(s2>3||s2<0)
   {
     scaleSpeed2=-scaleSpeed2;
   }
   if(s3>3||s3<0)
   {
     scaleSpeed3=-scaleSpeed3;
   }
   colorMode(HSB,360,100,100);
   ellipseX+=1;
   hue+=offset;
   if(hue>=360)
   {
     offset=-offset;
   }
   else if(hue<=0)
   {
     offset=-offset;
   }
   fill(random(0,360),100,100);
   float ellipseY=(height/2+tan(radians(ellipseX*2))*100);
   pushMatrix();
   translate(ellipseX,ellipseY);
   rotate(angle);
   scale(s2);
   rect(0,0,100,100);
   popMatrix();
   fill(random(0,360),100,random(0,100));
   float ellipseZ=height/2+cos(radians(ellipseX*3.0))*100;
   pushMatrix();
   translate(ellipseX,ellipseZ);
   rotate(angle);
   scale(s3);
   ellipse(0,0,50,50);
   popMatrix();
}


