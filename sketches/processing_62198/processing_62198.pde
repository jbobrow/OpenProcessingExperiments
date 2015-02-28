
/**
 Sketch created by Megan Powell
 Use the numbers 1-6 to create awesome pictures and fun!
 1: Beads
 2: Lumber
 3: Random-color balls
 4: "Yo-yo" balls
 5: Squares
 6: Fun with a yo-yo!
 Space: Clear screen
 
 Enjoy! :D
 */

void setup()
{
  size( 400, 600 );
  background( 255, 255, 255);
  smooth();
  frameRate(30);
}

void draw()
{
  if (key=='1')
  {
    frameRate(30);
    strokeWeight(2);
    stroke(0, 0, 0);
    fill( random(255), random(255), random(255), 50 );
    line( pmouseX, pmouseY, mouseX, mouseY );
    ellipse( mouseX, mouseY, 30, 30 );
  }
  if (key=='2')
  {
    frameRate(30);
    stroke( 0, 0, 0);
    fill( random(255), random(255), random(255) );
    triangle( width/2, 0, mouseX/2, mouseY, mouseX, mouseY );
  }
  if (key=='3')
  {
    frameRate(30);
    strokeWeight(3);
    stroke( random(255), random(255), random(255) );
    fill( random(255), random(255), random(255) );
    ellipse( mouseX, mouseY, 50, 50 );
  }
  if (key=='4')
  {
    frameRate(30);
    stroke( 0, 0, 0);
    strokeWeight(3);
    line( 0, 0, mouseX, mouseY );
    fill( random(255), random(255), random(255), 70);
    ellipse( mouseX, mouseY, 50, 50 );
  }
  if (key=='5')
  {
    frameRate(30);
    fill(random(255), random(255), random(255));
    textSize(10);
    textSize(mouseY);
    textAlign(CENTER);
    text("", mouseX, mouseY);
  }
  if (key=='6')
  {
    frameRate(60);
    background(255, 255, 255);
    fill(255, 255, 255, 75);
    rect(0, 0, width, height);
    fill(38, 234, 255);
    if (mouseX>200)
    {
      fill(random(255), random(255), random(255));
    }
    if (mouseY>200)
    {
      fill(random(255), random(255), random(255));
    }
    line(width/2, 0, mouseX, mouseY);
    ellipse(mouseX, mouseY, 50, 50);
  }
  if (key==' ')
  {
    background(255, 255, 255);
  }
}


