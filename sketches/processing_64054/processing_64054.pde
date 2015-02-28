
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
 
class Canvas extends CanvasBase
{

  boolean pmousePressed = false;
  
  void drawEffect1(float mouseX, float mouseY, boolean mousePressed, float pmouseX, float pmouseY)
  {
    if (mousePressed && pmousePressed)
    {
      frameRate(30);
      strokeWeight(2);
      stroke(0, 0, 0);
      fill( random(255), random(255), random(255), 50 );
      line( pmouseX, pmouseY, mouseX, mouseY );
      ellipse( mouseX, mouseY, 30, 30 );
    }

    pmousePressed = mousePressed;
  }
 
  void drawEffect2(float mouseX, float mouseY, boolean mousePressed, float pmouseX, float pmouseY)
  {
    if (mousePressed)
    {
      frameRate(30);
      stroke( 0, 0, 0);
      fill( random(255), random(255), random(255) );
      triangle( width/2, 0, mouseX/2, mouseY, mouseX, mouseY );
    }
  }
  
  void drawEffect3(float mouseX, float mouseY, boolean mousePressed, float pmouseX, float pmouseY)
  {
    if (mousePressed)
    {
      frameRate(30);
      strokeWeight(3);
      stroke( random(255), random(255), random(255) );
      fill( random(255), random(255), random(255) );
      ellipse( mouseX, mouseY, 50, 50 );
    }
  }

  void drawEffect4(float mouseX, float mouseY, boolean mousePressed, float pmouseX, float pmouseY)
  {
    if (mousePressed)
    {
      frameRate(30);
      stroke( 0, 0, 0);
      strokeWeight(3);
      line( 0, 0, mouseX, mouseY );
      fill( random(255), random(255), random(255), 70);
      ellipse( mouseX, mouseY, 50, 50 );
    }
  }

  void drawEffect5(float mouseX, float mouseY, boolean mousePressed, float pmouseX, float pmouseY)
  {
    if (mousePressed)
    {
      frameRate(30);
      fill(random(255), random(255), random(255));
      textSize(10);
      textSize(mouseY);
      textAlign(CENTER);
      text("", mouseX, mouseY);
    }
  }

  void drawEffect6(float mouseX, float mouseY, boolean mousePressed, float pmouseX, float pmouseY)
  {
    if (mousePressed)
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
  }

  void drawEffectSpace(float mouseX, float mouseY, boolean mousePressed, float pmouseX, float pmouseY)
  {
    if (mousePressed)
    {
      background(255, 255, 255);
    }
  }

};



