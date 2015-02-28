
//Homework 6
//copyright Maitri Shah September 2011 Pittsburgh,PA


float a;

void setup ( )
{
 size(500,500);
 smooth( );
 background (255);

}//void setup end

void draw ( )
{
  a = 30 ;
  while(a < 35 && a > 0 )
  {
   mds( a*10,a*10,a,a);
   a = a - 3;
  }

 noLoop();
}

void mds(float x, float y, float wd, float ht)
{
 //Base Circle
  stroke(255,0,0);
  strokeWeight(a/5);
  fill(random(255),random(255),random(255),1000/a);
  ellipse(x,y,16*wd,16*ht);

 //letter D
  stroke(240,122,12);
  strokeWeight(a/7);
  noFill();

  beginShape();

  curveVertex(x-4*wd,y-8*ht);
  curveVertex(x-2*wd,y-7*ht);
  curveVertex(x,y-6*ht);
  curveVertex(x+wd,y-5*ht);
  curveVertex(x+2*wd,y-3*ht);
  curveVertex(x+3*wd,y);
  curveVertex(x+3*wd,y+5*ht);
  curveVertex(x+wd,y+7*ht);
  curveVertex(x-wd,y+7*ht);
  curveVertex(x-3*wd,y+6*ht);
  curveVertex(x-3*wd,y+4*ht);
  curveVertex(x-2*wd,y+2*ht);
  curveVertex(x,y-ht);
  curveVertex(x+wd,y+ht);
  curveVertex(x+3*wd,y+2*ht);
  curveVertex(x+4*wd,y+3*ht);

  endShape();

 //Letter M

  stroke(178,12,240);
  strokeWeight(a/10);

  beginShape();

  curveVertex(x-9*wd,y+4*ht);
  curveVertex(x-7*wd,y+2*ht);
  curveVertex(x-7*wd,y-2*ht);
  curveVertex(x-6*wd,y-3*ht);
  curveVertex(x-5*wd,y-3*ht);
  curveVertex(x-4*wd,y+2*ht);
  curveVertex(x-3*wd,y-3*ht);
  curveVertex(x-2*wd,y-3*ht);
  curveVertex(x- wd,y-2*ht);
  curveVertex(x- wd,y+2*ht);
  curveVertex(x+wd,y+4*ht);

  endShape();

 //Letter S

  stroke(32,111,27);
  strokeWeight(a/13);

  beginShape();

  curveVertex(x+6*wd,y-4*ht);
  curveVertex(x+5*wd,y-5*ht);
  curveVertex(x+3*wd,y-6*ht);
  curveVertex(x+2*wd,y-6*ht);
  curveVertex(x     ,y-5*ht);
  curveVertex(x     ,y-3*ht);
  curveVertex(x+wd  ,y-  ht);
  curveVertex(x+2*wd,y     );
  curveVertex(x+4*wd,y     );
  curveVertex(x+6*wd,y+  ht);
  curveVertex(x+7*wd,y+2*ht);
  curveVertex(x+7*wd,y+4*ht);
  curveVertex(x+5*wd,y+6*ht);
  curveVertex(x+3*wd,y+6*ht);
  curveVertex(x+  wd,y+5*ht);
  curveVertex(x+  wd,y+3*ht);

  endShape();
}


