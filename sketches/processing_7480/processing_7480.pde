
float a = 0.0;
 float inc ;
 //float sy;
 int m;
 float center1;
 float center;
int width=800;
int height=500;
int y=250;
void setup()
{
  size(width,height);
  background(0);
  smooth();
}

void draw()
{
  noFill();
  stroke(0);
//  strokeWeight(1);
//  stroke(random(255));
// line(0,220,800,230);
// strokeWeight(1);
//stroke(random(255));
//line(0,260,800,270); 
 
// if(mousePressed==true)
// {
//   save("pulse.jpg");
// }
}
void mouseMoved()
{
  if(sqrt(sq(pmouseX-mouseX)+sq(mouseY-pmouseY))>3)
  //if(abs(pmouseX-mouseX)>50)
  {
    noStroke();
  fill(0,80);
 rect(0,0,800,500);
 
// noStroke();
// fill(int(random(255)));
// ellipseMode(CENTER);
// ellipse(mouseX,mouseY,int(random(100,200)),int(random(100,200)));
 // stroke(100,0,int(random(100,255)));
 stroke(255,0,0);
 noFill();
 strokeWeight(5);
  strokeJoin(ROUND);
  strokeCap(ROUND);
//  if(abs(pmouseX-mouseX)<50)
//  {
//    if(mouseX-pmouseX>0)
//    {center=center1+50;}
//    else
//    {
//      center=center1-50;
//    }
//  }
//  else
//  {
//    center=mouseX;
//  }
//  center1=center;
 //drawECG(conter);
 center=mouseX;
  float cx1=center-5;
 float cx2=center+5;
 float cy1=((20000-cx1)/80);
 float cy2=((20000-cx2)/80);
 float centery=((20000-center)/80);
 line(0,250,cx1-20,cy1);
 sintail(cy1,cx1-20,cx1+1,cy1);
 beginShape();
 vertex(cx1,cy1);
 int h=int(random(-70,130));
 vertex(center,centery-h);
 vertex(cx2,cy2);
 endShape();
 sintail(cy2,cx2,cx2+21,cy2);
 line(cx2+21,cy2,800,240);

}
}



//to draw sine wave
void sintail(float sy,float starti,float endi,float yy)
{
   inc=(2*PI)/20;
 noFill();
 a=0;
 m=int(random(10,20));
 for(float i=starti; i<endi;i++) {
  
 line(i, sy, i, yy+sin(-a)*m);
  sy=yy+sin(-a)*m;
  a = a + inc;
}
}

