
// Lightning
// John-Mark Collins 
// June 29, 2013


//Maxim maxim;  // create new maxim instance
//AudioPlayer player1; // create audio player for primary electric sound
//AudioPlayer player2; // create audio payer for secondary electric sound

void setup()
{
  size (1000, 600); // initiate screen and size
  //maxim = new Maxim(this); 
  //player1 = maxim.loadFile("electricity1.wav"); // set first electricity sound
  //player1.setLooping(true); // set first electricity sound to loop
  //player2 = maxim.loadFile("electricity2.wav"); // set second electricity sound
  //player2.setLooping(true); // set fsecond electricity sound to loop
  
  //player1.volume(0.50);  // adjust main sound volume down (it was a bit loud)
  background(0); // initialize background to black
}

void mouseDragged()
{
  //player1.play();  // play first sound
  //player2.play();  // play second sound
  
  background(0); // reset background to black

  strokeWeight(1); // set size of smaller electric arcs
  stroke(255, 255); // set color and alpha of small arc
  
  bolt1(0, 0, mouseX, mouseY, 100.0);  // small white arc from top left corner
  bolt1(width, height, mouseX, mouseY, 100.0); // small white arc from bottom right corner
  bolt1(0, height, mouseX, mouseY, 100.0); // small white arc from bottom left corner
  bolt1(width, 0, mouseX, mouseY, 100.0); // small white arc from top right corner
  
  // duplication of above commands to create multiple lines of various colors 
  // and widths.
  strokeWeight(6); 
  stroke(144, 204, 241, 225); 
  
  bolt1(0, 0, mouseX, mouseY, 100.0);
  bolt1(width, height, mouseX, mouseY, 100.0);
  bolt1(0, height, mouseX, mouseY, 100.0);
  bolt1(width, 0, mouseX, mouseY, 100.0);
  
  strokeWeight(4);
  stroke(28, 113, 196, 35);
  
  bolt1(0, 0, mouseX, mouseY, 100.0);
  bolt1(width, height, mouseX, mouseY, 100.0);
  bolt1(0, height, mouseX, mouseY, 100.0);
  bolt1(width, 0, mouseX, mouseY, 100.0);
  
  strokeWeight(2);
  stroke(144, 204, 241, 225);
  
  bolt1(0, 0, mouseX, mouseY, 100.0);
  bolt1(width, height, mouseX, mouseY, 100.0);
  bolt1(0, height, mouseX, mouseY, 100.0);
  bolt1(width, 0, mouseX, mouseY, 100.0);
  
  // modify the sounds as the mouse is moved
  //player1.setFilter(map(mouseY,0,height,50,5000),10);
  //player2.ramp(1.,1000);
  //player2.speed((float) mouseX/width/2);
}

void mouseReleased()
{
  // reset the background and stop the sounds when mouse is released
  background(0);
  //player1.stop();
  //player2.stop();
}

void bolt1(int x1, int y1, int x2, int y2, float displacement)
{ 
  // if the size of the displacement is less than one pixel in size
  if (displacement < 1.0)
  {  
    //draw each segment
    line(x1, y1, x2, y2);
  }
  else
  {
    // get the midpoint of the original segment
    float midX = (x2+x1)/2;
    float midY = (y2+y1)/2;
    
    // get a random number for the x and y variation and
    // add it to the midpoint to create two new segments
    int x22 = int(midX + ((random(10)-5)/5) * displacement);
    int y22 = int(midY + ((random(10)-5)/5) * displacement);
    
    // cal bolt1 recursively to continue to refine the bolt until it is
    // within the displacement range specified above
    bolt1(x1, y1, x22, y22, displacement/2);
    bolt1(x22, y22, x2, y2, displacement/2);
  }
}
