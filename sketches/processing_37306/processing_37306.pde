
void setup()
{
 fill(random(255),random(255),random(255),random(255));
 size(1000,500);
 smooth();
 noStroke();


}
void draw()
{
  
   triangle(mouseX,mouseY,80,100,125,85);
  ellipse(mouseX,mouseY,100,70);
  fill(random(255),random(255),random(255), random(255));
  
  strokeWeight(1);
  line(mouseX,mouseY,0,500); 
   if (mousePressed==true);
   stroke(random(255),random(255),random(255));
  


 
 



}

