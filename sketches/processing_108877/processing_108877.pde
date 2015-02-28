
//Sam Friedlander
//Copywrite Sept, 5th 2013

float x,y,wd,ht;
float rectwidth,rectheight;
color cal;
void setup()
{
  size (400,400);
  fill(146);
  noStroke();
  x=100;
  y=100;
  wd=width;
  ht=height;
  cal= color(120);
  rectwidth=400;
  rectheight=400;
}

void draw()
{
  //background(200,120,8);
  fill(200,120,8,10);
  rect(0,0,400,500);
  fill(cal);
  ellipse (mouseX,mouseY,rectwidth,rectheight);
  
  x = x +1;
}

void mousePressed()
{
 cal=color (random(255),random(255),random(255));
 if (rectheight>11)
 { rectheight=rectheight-10;
 } 
 else
 {rectheight= 400;}
 if (rectwidth>21)
 { rectwidth=rectwidth-20;} 
 else
 {rectwidth= 400;}
 
 
}


