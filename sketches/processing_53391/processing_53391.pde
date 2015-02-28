


PFont akkmono;
String es = "es";
String ca= "ca";
String pe= "pe";
PImage rex;



void setup ()
{
  size (400, 400);
  smooth();
  noStroke();
  akkmono = loadFont ("Akkurat-Mono-36.vlw");
  textFont(akkmono);
  rex = loadImage ("trex.jpg"); 

  
}

void draw ()
{
 background (255, 0, 0);

  
  
if (mousePressed == true)
{
  image(rex, 0, 0, width, height);
}
  

if (mousePressed == true)
{

 text (es, 20, 20); 
}

else 
{
  text(es, 150, 200);
}



if (mousePressed == true)
{
  text (ca, 40, 399);
}

else
{
  text (ca, 194, 200);
}

if (mousePressed == true)
{
  text (pe, 300, 394);
}
else
{
  text (pe, 238, 200);
}


}

