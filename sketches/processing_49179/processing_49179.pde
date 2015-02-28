
import processing.dxf.*;

void setup()
{
  size(400,600);
  background(0,0,0);
  smooth();
  textAlign(CENTER);
  
}


void draw()
{
  fill(0,0,0, 50);
  rect(0,0,width,height);
   fill(random(255),random(255), random(255));
  ellipse(random(400),random(600),10,10);
  fill(255, 255, 255);
  ellipse(random(400), random(600), 5,5);
  
  fill(255,255,255);
   point(random(400),random(600));
     textSize( random(8,36));
  fill(random(255),random(255),random(255));
  text( "WELCOME", random(width), random(height));
  
  textSize( random(8,36));
  fill(random(255),random(255),random(255));
  text( "brianna", random(width), random(height));
 
  textSize( random(8,36));
  fill(random(255),random(255),random(255));
  text( "sylvester" , random(width), random(height));
  
}

void keyPressed()
{
  save ("snapshot.jpg");
}

