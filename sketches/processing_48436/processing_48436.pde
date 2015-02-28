


void setup ()
{
  size (400,600) ;
  background(0,255,0);
  smooth();
  textAlign(TOP);
  frameRate(15);
}

void draw ()
{
  fill(255,255,255, 75);
  rect(0,255, width,height);
  ellipse(200,450,150,150);
  ellipse(200,325,120,120);
  ellipse(200,225,100,100);
  fill(0,0,0);
  ellipse(200,350,15,15);
  ellipse(200,300,15,15);
  ellipse(200,325,15,15);
  ellipse(190,220,10,10);
  ellipse(210,220,10,10);
  textSize(36);
  fill(255,0,0 );
  text("Merry Christmas!",65,61  );
  
}



