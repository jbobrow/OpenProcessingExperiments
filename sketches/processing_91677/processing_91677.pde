
int [] Position = {5,5,0,0,0}; //I messed around with the Array and I made them 0 to set the squares to the corners and 5 so both of the ellipse start inside the square.

void setup()
{
size (300,300);
background(200,10,80);
}

void draw()
{
  if((mouseX<20) || (mouseX>width-20)|| (mouseY>height-20))
  {
    int Speed1=10;//speed i want the ellipse to move
    int Speed2 = 10;
    frameRate(20); //make the colours flash slower
    float r,g,b;
    r=random(255);
    g=random(255);
    b=random(255);
    background(200,10,80);
    fill(r,g,b); //flash random colours
    ellipse(Position[0],20,30,30);
    ellipse(20,Position[1],30,30);
    rect(Position[2],Position[3],50,50);//I used the Array Positions as 0 to set the square locations.
    rect(Position[4],height-50,50,50); 
    rect(width-50,Position[2],50,50);
    
    Position[0]=Position[0] + Speed1; //make the ellipse move.
    Position[1]=Position[1] + Speed2;

    if (Position[0] > width) //setting the position to 0 will get the ball to restart.
    Position[0] = 0;
    
    if (Position[1] > height)
    Position[1] = 0;
    
  }
}
