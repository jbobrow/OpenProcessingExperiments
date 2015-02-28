

void setup()
{
  size( 400, 600 );
  background(255, 255, 255);
  smooth();
  textAlign(CENTER);
  frameRate(15);
  textSize( 36);
}
 
void draw()
{

  background(0, 0, 0);
  frameRate(5);
  fill(0, 205, 50);
  triangle(50, 500, 350, 500, 200, 100);
 
   // Lights
  fill(random(200, 255), random(255), random(255));
  ellipse(random(100, 300), random(440, 460), 10, 10);
 
  fill(random(0, 255), random(200, 255), random(255));
  ellipse(random(105, 295), random(415, 435), 10, 10);
 
  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(110, 290), random(390, 410), 10, 10);
 
  fill(random(200, 255), random(255), random(255));
  ellipse(random(115, 285), random(365, 385), 10, 10);
 
  fill(random(200, 255), random(200, 255), random(255));
  ellipse(random(120, 280), random(340, 360), 10, 10);
 
  fill(random(200, 255), random(255), random(200, 255));
  ellipse(random(130, 270), random(315, 335), 10, 10);
 
  fill(random(200, 255), random(255), random(255));
  ellipse(random(140, 260), random(290, 310), 10, 10);
 
  fill(random(0, 255), random(200, 255), random(255));
  ellipse(random(145, 255), random(265, 285), 10, 10);
 
  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(160, 240), random(240, 260), 10, 10);
 
  fill(random(200, 255), random(255), random(255));
  ellipse(random(175, 225), random(215, 235), 10, 10);
 
  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(180, 220), random(175, 200), 10, 10);
 
  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(190, 210), random(150, 160), 10, 10);
 
  fill( 255, 255, 255,  25 );
  rect( 0, 0,  width, height );
   

 
 fill(106,38,36);
 rect(135,500,138,450);
 
   
  textSize( mouseY/10  );
  fill( random(255), random(255), random(255) );
  text( "Merry Christmas!", mouseX, mouseY  );
 
}


