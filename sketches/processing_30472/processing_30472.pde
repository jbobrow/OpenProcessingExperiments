
 size(800,600);
background(255);
smooth();

//background layer top
noFill();
stroke(150,173,0,random(80,100));
for (int u=0;u<100; u++)
{
  strokeWeight(random(0,20));
 point(random(0,width),random(0,height/3-50));
}
//background layer bottom
for (int u=0;u<100; u++)
{
  strokeWeight(random(0,20));
 point(random(0,width),random(height/3+200,height));
}

//set rotation value
float r=PI/12;
//set shape position in canvas
translate(width/2,height/2);
//leaves
 noStroke();
fill(56,137,17,180);
for (int i=0; i<7; i++)
{
 rotate(r/0.1);
  ellipseMode(CORNERS);
  ellipse(0,0,165,48);
}

//shape definition
noStroke();
fill(86,173,237,random(50,180));
//construct shape by loop


//blue flower
for (int i=0; i<30; i++)
{
  rotate (r);
  ellipseMode(CORNER);
  ellipse(0,0,100,60);
}
//second flower
fill(255,180);
for (int i=0; i<30; i++)
{
  rotate (r);
  ellipseMode(CORNER);
  ellipse(0,0,65,15);
}
//center
noFill();
strokeWeight(60);
stroke(255,197,3);
point(0,0);
saveFrame("line-####.png");
