
void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  frameRate(10);
}

void draw()
{
  line( height/2, width/2, mouseX, mouseY );
  fill( random(255), random(225), random(225), 100);
  ellipse( mouseX, mouseY, mouseY, mouseY/2 );
  strokeWeight(1);
  noStroke();
  textSize( random(5, 100)    );
  textAlign(CENTER);
  text("♦", mouseX, mouseY);
  
  
  fill(255, 255, 255, 30); 
  rect( 0, 0, width, height );
 
  fill(255, 0, 0);
  stroke(255, 255, 255);
  strokeWeight(3);
}


