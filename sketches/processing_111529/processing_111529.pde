
/*
STARLIGHT

After struggling with this assignment a little bit, I managed to draw up something that looked like
colorful rays of light coming from a very far away fixed point. After fixing around the code a bit
and adding some little perks, this sketch was born! I was inspired by photos of outer space that 
depict supernovas and molecular clouds amongst a star-scattered universe. 

This sketch achieves its best effect if the user clicks and drags the mouse around in a circular motion!
*/

//Setup of the sketch
void setup()
{
  size(800,600);
  background(0);
  fill(255);
  
  //Adding on-screen instructions
  text("L-Mouse - Add Starlight", 10, 530);
  text("R-Mouse - Add Starcloud", 10, 545);
  text("G - Add Stars into Galaxy", 10,560);
  text("C - Employ Black Hole", 10, 575);
  text("S - Save Screenshot", 10, 590);
}

//Draw of the sketch
void draw()
{
  //Mapping of mouseX and mouseY values to a more RGB-friendly range
  int a = (int)map(mouseX, 0, 800, 0, 255);
  int b = (int)map(mouseY, 0, 600, 0, 255);
  
  //Applying colors and strokeWeight
  stroke(a, b, 128, 80);
  fill(a, b, 128, 80);
  strokeWeight(1);
  
  //Pressing left mouse button will draw lines originating from the center to your mouse position
  if(mousePressed && mouseButton == LEFT)
  {
    line(mouseX,mouseY,400,300);  
  }
  
  //Pressing right mouse button will draw a circle of a random size at your mouse position
  if(mousePressed && mouseButton == RIGHT)
  {
    float c = random(10,25);
    ellipse(mouseX,mouseY,c,c);
  }
  
  //Pressing the 'G' key will add stars (dots) of random sizes and brightness to the background.
  if(keyPressed && (key == 'g' || key == 'G'))
  {
    for(int i = 0; i <= 10; i++)
    {
      strokeWeight(random(3));
      stroke(random(255));
      point(int(random(800)),int(random(600)));
    } 
  }
  
  //Pressing the 'C' key will call the setup method to renew the sketch
  if(keyPressed && (key == 'c' || key == 'C'))
  {
    setup();
  }

  //Pressing the 'S' key will save a screenshot of the sketch
  if(keyPressed && (key == 's' || key == 'S'))
  {
    saveFrame("Starlight-Screenshot.png");
  }
}
