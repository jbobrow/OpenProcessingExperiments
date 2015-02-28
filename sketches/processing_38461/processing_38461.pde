
//I would have liked to have put this in an array so I could
//have more than it flipping between just the blue and the red.
//When I would put it in an array only the first case would display
//and the rest would not. The sine fucntions in my alpha value
//would not work either so...

float amp;
float perX;
float opac;
//variables for the sine function that controls the alpha value
//of my for loop

void setup() 
{
  smooth();
  size (600, 600);
  background(97, 109, 157);
  frameRate(10);
}

void draw()
{ 
  noStroke();
  fill(35);
  rect(55, 55, 485, 485);

  int gridX = (width/10); 
  int gridY = (height/10);
  for (int x = 3/2; x < 9; x++) {
    for (int y = 3/2; y < 9; y++) {
      //if x is 1.5 as long as x is less than 9 then add 1 to it
      //same goes for y
      //this is multiplied by a tenth of the width or height

      amp = 200;
      perX = 2 * .002;
      opac = width/2 + amp * (sin(millis() * perX));
      //Eric Mackie helped me with the opac(opacity) variable
      //the center of the sine wave is at 300 or width/2
      //amp is 200 so that is does not exceed my for loop(?)
      //millis * perX makes the sine wave small so that it goes
      //from the corner, out and back.
      
      
      fill(55, 97, 178, (opac/50) * x * y/9);
      if (mousePressed) {
        fill(55, 97, 178, (opac/50) * 6/x * 6/y);
        //reverses where sine starts
      }
      if ((second()*5)%6<3) {
        //changes the fill every 3 seconds
        fill(178, 55, 97, (opac/50) * x * y/9);
        //blue
        if (mousePressed) {
          fill(178, 55, 97, (opac/50) * 6/x * 6/y);
          //red
          //reverses where sine starts
        }
      }
      rect(gridX*x, gridY*y, 55, 55);
    }
  }
  for (int x = 3/2; x < 9; x++) {
    for (int y = 3/2; y < 9; y++) {
      fill(97, 88, 55, ((opac/50) * x * y) - mouseY);
      //yellow
      //yellow will not exceed where the mouse is on the y-axis
      rect(gridX*x, gridY*y, 55, 55);
    }
  }
}


