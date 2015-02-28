
//hw 3
//Stephanie Park
//seohyunp@andrew.cmu.edu
//© Stephanie Park, 2013

float x, y, wd, ht;

void setup ()
{
  size ( 400, 400 );
  noStroke ();
  x = 0 ;
  y = 0 ; 
  wd = width*.1;
  ht = height*.1;
  frameRate ( 5 ); 

}

void draw ()
{
  background ( 255, 237, 80, random (20));

  noStroke();
  fill(240, random(255), random(255),20);
  ellipse ( pmouseX, pmouseY, 50 , 1000);
  ellipse ( mouseX, mouseY, 50 , 1000);
  ellipse ( mouseX, mouseY, 1000, 50 );
  ellipse ( pmouseX, pmouseY, 1000 , 50);
  fill(240, random(255), random(255),20);
  ellipse ( x, random (200), 20 , 1000);
  ellipse ( x+100, random (200,400) , 20 , 1000);
  ellipse ( x, mouseY, 1000, 20 );
  ellipse ( x+100, pmouseY, 1000 , 20);
  fill(240, random(255), random(255), 100);
  ellipse ( pmouseX, y, 20 , 1000);
  ellipse ( mouseX, y, 20 , 1000);
  ellipse ( mouseX, y+100, 1000, 20 );
  ellipse ( pmouseX, y+100, 1000 , 20);
 
}



