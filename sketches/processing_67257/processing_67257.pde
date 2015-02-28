
float r = 16.0;


void setup()
{
  size(281, 185, JAVA2D);
  frameRate(12);
  smooth();
}

void draw()
{
  background(0);
  stroke(224);

  strokeWeight(4);

  printClock(32, 32, color(160, 0, 0), hour());
  printClock(120, 32, color(0, 160, 0), minute());
  printClock(208, 32, color(0, 0, 160), second());
}

void printClock(int x, int y, color c, int number)
{
  String bin = bcd(number);

  for (int i = 0; i < bin.length() - 4; i++)
  {
    if (bin.charAt(i) == '1')
      fill(c);
    else
      noFill();

    ellipse(x, y + 40*i, r*2, r*2);
  }

  for (int i = 4; i < bin.length(); i++)
  {
    if (bin.charAt(i) == '1')
      fill(c);
    else
      noFill();

    ellipse(x + 40, y + 40*(i-4), r*2, r*2);
  }
}

String bcd(int number)
{
  int uni, dec;

  dec = int(number/10);
  uni = number - (dec*10);

  return binary(dec, 4) + binary(uni, 4);
}


