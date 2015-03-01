
void setup()
{
size (400, 600);

}

void draw()
{
  background(0, 35, 0);
  
  fill (0, 180, 50);
  triangle (5, 500, 400, 500, 200, 200);
  
  fill (0, 180, 50);
  triangle (50, 350, 350, 350, 200, 100);
  noStroke();
  
  
  fill (137, 100, 90);
  rect (175, 500, 50, 60);
  
  //star
  fill (255, 236, 23);
  triangle (200, 145, 175, 100, 225, 100);
  triangle (175, 130, 225, 130, 200, 80); 
  
  //lights
  frameRate(8);
   fill(random(200, 255), random(255), random(255));
  ellipse(random(100, 300), random(420, 460), 20, 20);
 
  fill(random(0, 255), random(200, 255), random(255));
  ellipse(random(105, 295), random(415, 435), 20, 20);
 
  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(125, 255), random(265, 290), 15, 15);
  
    fill(random(200, 255), random(255), random(255));
  ellipse(random(115, 285), random(365, 385), 15, 15);
 
  fill(random(200, 255), random(200, 255), random(255));
  ellipse(random(190, 280), random(340, 360), 15, 15);

}


