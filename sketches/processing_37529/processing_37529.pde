
//Homework 5
//Copyright Information

int x;
int y;
int d=40;


void setup()
{
 size(500,500);
 noFill();
 smooth(); 
 background(256,256,256);
 rectMode(CENTER); 
}

void draw()
{
 x=0;
 y=0;
 float angle = 0;
 float angleb =3;
 float se = 520;//square's side
  
  while(x < width)
 
  {
   noStroke();
   fill(200,50,x,50);
   rect(x,y,se,se);
   
   x= x+20;
   y= y+20;
   
   
  }

  while(angle < 360)
   {
      noFill();
      rotate(radians(angle));
      strokeWeight(2);
      stroke(0,100,200);
      rect(width/2,height/2,200,200);
      angle = angle + 1;
   }
    
   while(angleb < 360)
    {
      rotate(radians(angleb));
      strokeWeight(2);
      stroke(0,200,100);
      rect(width/2,height/2,200,200);
      angleb = angleb + 1;
    }
   
 }  
