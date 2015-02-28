


void setup ()
{
size (400,400);
background (0);
noStroke ();
smooth ();
colorMode (HSB);



}
float i;

void draw ()

{
  
 

  fill (0);
  ellipse (150,150, 15,15); 
  fill (0);
  ellipse (250, 150, 15,15);
  fill (0);
  ellipse (200,250,60,10);
//background (0);  
fill (255,  0, 200 , 5);


ellipse (200,200,mouseX/2,mouseY/2);

if (mousePressed)
{
background(0);
}

}


