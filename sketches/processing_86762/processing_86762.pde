
//sohee woo soheew@andrew.cmu.edu hw 3 copyright

float x, y,wd,ht, startx, starty;
 
void setup()
{
  
  size(400,400);
  smooth();
  background(86, 11,162);
   
}
 
void draw()
{
 x=random(80,350);
 y=random(50,350);
 wd=random(10,200);
 ht=random(10,200);
 startx=200;
 starty=200;
  
 noStroke();
 fill(random(300), random(255), random(255),random(8));
 rect(mouseX,mouseY,wd,ht);
 stroke(170,100);
 ellipse(startx,starty,mouseX,mouseY);
}


