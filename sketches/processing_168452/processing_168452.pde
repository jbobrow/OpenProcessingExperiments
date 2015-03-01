
void setup()
{
   size(500,500);
   background(255);
}
  
void draw ()
{
//background(255);
//translate(mouseX,mouseY);
//println(mouseX);
translate (width/2,height/2);
  rotate(mouseY/5.0);
   //rotate(radians(second())*1);
 //rectMode(CENTER);
 
 
quad(0,0,100,0,100,10,0,10);

 
 
}

