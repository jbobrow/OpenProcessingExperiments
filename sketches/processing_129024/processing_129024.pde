
PImage Picture;

void setup()
{
  size(650, 500);
  Picture = requestImage("mykitty.jpg");
  frameRate(4);

}
void draw()
{
  if(Picture.width > 0)
  {
    image(Picture, 0, 0, width, height);
    tint(3, 245, 250, 71);
    filter(BLUR, 3);
  }
  image(Picture, 0, 0, width, height);
  smooth();
  stroke(random(255));
  fill(0, 0, 0);
  ellipse(320, 325, 50, 50);
  ellipse(345, 225, 50, 50);
  stroke(0);
  strokeWeight(5);
  line(320, 325, 345, 220);
  println("x: " + mouseX + " y: " + mouseY);
  line(348,198,311,137);
  line(303,343,226,381);
  
  
  strokeWeight(3);
  stroke(255, 120, 70, 255);
  fill(255, 150, 208, 255);
  ellipse(70, 165, 90, 84);
  ellipse(75, 215, 100, 90);
  fill(255, 220, 108, 255);
  triangle(38,254,126,238,77,371);
  
  strokeWeight(1);
  stroke(2242, 2, 26, 255);
  fill(242, 42, 66, 255);
  ellipse(70, 125, 17, 17);
  noFill();
  strokeWeight(2);
  stroke(0);
  arc(85, 120, 35, 35, PI, PI+QUARTER_PI);
  fill(0, 0, 0);
 
  rect(450, 235, 165, 80);

  

}




