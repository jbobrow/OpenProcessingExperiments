
//homework 6
//Copyright Kinnari Thakker 2011, Pittsburgh 15224

float i,j,sz;

void setup()
{
  size (600,600);
  smooth();
  background (125);  
  frameRate(10);
}


void draw()
{
  i=25;
  j=25;
  sz=0;
  
  while(i <= width && j <= height)
  {
    i=i+50;
    Initials(i, 25, 50,50);
    Initials(i, width-25, 50,50);
    Initials(25, j, 50,50);
    Initials(height-25, j, 50,50);
    j=j+50;
   }
}

void mouseClicked()
{
  if(mouseX <= width && mouseY <= height)
  {
    sz=mouseX*0.4;
    Initials(mouseX,mouseY,sz,sz);
  }
}
 


//__________________________________________________________________________

void Initials(float x, float y, float wd, float ht) //Setting up Initials
{

  fill(50,165,130);  // Bounding ellipse
  noStroke();
  ellipse(x,y,wd*.9, ht*.9);

  noFill();    // Initial strokes start here
  strokeWeight(4);
  strokeCap(SQUARE);
  stroke(164,211,151);



//k
beginShape();
vertex(x-.3*wd, y+.3*ht);
vertex(x-.3*wd,y-.3*ht);
vertex(x-.3*wd,y+.05*ht);
bezierVertex( x-.15*wd,y-.125*ht,    x-.1*wd,y-.02*ht,      x-.1*wd,y);
bezierVertex(  x-.150*wd,y+.125*ht,  x-.3*wd,y+.075*ht,    x-.275*wd,y+.05*ht);
bezierVertex(  x-.125*wd,y+.3*ht,  x-.125*wd,y+.3*ht,    x-.075*wd,y+.3*ht);
endShape();

//stem of the a
//stroke(249,240,205);
stroke(240,227,245);
beginShape();
vertex(x-.05*wd, y);
//point(x-.05*wd, y-.05*ht);
bezierVertex(  x+.125*wd,y-.15*ht,  x+.125*wd, y+.15*ht,  x+.125*wd,y+.15*ht);
bezierVertex(  x+.125*wd,y+.3*ht,  x+.125*wd, y+.3*ht,  x+.175*wd,y+.3*ht);
endShape();

//round part of the a
beginShape();
vertex(x+.125*wd,y+.15*ht);
bezierVertex(  x+.025*wd, y+.05*ht,  x-.05*wd, y+.1*ht, x-.05*wd,y+.2*ht );
bezierVertex(  x-.05*wd, y+.325*ht,  x+.075*wd, y+.325*ht, x+.125*wd,y+.225*ht );
endShape();

//t
stroke(222,191,67);
beginShape();
vertex(x+.225*wd,y-.15*ht);
vertex(x+.225*wd, y+.25*ht);
bezierVertex(  x+.225*wd,y+.3*ht,  x+.225*wd, y+.3*ht,  x+.275*wd,y+.3*ht);
endShape();

//crossing the t
beginShape();
vertex(x+.150*wd,y-.075*ht);
vertex(x+.3*wd, y-.075*ht);
endShape();
}

