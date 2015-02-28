
float xPos=20;
float yPos=387;
float xSpeed=4;
float ySpeed=4;
float slope= xSpeed/ySpeed;
void setup()
{
size (500, 500);


}
/*the boxes
fill( 255, 128, 0);
rect( 350, 350, 50, 50);
rect( 450, 350, 50, 50);*/
//rect( 350, 350, 50, 50);
void draw()
{
background (0, 125, 250);

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

//red ball
fill(250, 0, 0);
ellipse(xPos, yPos, 25, 25); 
//green ball
fill(0, 250, 0);
ellipse(xPos, yPos, 25, 25); 
//blue ball
fill(0, 0, 250);
ellipse(xPos, yPos, 25, 25);
move();

}

void move()
{
if (keyPressed)
    {
      if (key == 'f' || key == 'F')
          { 
              xPos += xSpeed;
              yPos -= ySpeed;
          }    
    }
if (keyPressed == CODED)
    {
        if (keyCode == UP) 
            {
                ySpeed++;
                yPos+=ySpeed;
            }
        else if (keyCode == DOWN)
            {
                xSPeed++;
                xPos+=xSpeed;
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
