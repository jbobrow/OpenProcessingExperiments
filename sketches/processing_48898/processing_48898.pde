

void setup ()
{
  size (400, 600); 
  background(13, 80, 211);
  smooth();
  frameRate (50);
}

void draw ()
{
//  fill (255, 255, 255,50);
//  rect (0, 0, width, height);

  fill(random (242), random (22), random (103), random (100));
  line (mouseX, mouseY, 30, 30);
}

void mousePressed()
{
  background(255, 255, 255);
}

void keyPressed()
{
  save("snapshot.png"); 
  fill(random(255), random(255), random (255));
}


