
//PFont f;
float xPos=20;
float yPos=387;
float xSpeed=4;
float ySpeed=4;
float slope= xSpeed/ySpeed;
float endXPos1=450;
float endYPos1=100;
float blackCount=0;


void setup()
{
size (500, 500);
//colorMode(HSB, 360, 100, 100);
//f = createFont("Arial", 50, true);
//bg=color(



}
/*the boxes
fill( 255, 128, 0);
rect( 350, 350, 50, 50);
rect( 450, 350, 50, 50);*/
//rect( 350, 350, 50, 50);
void draw()
{
background (0, 125, 250);
textSize(60);
fill(random(255),random(100),random(255));
text("hit the targets!", 40, 50);
//textFont(f);        
//text(message,20,50);
stroke(0);

fill(0,250,0);
rect(0, 400, 500, 500);

//target 1
fill( 250, 0, 0);
ellipse ( 450, 100, 50, 50);
fill ( 250, 250, 250);
ellipse ( 450, 100, 30, 30);
fill( 250, 0, 0);
ellipse ( 450, 100, 15, 15);

// target 2
fill( 250, 0, 0);
ellipse ( 375, 200, 50, 50);
fill ( 250, 250, 250);
ellipse ( 375, 200, 30, 30);
fill( 250, 0, 0);
ellipse ( 375, 200, 15, 15);

//target 3
fill( 250, 0, 0);
ellipse ( 450, 300, 50, 50);
fill ( 250, 250, 250);
ellipse ( 450, 300, 30, 30);
fill( 250, 0, 0);
ellipse ( 450, 300, 15, 15);

//blue ball
fill(0, 0, 250);
ellipse(xPos, yPos, 25, 25);
move();
textSize(60);
text ( blackCount, 60, 100);
if ((xPos > 446 && xPos < 454) && (yPos > 96 && yPos < 104))
            {
                fill( 0, 0, 0);
                ellipse ( 450, 100, 60, 60);
                fill ( 0);
                ellipse ( 450, 100, 40, 40);
                fill( 0);
                ellipse ( 450, 100, 20, 20);
                blackCount++;
                 
            }
 if ((xPos > 371 && xPos < 379) && (yPos > 196 && yPos < 204))
            {
               fill( 0, 0, 0);
               ellipse ( 375, 200, 50, 50);
               fill ( 0);
               ellipse ( 375, 200, 30, 30);
               fill( 0, 0, 0);
               ellipse ( 375, 200, 15, 15);
               blackCount++;
            }
 if ((xPos > 446 && xPos < 454) && (yPos > 296 && yPos < 304)) 
             {
               fill( 250, 0, 0);
               ellipse ( 450, 300, 50, 50);
               fill ( 250, 250, 250);
               ellipse ( 450, 300, 30, 30);
               fill( 250, 0, 0);
               ellipse ( 450, 300, 15, 15);
               blackCount++;
             }      
 if (blackCount==6)
     {
         background(0);
         text ("Congrats you win homie!",40, 50)
     }               
            
}

void move()
{
if (keyPressed)
    {
      if (key == 'f' || key == 'F')
          { 
              
                  xPos += xSpeed;
                
          }    
    
        if (key == '8') 
            {
           //ySpeed++;
                yPos+=ySpeed;
            }
        if (key == '9')
            {
             //ySpeed++;
                yPos-=ySpeed;
            }       
        if (key == 'c'|| key == 'C')
            {
                stroke(0, 0, 80);    
                strokeWeight(7);
                line (xPos, YPos, endXPos1, endYPos1);
            }   
        

                 
        if (xPos > 500)
        {
                xPos=20;
                yPos=387;
                xSpeed=4;
                ySpeed=4;
        
        }              
    }
    
}
/*slingshot 
strokeWeight (10);
line(120, 400, 120, 300);

strokeWeight (2);
line (120, 300, 90, 340);

rect(55, 340, 36, 20);

line (55, 340, 120, 300);*/
