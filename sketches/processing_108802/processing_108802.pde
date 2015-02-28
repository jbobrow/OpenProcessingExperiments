
//september 05 
//Shanna Chan
//Homework 3

float x,y,wd,ht;

void setup( )
{
 size(400,400); 
  

  x=0;
  y=height*.6;
  wd=width*.35;
  ht=height*.43;
  colorMode(HSB,360,100,100,100);
  frameRate(15);
  
strokeWeight(1);

  
}


  
void draw ( )
{
 //background(200,200,0,20);
fill(random(360),20,99,10);
 rect(0,0,width,height);

stroke(153);
  triangle(mouseX,mouseY,mouseY,mouseX,pmouseX,pmouseY);
line(pmouseY,pmouseX,mouseY,mouseX);
}







