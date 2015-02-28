
//je crée mon sketch
void setup ()
{
  size (500,500);
  background(#67FFA5);
  smooth();
  println();
}

//je crée une fonction draw
void draw ()
{ frameRate (40);
  line (0,0,random (500),500);
  line (random (500),random(500),random (0),0);
  noFill();
  ellipse(250,250, random(350),random(400) );
  ellipse(250,250,random(150),random(200));
  ellipse(250,250,random(30),random (50) );
}

