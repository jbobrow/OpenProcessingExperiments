
//Jennifer Kang
//jmkang
//©Jennifer Kang


float x, y, wd, ht;

void setup()
{
    size( 400, 400 );  
    smooth( );
    background ( 5,0,0 ) ;
}


void draw( )
{
  smooth ( );
  fill ( 239, 44, 122 );
  
 x=width*2;
 y=height*.3;
 wd=random(200,10);
 ht=random(200,10);

 
 noStroke();
 fill(250, random(255), random(255),20);
 triangle (random(0,200), random(0,200), mouseX, mouseY, wd, ht);
 
  fill(250, random(255), random(30),15);
  strokeWeight (2);
  line(mouseX, mouseY, random (0,200), random (0,200));
  

   float distX = mouseX - x;
   float distY = mouseY - y;

    
   if (mousePressed == true) {
     saveFrame("hw3.jpg");
   }
}


  






