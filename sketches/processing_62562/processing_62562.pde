
void setup()
{
  size(600, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{
  fill(255, 255, 255, 30);
  rect( 0, 0, width, height );

  line( width/2, 0, mouseX, mouseX );
  
  fill(random(255), random(255), random(255));
  ellipse( mouseX, mouseX, mouseX/2, mouseY/2 );
  
  line( 0, height/2, mouseY, mouseY );
  fill(random(255), random(255), random(255));
  ellipse( mouseY, mouseY, mouseX/2, mouseY/2 );
  
  line( width, height/2, mouseX/2, mouseY/2 );
  fill(random(255), random(255), random(255));
  ellipse( mouseX/2, mouseY/2, mouseY/2, mouseY/2 );
  
  line( width/2, height, mouseX/2, mouseX/2 );
  fill(random(255), random(255), random(255));
  ellipse( mouseX/2, mouseX/2, mouseX/2, mouseX/2 );
  
  ellipse( random(400), random(600), 30, 30 );
}


