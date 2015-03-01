
void setup()
{
   size(600,600);
   background(255);
 }


void draw ()
{
//background(255);
//translate(mouseX,mouseY);
//println(mouseY);
translate (width/2,height/2);
  rotate(mouseX/3.0);
   //rotate(radians(second())*20);
 //rectMode(CENTER);


quad(0,100,0,0,0,30,50,200);
//quad(200,0,30,0,0,0,100,100);


}
