
//Copyright © 2012 Dakotah Konicek
//HW4

//initial moves along the x axis with the mouse.
//Press 'b' to bounce the initial.
//Press 'c' to clear background with new random color
//bounce it in the basket

 float x,y,wd,ht,s, gravity;
void setup()
{
  size (400,400);
  smooth();
  s=1;
  gravity=1.02;
 background(random(255),random(255),random(255));
}

void draw()
{
 //basket
 fill (#FA5219);
 rect(330,30,70,10);
 //calling the initial
  drawInitial(pmouseX,(y));
  y=y+s;
  s=s+gravity;
  if(y>height)
  {y=400;
  s=s*-.60;
  
  if (keyPressed)
  {if (key == 'b')
    {
      s=s*2*gravity; 
      if(y<10)
      {s=s*-.60;}
    }
  if(key=='c')
    { background(random(255),random(255),random(255));
  }
  }
}
//defining the initial

}
void drawInitial(float x, float y)
{
wd=80;
ht=80;
ellipseMode(CENTER);
fill(80,103,122);
ellipse(x,y,wd,ht);

//inner ellipse
fill(164,210,250);
ellipse(x,y,.8*wd,.8*ht);
noFill();

//Line for D
stroke(#FAF142);
strokeWeight(5);
arc(x,y, .4*wd, .4*ht, -PI,0);

//Line for K
stroke(#FAF142);
strokeWeight(5);
beginShape();
curveVertex(x-(.3*wd), y+(.45*wd));
curveVertex(x-(.2*wd), y+(.3*wd));
curveVertex(x-(.1*wd), y+(.15*wd));
curveVertex(x, y);
curveVertex(x+(.1*wd), y+(.15*wd));
curveVertex(x+(.2*wd), y+(.3*wd));
curveVertex(x+(.3*wd), y+(.45*wd));
endShape();

//Line for D and K
stroke(80,103,122);
strokeWeight(5);
beginShape();
vertex(x-(.3*wd), y);
vertex(x+(.3*wd),y);
endShape();


}

