
int c1=150;
int c2=0;
boolean c = false;
void setup( )
{
  size(600, 150);
   
}
  void draw()
  {
    frameRate(5);
    fill(255,255,255,20);
    noStroke();
    rect(0,0,600,150);
  smooth();
  stroke(94,164,206,random(255));
  strokeWeight(20);
  noFill();
  beginShape();
  vertex(0, 75); // first point
bezierVertex(0, 75, 50, c2, 100, 75);
bezierVertex(100, 75, 150, c1, 200, 75);
bezierVertex(200, 75, 250, c2, 300, 75);
bezierVertex(300, 75, 350, c1, 400, 75);
bezierVertex(400, 75, 450, c2, 500, 75);
bezierVertex(500, 75, 550, c1, 600, 75);
endShape();
if (c2 >= 0 && c == false )
  {c2 += 5;}
if (c2 >= 150)
  { c = true;}
if (c2 <= 150 && c == true)
  {c2 -= 5;}
if (c2 <= 0)
  {c = false;}
  
if (c1 <= 150 && c == false )
  {c1 -= 5;}
if (c1 <= 0)
  { c= true;}
if (c1 >= 0 && c == true)
  {c1 += 5;}
if (c1 >= 150)
  {c = false;}

  }



