
//Homework 4, September 2011
//Copyright Manuela Kind, CMU Pittsburgh PA 15289, USA


//---------------variables----------------

  int x;   //positionX
  int y;   //positionY
  int ht;  //height
  int wd;  //width
  int a;   //stroke
  color col;
  color col2; //color
//-----------------setup------------------
void setup ()
{
//variables
  x = 200;
  y = 200;
  ht = 300;
  wd = 300;
  a = 1;
  col = color (160, 230,230);
//general
  size (400,400);
  background(255);
  smooth();
  ellipseMode(CENTER);
}

//-------------draw---------------------
void draw()
{
  background(255);
  initials(x,y,wd,ht,a, col);
}

//-----------mousePressed-------------------
void mousePressed() 
{
  x = mouseX;  
  y = mouseY;
  col = color (random (256),random(256), random(256));

}

//-----------keyPressed------------------
void keyPressed() 
{
//move up      
        if (keyCode == UP)        
        {
        y = y-10;
        } 
//move down        
      else if (keyCode == DOWN) 
        {
        y = y+10;
        }
//move to the left
      else if (keyCode == LEFT)
        {
        x = x-10;
        }
//move to the right
      else if (keyCode == RIGHT) 
        {
        x = x+10;
        }
//Reset
      else if (keyCode == ENTER) 
        {
        x = 200;  
        y = 200;   
        wd= 300;
        ht= 300;
        a =   1; 
        col = color (160, 230,230);
        }
//shrink
      else if (keyCode == 47) // -
        {
        ht = ht-10;  
        wd = wd-10;        
          if ( ht < 1)
          ht = 0;
          if ( wd < 1)
          wd = 0;
        }
//grow        
      else if (keyCode == 49) // +
        {
        ht = ht+10;  
        wd = wd+10;   
        }
}




