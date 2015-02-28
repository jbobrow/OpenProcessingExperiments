
void setup()
{ 
  background(0);
  size(600,600,P3D);
  noLoop();
}


float angle=1;
int i=1;
float r;
int d;
int c=0;
//float n=0.1;

float increase=1;

void draw()
{ //smooth();
noStroke();
  translate(400,10);

  while(i<300)
  {
    r=pow(i,0.5);

    rotateY(radians(angle));
    rotateX(radians(angle));
    rotateZ(radians(angle));

    
    translate(0,r,r);
    
    fill(c,100-c,255-c,80);
    box(20,1,20+i);
   // increase+=0.1;
    i+=2;
    c+=1;

  }
}

void mouseMoved()
{   background(0);
 // translate(mouseX,mouseY);
  //n=0.1;
  i=1;
  c=0;
  d=mouseX/10;
increase=1;
  angle+=d;

  redraw();
  delay(100);
}


//angle changes so spiral changes.
// let angle depend on mouse
// REDRAW SO THAT EVERY TIME MOUSE POS CHANGES DRAW CALLED AFRESH
// variables are i, r that depends on i and angle 
// every time mouse pos changes i started from beginning 


