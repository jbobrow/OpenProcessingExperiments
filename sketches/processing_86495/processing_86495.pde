
//sahana kumar
//sahana@kumarfamily.us
//copyright sahana kumar 2013

//variables
float x, y, wd, ht;

//function definitions
void setup( )
{
  size(400,400); //arguments must be normal magic numbers
  x = 1;
  y = height * .5;
  wd = width * .2;
  ht = height * .2;
  

  //smooth( );
  
}
void draw ( )

{
  //background ( 0 );
  fill(0,5);
   rect( 0,0,width , height);
 fill (random(255),random(255),random (255));

//ellipse (x,y,wd,ht); 
//x=random( width);
//y = random( height);
//wd = random (10,20);
//ht = random (10, 20);

//ellipse (mouseX, mouseY, wd, ht);
ellipse (mouseX, mouseY, (mouseX-pmouseX), (mouseY - pmouseY));
}



