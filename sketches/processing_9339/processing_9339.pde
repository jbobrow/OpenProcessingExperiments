

void setup ()
{
     size( 500,350 );
     smooth();
}

void draw()
{
     if(mouseX < width/2)
     {
      background( 255 );
      
      //monster body
      fill(0);
      ellipse(width/3,height/2.5, 170,210);
      
      //monster eyes
      fill(255);
      ellipse(145,110, 10,20);
      ellipse(170,110, 10,20);
      
      fill(0);
      ellipse(145,115, 10,10);
      ellipse(170,115, 10,10);
      
      //monster mouth
      stroke(255);
      strokeWeight( 3 );
      line(150,145, 165,145);
     }
     else
     {
      background( 0 );
      
      //monster eyes
      fill(255);
      ellipse(145,110, 15,20);
      ellipse(170,110, 25,35);
      
      fill(0);
      ellipse(145,115, 10,10);
      ellipse(170,115, 10,10);

      //monster tooth
      fill(255);
      triangle(135,145, 141,175, 150,145);
      triangle(150,145, 160,185, 165,145);
      triangle(165,145, 175,175, 184,145);
      }
}
      
      

