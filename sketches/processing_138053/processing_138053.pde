
// Initialize color variables
color c = color(random(0, 255), random(0, 255), random(0, 255), random(0, 255));

// Declare variables for size of squares
float w, h;

void setup()
{
  size(600, 600);

  noSmooth();

  // Initialize size of squares based on screen size
  w = width/50;
  h = height/50;
}

void draw()
{
  // Draw squares
  noStroke();
  for (int y = 0; y < height; y += h)
  {
    for (int x = 0; x < width; x += w)
    {
      // Randomize the fill color
      c = color(random(0, dist(x, y, mouseX, mouseY)), random(0, 150), random(0, 150), random(0, 255));
      fill(c);

      // Draw the squares
      rect(x, y, w, h);
    } // end for (int x)
  } // end for (int y)

  // Display words
  strokeWeight(12);
  strokeCap(SQUARE);
  strokeJoin(BEVEL);

  pushMatrix();
  translate(0, 12);
  char[] word = {
    'H', 'A', 'P', 'P', 'Y'
  };
  for (int i = 0; i < word.length; i++)
  {
    pushMatrix();
    scale(abs(map(dist(mouseX, mouseY, 120*i-6, -6), 100, 0, .95, 1)));
    letter(word[i], 120*i-6, -6, 12);
    popMatrix();
  }

  char[] word = {
    'B', 'I', 'R', 'T', 'H'
  };
  for (int i = 0; i < word.length; i++)
  {
    pushMatrix();
    scale(map(dist(mouseX, mouseY, 120*i, 138), 100, 0, .95, 1));
    letter(word[i], 120*i-6, 138, 12);
    popMatrix();
  }

  char[] word = {
    'D', 'A', 'Y'
  };
  for (int i = 0; i < word.length; i++)
  {
    pushMatrix();
    scale(map(dist(mouseX, mouseY, 120*i, 272), 100, 0, .95, 1));
    letter(word[i], 120*i-6, 272, 12);
    popMatrix();
  }

  char[] word = {
    'L', 'I', 'L', 'Y', '!'
  };
  for (int i = 0; i < word.length; i++)
  {
    pushMatrix();
    scale(map(dist(mouseX, mouseY, 120*i, 426), 100, 0, .95, 1));
    letter(word[i], 120*i-6, 426, 12);
    popMatrix();
  }
  popMatrix();
} // end draw()

void keyPressed()
{
}

// Each letter will be a base of 10 points across. For now they'll
// all be capital.

// x, y = position (top-left corner); s = scale;
void letter(char character, float x, float y, float s)
{
  stroke(random(100, 255), random(100, 255), 0, 255-dist(x, y, mouseX, mouseY)*.5);
  // A
  if (character == 'A')
  {
    line(5.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(5.0*s+x, 2.0*s+y, 8.0*s+x, 8.0*s+y);
    line(3.5*s+x, 5.0*s+y, 6.5*s+x, 5.0*s+y);
  }

  if (character == 'B')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 2.0*s+y, 6.0*s+x, 2.0*s+y);
    line(6.0*s+x, 2.0*s+y, 8.0*s+x, 3.0*s+y);
    line(8.0*s+x, 3.0*s+y, 8.0*s+x, 4.0*s+y);
    line(8.0*s+x, 4.0*s+y, 6.0*s+x, 5.0*s+y);
    line(6.0*s+x, 5.0*s+y, 8.0*s+x, 6.0*s+y);
    line(8.0*s+x, 6.0*s+y, 8.0*s+x, 7.0*s+y);
    line(8.0*s+x, 7.0*s+y, 6.0*s+x, 8.0*s+y);
    line(6.0*s+x, 8.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 5.0*s+y, 6.0*s+x, 5.0*s+y);
  }

  if (character == 'C')
  {
    // not done
    line(8.0*s+x, 2.0*s+y, 2.0*s+x, 2.0*s+y);
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 8.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'D')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 2.0*s+y, 5.0*s+x, 2.0*s+y);
    line(5.0*s+x, 2.0*s+y, 8.0*s+x, 3.0*s+y);
    line(8.0*s+x, 3.0*s+y, 8.0*s+x, 7.0*s+y);
    line(8.0*s+x, 7.0*s+y, 5.0*s+x, 8.0*s+y);
    line(2.0*s+x, 8.0*s+y, 5.0*s+x, 8.0*s+y);
  }

  if (character == 'E')
  {
    line(8.0*s+x, 2.0*s+y, 2.0*s+x, 2.0*s+y);
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 5.0*s+y, 8.0*s+x, 5.0*s+y);
    line(2.0*s+x, 8.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'F')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 2.0*s+y, 8.0*s+x, 2.0*s+y);
    line(2.0*s+x, 5.0*s+y, 8.0*s+x, 5.0*s+y);
  }

  // G

  if (character == 'H')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 5.0*s+y, 8.0*s+x, 5.0*s+y);
    line(8.0*s+x, 2.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'I')
  {
    line(8.0*s+x, 2.0*s+y, 2.0*s+x, 2.0*s+y);
    line(5.0*s+x, 2.0*s+y, 5.0*s+x, 8.0*s+y);
    line(2.0*s+x, 8.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  // J

  if (character == 'K')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 4.0*s+y, 8.0*s+x, 2.0*s+y);
    line(2.0*s+x, 4.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'L')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 8.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'M')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 2.0*s+y, 5.0*s+x, 6.0*s+y);
    line(5.0*s+x, 6.0*s+y, 8.0*s+x, 2.0*s+y);
    line(8.0*s+x, 2.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'N')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 2.0*s+y, 8.0*s+x, 8.0*s+y);
    line(8.0*s+x, 2.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'O')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 2.0*s+y, 8.0*s+x, 2.0*s+y);
    line(8.0*s+x, 2.0*s+y, 8.0*s+x, 8.0*s+y);
    line(2.0*s+x, 8.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'P')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 2.0*s+y, 8.0*s+x, 2.0*s+y);
    line(8.0*s+x, 2.0*s+y, 8.0*s+x, 5.0*s+y);
    line(2.0*s+x, 5.0*s+y, 8.0*s+x, 5.0*s+y);
  }

  // Q

  if (character == 'R')
  {
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 8.0*s+y);
    line(2.0*s+x, 2.0*s+y, 8.0*s+x, 2.0*s+y);
    line(8.0*s+x, 2.0*s+y, 8.0*s+x, 5.0*s+y);
    line(2.0*s+x, 5.0*s+y, 8.0*s+x, 5.0*s+y);
    line(2.0*s+x, 5.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'S')
  {
    line(2.0*s+x, 2.0*s+y, 8.0*s+x, 2.0*s+y);
    line(2.0*s+x, 2.0*s+y, 2.0*s+x, 5.0*s+y);
    line(2.0*s+x, 5.0*s+y, 8.0*s+x, 5.0*s+y);
    line(8.0*s+x, 5.0*s+y, 8.0*s+x, 8.0*s+y);
    line(2.0*s+x, 8.0*s+y, 8.0*s+x, 8.0*s+y);
  }

  if (character == 'T')
  {
    line(2.0*s+x, 2.0*s+y, 8.0*s+x, 2.0*s+y);
    line(5.0*s+x, 2.0*s+y, 5.0*s+x, 8.0*s+y);
  }

  // U

  if (character == 'V')
  {
    line(2.0*s+x, 2.0*s+y, 5.0*s+x, 8.0*s+y);
    line(5.0*s+x, 8.0*s+y, 8.0*s+x, 2.0*s+y);
  }

  if (character == 'W')
  {
    line(2.0*s+x, 2.0*s+y, 4.0*s+x, 8.0*s+y);
    line(4.0*s+x, 8.0*s+y, 5.0*s+x, 5.0*s+y);
    line(5.0*s+x, 5.0*s+y, 6.0*s+x, 8.0*s+y);
    line(6.0*s+x, 8.0*s+y, 8.0*s+x, 2.0*s+y);
  }

  // X

  if (character == 'Y')
  {
    line(2.0*s+x, 2.0*s+y, 5.0*s+x, 5.0*s+y);
    line(8.0*s+x, 2.0*s+y, 5.0*s+x, 5.0*s+y);
    line(5.0*s+x, 5.0*s+y, 5.0*s+x, 8.0*s+y);
  }

  // Z

  if (character == ':')
  {
    point(2.0*s+x, 3.0*s+y);
    point(2.0*s+x, 7.0*s+y);
  }

  if (character == '!')
  {
    line(5.0*s+x, 2.0*s+y, 5.0*s+x, 6.0*s+y);
    point(5.0*s+x, 8.0*s+y);
  }

  if (character == '-')
  {
    line(2.0*s+x, 5.0*s+y, 8.0*s+x, 5.0*s+y);
  }

  if (character == '>')
  {
    line(2.0*s+x, 2.0*s+y, 8.0*s+x, 5.0*s+y);
    line(2.0*s+x, 8.0*s+y, 8.0*s+x, 5.0*s+y);
  }

  if (character == '%')
  {
    line(2.0*s+x, 8.0*s+y, 8.0*s+x, 2.0*s+y);
    point(3.0*s+x, 3.0*s+y);
    point(7.0*s+x, 7.0*s+y);
  }
}

