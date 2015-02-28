
void setup()
{
size(250,250);
background(#000000,100);
smooth();
frameRate(20);

 
}
void draw()
{
  //blue
noFill();
stroke(#03fbc9,24);
ellipse(25, 40, random(200),random(200));


//green
noFill();
stroke(#70fa0b,24);
ellipse(220, 200, random(200),random(200));


//purple
noFill();
stroke(#700bfa,24);
ellipse(70, 190, random(200),random(200));


//orange
noFill();
stroke(#faae0b,34);
ellipse(190, 70, random(200),random(200));


//red
noFill();
stroke(#fa380b,34);
ellipse(125,125, random(200),random(200));

  }
