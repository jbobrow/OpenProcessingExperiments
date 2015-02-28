
void setup ()
{
  size (400, 400);
  background (255);
  smooth ();
}

void draw ()

{
 if (keyPressed)
 {
   if (key == ' ' || key == ' ')
   {
     saveFrame("line-####.png"); 
     background (255);
   }
   
 }
 
 //if the mouse is pressed ellipses are drawn
if(mousePressed){
  float r = map (mouseY, 0, height, 255, 0);
  stroke(r,173,r,random(180));
  
  strokeWeight(0);
  ellipse(mouseX, mouseY, random(0,15), random(0,15));
//if M or m is pressed a trail of dots is drawn   
  } if (keyPressed)
 {
   if (key == 'M' || key == 'm')
   {
  float r = map (mouseY, 0, height, 255, 0);    
 stroke (86,173,r,random(180));
 strokeWeight(random(0,5));
 
 //line of dots
 point(pmouseX,pmouseY);
 fill (r, 173, r,random(125));
  }
  //if E or e is pressed it will erease drawing as cursor passes over
   if (keyPressed)
 {
   if (key == 'E' || key == 'e')
   {
    noStroke();
   fill(255);
  ellipse(mouseX,mouseY,15,15); 
   }
 }
  if (keyPressed)
 {
   if (key == 'A' || key == 'a')
   {
   strokeWeight(1);
   stroke(mouseX,mouseY,pmouseX,pmouseY);
   noFill();
  line(mouseX,mouseY,pmouseX-7,pmouseY+10); 
   }
 }
}
}

