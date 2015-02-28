
PFont font;
PImage img;


void setup () 
{
  size (600,650);
  background (255);
  font = loadFont ("AppleCasual-48.vlw");
  textFont (font, 85);
  img = loadImage("splash_01.jpg");
  
  //------------TEXT------------------
smooth();
fill(234, 9, 130);
text("ICE CREAM!!!!", 50, 610);

}

void draw()
{
  noSmooth();
  image (img, -210,-90);
  strokeWeight(2);



  //------------LEFT EYE---------------
  fill(255);
  ellipse(270, 372, 40, 40); //white
  

  float m = map(mouseX, 100, width, 267 - 3, 275+3);
  float n = map(mouseY, 100, height, 369 - 3, 377+3);

  fill(0);
  ellipse(m, n, 20, 20); //pupil
  


  //-----------RIGHT EYE--------------
  fill(255);
  ellipse(330, 373,40, 40); // white


  float o = map(mouseX, 100, width, 327 - 3, 335+3);
  float p = map(mouseY, 100, height, 369 - 3, 378+3);

  fill(0);
  ellipse(o, p, 20, 20); //pupil
}





