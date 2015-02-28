
void setup ()
{
     size( 500,350 );
     smooth();
}
 
void draw()
{
     if(mouseX < width/2)
     {
      background( 0 );
       
      //Shape of Monster
      fill(255);
      ellipse(width/3,height/2.5, 200,200);
       
      //monster eyes
      fill(0);
      ellipse(145,110, 30,30);
      ellipse(180,110, 10,30);
       
      fill(255);
      ellipse(145,110, 15,15);
      ellipse(180,115, 10,10);
       
      //monster mouth
      stroke(0);
      strokeWeight( 3 );
      arc(115, 140, 200, 80, 0, HALF_PI);
      noFill();;
      rect(140, 180, 5, 10);
     }
     else
     {
      background( 255 );
       
      //monster eyes
      fill(0);
      ellipse(145,110, 15,20);
      ellipse(170,110, 25,35);
       
      fill(255);
      ellipse(145,115, 10,10);
      ellipse(170,115, 10,10);
 
      
      }
}
     


