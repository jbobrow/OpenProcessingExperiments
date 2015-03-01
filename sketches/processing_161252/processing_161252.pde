
int xwidth=960;
int ylength=540;

color c = #FFFFFF;
color b = #FFAF00;
//color b = #000000;
color a = #00FCE9;

 
void setup(){
size(1000,800);
background(b);
smooth();
}
 


void draw ()
{
  fill(255);
  rectMode(CENTER);
  if (mousePressed && (mouseButton== LEFT))
    {
        stroke(255);
        fill(random(255), random(255), random(255), random(255));
        strokeWeight(2.5);
        triangle(mouseX,mouseY,mouseX+30, mouseY+75, mouseX+58, mouseY+20);
     }
    

   else if(mousePressed && (mouseButton == RIGHT))
   {
   background(b);
    }

{
  stroke(255);
  strokeWeight(2.5);
  fill(250-pmouseX/4, mouseY/(500/255), sq(sq(pmouseX/(100/51)-sq(pmouseY/(100/51)))), 100);
  ellipse(mouseX, mouseY, (sqrt(sq(pmouseX-mouseX)) + sqrt(sq(pmouseY-mouseY)))/2, (sqrt(sq(pmouseX-mouseX)) + sqrt(sq(pmouseY-mouseY)))/2);
}
}




