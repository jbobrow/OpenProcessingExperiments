
void setup()
{
  size(400,600);
  background(0, 0, 80);
  smooth();
  
}
  void draw()
{
  fill(0, 100, 50);
 triangle(200, 100, 20, 600, width-20, 600);
 fill(random(255), random(255),random(255));
  ellipse(mouseX, mouseY, 20, 20);
 mousePressed();

  textSize( 55 );
  fill(255, 255, 255, 255);
  textAlign(CENTER);
  text("Let it SNOW!", width/2, 60);
  
  strokeWeight(5);
  stroke(255, 255, 255);
  point(random(255*4),random(255*4));
  
  
  
}


