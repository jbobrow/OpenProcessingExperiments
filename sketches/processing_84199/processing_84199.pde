
void setup ()
{
size (600,600);
background (250);
smooth();

}

 void draw ()
 {
  noStroke();
   fill(random (0,250),random(0,250), random(0,250));
   //stroke(random (0,250), random (0,250), random (0,250));
 //strokeWeight(random (1,100));//
 ellipse(random (mouseX,mouseY),random(mouseY,mouseX), random (10,20),random (10,20));

 
 }
