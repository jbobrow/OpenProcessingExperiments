
color brushColor;
PImage palette;
float rad = 0.0;


void setup()
{
  size (500, 500);
  palette = requestImage ("palette.jpg");
}

void draw()

{
  rad = rad + 0.1;
  noStroke();
  if (palette.width > 0)
    { 
      image( palette, 0,0, 50,50);
    }
   
   if (mousePressed == true)
     {
     
       if (mouseButton == RIGHT)
         {
           
           ellipse ( mouseX, mouseY, 30, 30);
           ellipse ( mouseX, mouseY - 40, 30,30);
           ellipse ( mouseX, mouseY + 40, 30, 30);
           ellipse ( mouseX - 40, mouseY, 30, 30);
           ellipse ( mouseX + 40, mouseY, 30, 30);
           ellipse ( mouseX -30, mouseY - 30, 20,20);
           ellipse ( mouseX + 30, mouseY + 30, 20, 20);
           ellipse ( mouseX - 30, mouseY + 30, 20, 20);
           ellipse ( mouseX + 30, mouseY - 30, 20, 20);
           
            
         }
         
         
       else if (mouseButton == LEFT)
         {
            
           ellipse ( mouseX, mouseY, 100, 100);
           
            
         }
       if (mouseButton == CENTER)
         {
           
           pushMatrix();
           
           translate( width/2, height/2);
           rotate(rad);
           
           rectMode(CENTER);
           rect( mouseX/2, mouseY/2, mouseX + 1/2, mouseY/2, mouseX + 1/2, mouseY + 2/2, mouseX/2,mouseY + 1);
           
           
           popMatrix();
           pushMatrix();
           translate( 500,500);
           rotate(radians(45));
           popMatrix();
           
           
         }
     }
         
   if (keyPressed)
     {
       if ( key ==  '1')
         {
           brushColor = get( mouseX, mouseY);
       
         }
        
     }
       
fill (brushColor);   
}


