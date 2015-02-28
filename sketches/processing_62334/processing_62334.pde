
void setup()
{ 
  size(400, 600);
  background( 41, 125, 255);
  smooth ();
  frameRate(20);
}
void draw() 
{ textAlign(CENTER);
  textSize(40);
  text( "CLASS OF 2013", width/2 , 175 );
  
  strokeWeight (5);
  stroke(255, 255, 255, 5);
  fill(random (255), random (255), random (255));
  
  ellipse(mouseX, mouseY, 10, 10);
  image(loadImage("grchristian_logo.png"),100,265);
}

  


