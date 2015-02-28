
/*
Modified by Alastair Gray. (Original by Jared "BlueThen" C,  'Wavy'.)
*/


/* Variable a is used for determining the shape's y position, coupled with the distance they are from the center. */
float a;
/* Setup(), the first function called when the applet is started */
void setup()
{
  /* The applet is set to 500 pixels by 500 pixels */
  size(500,500);
  /* RGB mode set to maximum of 6, since we'll be using 6 colors. 0 for black, 6 for white, and everything in between. */
  colorMode(RGB, 6);
  /* The stroke color is used to determine the border color of each quadrilateral. */
  stroke(0);
  /* Frame rate is set to 30. */
  frameRate(30);
}
void draw()
{
  /*
  a is decreased by 0.08. It represents the amount of radians the height of our boxes changes, and their speed.
  If we did nothing to a, then none of our shapes will move, so a is a key component in our formulas.
  */
  a -= 0.02;
  /* Screen is cleared and background is set to 6 (white). */
  background(6);
  /*
  These are our loops.
  We loop through 14 rows (-7 through 7) for the x axis, and within each row, we loop through 14 collumns for the z axis
  (x,z) is the ground, while y is verticle)
  */
  for (int x = -42; x < 42; x++) {
   for (int z = -42; z < 42; z++) {
    /*
    The y variable is set to determine the height of the box.
    We use formula radius * cos(angle) to determine this.
    Since cosine, when graphed, creates a wave, we can use this to have the boxes transition from small to big smoothly.
     
    The radius pretty much stands for our range. cosine alone will return values between -1 and 1, so we multiply this by
    24 to increase this value. The formula will return something in between -24 and 24.
     
    The angle is in radians. An entire loop (circle) is 2pi radians, or roughly 6.283185.
    Distance is used to create the circular effect. It makes the boxes of the same radius around the center similar.
    The distance ranges from 0 to 7, so 0.55 * distance will be between 0 and 3.85. This will make the highest and lowest
    box a little more than half a loop's difference. a is added on, (subtracted if you want to be technical, since a is negative), to
    provide some sort of change for each frame. If we don't include '+ a' in the algorithm, the boxes would be still.
    */
    int y = int(24 * cos(0.4 * distance(x,z,0,0) + a));
     
    /*
    These are 2 coordinate variations for each quadrilateral.
    Since they can be found in 4 different quadrants (+ and - for x, and + and - for z),
    we'll only need 2 coordinates for each quadrilateral (but we'll need to pair them up differently
    for this to work fully).
     
    Multiplying the x and z variables by 17 will space them 17 pixels apart.
    The 8.5 will determine half the width of the box ()
    8.5 is used because it is half of 17. Since 8.5 is added one way, and 8.5 is subtracted the other way, the total
    width of each box is 17. This will eliminate any sort of spacing in between each box.
     
    If you enable noStroke(), then the whole thing will appear as one 3d shape. Try it.
    */
    float xm = x*17 -8.5;
    float xt = x*17 +8.5;
    float zm = z*17 -8.5;
    float zt = z*17 +8.5;
     
    /* We use an integer to define the width and height of the window. This is used to save resources on further calculating */
    int halfw = mouseX;
    int halfh = mouseY;
     
    /*
    Here is where all the isometric calculating is done.
    We take our 4 coordinates for each quadrilateral, and find their (x,y) coordinates using an isometric formula.
    You'll probably find a similar formula used in some of my other isometric animations. However, I normally use
    these in a function. To avoid using repetitive calculation (for each coordinate of each quadrilateral, which
    would be 3 quads * 4 coords * 3 dimensions = 36 calculations).
     
    Formerly, the isometric formula was ((x - z) * cos(radians(30)) + width/2, (x + z) * sin(radians(30)) - y + height/2).
    however, the cosine and sine are constant, so they could be precalculated. Cosine of 30 degrees returns roughly 0.866, which can round to 1,
    Leaving it out would have little artifacts (unless placed side-by-side to accurate versions, where everything would appear wider in this version)
    Sine of 30 returns 0.5.
     
    We left out subtracting the y value, since this changes for each quadrilateral coordinate. (-40 for the base, and our y variable)
    These are later subtracted in the actual quad().
    */
    int isox1 = int(xm - zm + halfw);
    int isoy1 = int((xm + zm) * 0.5 + halfh);
    int isox2 = int(xm - zt + halfw);
    int isoy2 = int((xm + zt) * 0.5 + halfh);
    int isox3 = int(xt - zt + halfw);
    int isoy3 = int((xt + zt) * 0.5 + halfh);
    int isox4 = int(xt - zm + halfw);
    int isoy4 = int((xt + zm) * 0.5 + halfh);
     
    /* The side quads. 2 and 4 is used for the coloring of each of these quads */
    fill (2);
    quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+40, isox2, isoy2+40);
    fill (4);
    quad(isox3, isoy3-y, isox4, isoy4-y, isox4, isoy4+40, isox3, isoy3+40);
     
    /*
    The top quadrilateral.
    y, which ranges between -24 and 24, multiplied by 0.05 ranges between -1.2 and 1.2
    We add 4 to get the values up to between 2.8 and 5.2.
    This is a very fair shade of grays, since it doesn't become one extreme or the other.
    */
    fill(4 + y * 0.05);
    quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
   }
  }
}
/* The distance formula */
float distance(float x,float y,float cx,float cy) {
  return sqrt(sq(cx - x) + sq(cy - y));
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}


