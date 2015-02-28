
int l = 50;

Sprite player;  // Creates a sprite

void setup()
{
  size(700, 700);  // 700 x 700 pixels
  player = new Sprite(475, 475); // Instantiates player
}

void draw()
{
  drawBoard(); //Windows 8 colours used, shame for linux Hugo :P
  player.display();  //Draws a sprite at position (475, 475);
  player.update(); // My favourite function
}

void keyPressed()
{
  if (keyCode == UP)
    player.move(0, -1);
  if (keyCode == LEFT)
    player.move(-1, 0);
  if (keyCode == RIGHT)
    player.move(1, 0);
  if (keyCode == DOWN)
    player.move(0, 1);
}

void drawBoard()
{
  colorMode(HSB, 360, 100, 100);
  background(#008299);
  strokeWeight(6);  // Border thickness around the blocks
  stroke(#008299); // Border is same colour as background
  fill(#00A0B1);
  for (int i = 50; i < 650; i += 50)
    for (int j = 50; j < 650; j += 50)
    {

      fill(185, 100, map(i + j, 0, 1200, 75, 100));
      rect(i, j, l, l);
    }
}

class Sprite
{
  color fg;
  int arcRad;
  int rad;
  int x;
  int y;
  int r1, r2, r3, r4, r5, r6; //Arc positions for the 3 arcs
  
  Sprite(int _x, int _y)
  {
    fg = color(43);
    arcRad = 40;
    rad = 20;
    x = -200;
    y = -200;
    r1 = 0; r2 = 85; r3 = 120; r4 = 205; r5 = 240; r6 = 325;
    x = _x;
    y = _y;
  }
  
  void display()
  {
    colorMode(RGB);
    stroke(fg);
    strokeCap(SQUARE);
    strokeWeight(4);
    noFill();
    arc(x, y, arcRad, arcRad, radians(r1), radians(r2));
    arc(x, y, arcRad, arcRad, radians(r3), radians(r4));
    arc(x, y, arcRad, arcRad, radians(r5), radians(r6));
    fill(fg);
    ellipse(x, y, rad, rad);
  }
  
  //Rotates the 3 arcs
  void update()
  {
    ++r1; ++r2; ++r3; ++r4; ++r5; ++r6;
  }
  
  void move(int _x, int _y)
  {
    if (_x == -1)
      x -= 50;
    if (_x == 1)
      x += 50;
    if (_y == -1)
      y -= 50;
    if (_y == 1)
      y += 50;    
  }
}
