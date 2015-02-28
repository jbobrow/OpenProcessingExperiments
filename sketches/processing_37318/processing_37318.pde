
// Fu Huang Freedom

void setup()
{
  size(800, 800);
  background(0);
  smooth();
  fill(0);
  stroke(255);
  strokeWeight(6);
  ellipse(250, 300, 60, 60);
  ellipse(550, 300, 60, 60);
  strokeWeight(20);
  rect(200, 450, 400, 100);
  rect(200, 550, 400, 100);
  noStroke();

}

void draw()
{
  //rect(mouseX, mouseY, random(0, 100), random(0, 100));
 //ellipse(mouseX, mouseY, random(15, 65), random(15, 65));
 if (mousePressed == true)
 {
   ellipse(mouseX, mouseY, random(15, 30), random(15, 30));
   fill(random(255), random(255), random(255));
 }
 else
 {
 noFill();
 }
 //CLICK THESE!$@#$@#$!@#$%!@
 if (keyPressed)
 {
   if (key =='1')
   {
     ellipse(mouseX, mouseY, random(20, 60), random(20, 60));
   }
   if (key == '2')
   { 
     fill(0);
   }
 }
}

