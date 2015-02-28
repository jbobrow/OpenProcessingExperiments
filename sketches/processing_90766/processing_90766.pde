
PFont myChosenFont; 
String userInput = "", six, pass = "199099";  
boolean matched = false;  

int diam=10;
int x=80;
int y=90;
int speedX=1;
int speedY=1;



void setup()  

{  

  size(200, 200);  

 
  x=80;
  y=90;
}  



void draw()  

{  

  background(0);  

  text("Keep tying until password matches", 0, 20);  

  text("Enter text here: " + userInput, 0, height/2 - 20);  

  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  
  if(matched==true)
  {
    shapeMove();
  }
    
}  



void keyPressed()  

{  


  if (key != CODED)  

    userInput += key;  

  if (userInput.equalsIgnoreCase(pass))  

    matched = true;
} 


  void shapeMove()
{
  
    if(90<x&&x<110&&90;<y&&y<110)
    {
      background(255);
    }
    else
    background(0);
  
  
  x=x+speedX;
  y=y+speedY;
   
  fill(255,255,0);
  rect(x,y,40,60);
  fill(0,0,255);
  ellipse(x+10,y+35,diam,diam);
  ellipse(x+30,y+35,diam,diam);
  fill(255,0,0);
  triangle(x+20,y+40,x+10,y+50,x+30,y+50);
  fill(255);
 
  rect(x+5,y+33,10,3);
  rect(x+25,y+33,10,3);
 
  fill(255);
  rect(90,90,20,20);
  if(y<0 || y>height-60)
  {
    speedY=speedY*-1;
  }
  else if(x<0 ||x>160)
  {
    speedX=speedX*-1;
  }
}
