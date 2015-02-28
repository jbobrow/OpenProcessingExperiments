
void setup ()
{
  size (400,400);
}

void draw ()
{
  background(#000000);
  fill(#0000ff);
  stroke(#000000);
  arc(180,260,40,10,0,3.14);
  noStroke();
  rect(160,240,40,20);
  fill(#ff0000);
  stroke(#000000);
  arc(180,240,80,10,0,3.14);
  noStroke();
  rect(140,90,80,150);
  stroke(#000000);
  arc(180,90,80,10,0,3.14);
  noStroke();
  triangle(180,10,140,90,220,90);
  fill(#0000ff);
  triangle(140,110,110,230,140,230);
  triangle(180,110,170,230,180,230);
  triangle(220,110,220,230,250,230);
 
  stroke(#ff6600);
  line(180,280,180,320);
  line(170,280,160,320);
  line(190,280,200,320);
  noStroke();
  fill(#ffffff);
  ellipse(50,60,60,60);
}
