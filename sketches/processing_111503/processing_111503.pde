
PImage darth2Image;
boolean drawApplied = false;

void setup()

{
  size (800,800);
  darth2Image = requestImage("darth2.JPG");
  frameRate(4);
  
}

void draw()
//transparent image, green vs red
{
  
  
  if (darth2Image.width > 0)
{
  image(darth2Image,0,0, width, height);
  tint(0, 255, 120, 126);
  image(darth2Image, 200, 150);
} 
//circles over eyes
  stroke(random(255));
  fill(#E02626);
  ellipse(450,360, 75, 75);
  ellipse(588,355,75,75);
  fill(255, 255,255,125);
  ellipse(461, 202, 75, 75);
  ellipse(461, 202, 50, 50);
  ellipse(304, 209, 75, 75);
  ellipse(304, 209, 50, 50);
  



//lightning and circle effects

if (drawApplied == false)
  {
  float x = 450;
  float y = 360;
  float prevX = x;
  float prevY = y;
  strokeWeight(2);
  stroke(0,0,0);
  while (x < 750)
{
  x += 10;
  y += random(-10,10);
  line(prevX, prevY, x, y);
  line(prevX, prevY + 15, x, y + 15);
  prevX = x;
  prevY = y;
}

  }  
  
 if (drawApplied == false)
  {
  float m = 14;
  float z = 521;
  float prevM = m;
  float prevZ = z;
  strokeWeight(2);
  while (m < 150)
{
  m += 10;
  z += random(-10,10);
  line(prevM, prevZ, m, Z);
  line(654,207,m,z);
  prevM = m;
  prevZ = z; 
  
  
}

  }
   println("x: " + mouseX + " y: " + mouseY);
 

  
}


