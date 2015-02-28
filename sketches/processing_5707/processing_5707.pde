
// Creating new instances of the droplet class into an array.
droplet[] myDroplet = {new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(),
new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(),
new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), 
new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), 
new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), 
new droplet(), new droplet(), new droplet(), new droplet(), new droplet(), new droplet() };

void setup()
{
  size(600, 600);
  background(0);
  frameRate(30);
}

void draw()
{
  background(0);
  stroke(255);
  
  for (int i = 0; i < myDroplet.length ;i++) {
    // The following if-statement is for setting new values to the drops.
    if (myDroplet[i].firstDrop) {
      myDroplet[i] = new droplet();
      myDroplet[i].firstDrop = false;
    }
    
    // Creating the lines that represents the rain.
    line(myDroplet[i].rainOriginX, myDroplet[i].rainOriginY, myDroplet[i].rainOriginX, myDroplet[i].rainLengthY);
    
    // Invoking the sidewayDrop() method, moving the droplet sideways in a random direction.
    myDroplet[i].sidewayDrop();
    
    // Invoking the addLength() method in the droplet class for each instance of the class.
    myDroplet[i].addLength();
    
    // If the rain has reached the bottom of the screen, firstDropN = true, and therefore new values will be set.
    // Also i creates an ellipse that represents the water from the droplet.
    if (myDroplet[i].rainLengthY >= 570) {
      // Creating an ellipse that originates from where the droplet "hit the ground" and has a random width between 25 and 45 and a random height between 15 and 25.
      ellipse(myDroplet[i].rainOriginX, myDroplet[i].rainLengthY, (int)random(25, 45), (int)random(15, 25));
      myDroplet[i].firstDrop = true;
    }
  }
}

// A class that represents a droplet.
class droplet
{ 
  int rainOriginX;
  int rainSpeedY;
  int rainLengthY;
  int rainOriginY;
  boolean firstDrop;
  
  // Constructor
  droplet()
  {
    rainOriginX = (int)random(0, 600);
    rainSpeedY = (int)random(20, 60);
    rainLengthY = (int)random(4, 15);
    rainOriginY = 0;
    firstDrop = true;
  }
  
  // This method increases the rainOriginY and rainLengthY depending on the rainSpeedY.
  void addLength()
  {
    rainOriginY += rainSpeedY;
    rainLengthY += rainSpeedY;
  }
  
  // This method is for making the droplets move 2 pixels in either direction.
  void sidewayDrop()
  {
    int randomChance = (int)random(0, 4);
    
    if (randomChance == 1)
      rainOriginX += 2;
    else if (randomChance == 2)
      rainOriginX -= 2;
    else
      return;
  }
}

