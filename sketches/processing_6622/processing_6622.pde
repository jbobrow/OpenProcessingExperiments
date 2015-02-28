
final color black = color(0);
final color wall = #686868;
final color sand = #C8C84F;
final color acid = #1CCF00;
final color plant = #6BB31E;
final color water = #3746C7;
final color fire = #E03116;
final color fuse = #A4A4A4;
final color spout = #ABE4FF;
final color explosive = #6D2D08;
final color flamethrower = #FF7A2D;
final color virus = #A71EC2;
final color antivirus = #19A369;
final color air = color(240);

final color[] colors = new color[] { black, wall, sand, acid, plant, water, fire, fuse, spout, explosive, flamethrower, virus, antivirus, air };
final String[] colorNames = new String[] { "black", "wall", "sand", "acid", "plant", "water", "fire", "fuse", "spout", "explosive", "flamethrower", "virus", "antivirus", "air" };
final String[] colorKeys = new String[] { "Right Click", "Q", "Default", "A", "P", "W", "F", "U", "S", "E", "T", "V", "C", "G" };
final String[] hints = new String[]{ "Hold down a key and left click to make sand", "Try placing acid/sand/virus on top of a spout", "Virus doesn't like acid or antivirus", "Use fuse + explosives to make time bombs", "Fire consumes plant, fuse, explosive + more", "Virus attacks water and plant", "Press SPACE to pause", "Press H to toggle hints on/off", "Try watering the plants" };

int initialHint = (int)random(hints.length);
final int hintTimer = 10;
boolean paused = false;
boolean showHints = true;
PFont font;
color[] pix;
final int h = 300;

void setup()
{
  size(400,470,JAVA2D);
  frameRate(60);
  background(black);
  strokeWeight(2);
  
  font = loadFont("Calibri-14.vlw");
  textFont(font, 14);
  textAlign(LEFT, CENTER);
  
  drawHelp();
}

void draw()
{
  noStroke();
  
  if(mousePressed)
  {
    if(mouseButton == LEFT  &&  mouseY < h-1)
    {
      fill(sand);
      
      if(keyPressed  &&  key != CODED)
        switch(key)
        {
          case 'a': fill(acid); break;
          case 'p': fill(plant); break;
          case 'w': fill(water); break;
          case 'f': fill(fire); break;
          case 'u': fill(fuse); break;
          case 's': fill(spout); break;
          case 'e': fill(explosive); break;
          case 'q': fill(wall); break;
          case 't': fill(flamethrower); break;
          case 'v': fill(virus); break;
          case 'g': fill(air); break;
          case 'c': fill(antivirus); break;
        }
        
      for(int i = 0; i < 16; i++)
      {
        rect(mouseX-4+random(8),clamp(mouseY-4+random(8),0,h),2,2);
      }
    }
    else if(mouseButton == RIGHT)
    {
      fill(black);
      rect(mouseX-4,mouseY-4,8,8);
    }
  }
  
  if(!paused)
    updateSand(); 
    
  drawHint();
  
  stroke(255);
  line(0,h,width,h);
}

void keyPressed()
{
  if(key != CODED)
    switch(key)
    {
      case '#': clearBoard(); break;
      case ' ': paused = !paused; break;
      case 'h': showHints = !showHints; break;
    }
}

void clearBoard()
{
  background(0);
  drawHelp();
}

void updateSand()
{
  loadPixels();  
  pix = (color[])pixels.clone();
  
  for(int i = width; i < width*(h-1); i++)
  {
    if(pix[i] == sand)
      standardMove(i, sand);
    else if(pix[i] == acid)
    {
      standardMove(i, acid);
      if(isAcidable(i+width)) removePixels(new int[] { i, i+width });
    }
    else if(pix[i] == water)
    {
      standardMove(i, water);
      if((pix[i+width] == plant) || (pix[i+width-1] == plant) || (pix[i+width+1] == plant)) pixels[i] = plant;
    }
    else if(pix[i] == fire)
    {
      if(pix[i-width] == black) {  if((int)random(6) != 4) movePixel(i,i-width,fire); else pixels[i] = black; }      
      else
      {
        spreadAround(i, fuse, fire, false, 0);
        spreadAround(i, plant, fire, true, 15);
      }
      if(!isFlammable(i-width))
        if((int)random(3) == 0) pixels[i] = black;
    }
    else if(pix[i] == spout)
    {
      if(pix[i+width] == black  &&  (int)random(3) != 0) 
      {
        color above = findAboveBlock(i,spout);
        pixels[i+width] = (above == black) ? water : above;
      }
    }
    else if(pix[i] == explosive)
    {
      if(checkSurroundings(i, fire) != -1) explosion(i, 18+(int)random(20), fire);
    }
    else if(pix[i] == flamethrower)
    {
      color above = findAboveBlock(i,flamethrower);
      int pm = (above == black) ? -1 : 1;
      for(int j = 0; j < 15; j += pm)
      {
        if(pix[i+j] == black)
          if((int)random(3) == 0) pixels[i+j] = fire;
        else if(pix[i+j] != fire) break;
      }  
    }
    else if(pix[i] == virus)
    {
      int pos = checkSurroundings(i, water);
      if(pos == -1)  pos = checkSurroundings(i, plant);
      if(pos != -1)  pixels[pos] = virus;
      else standardMove(i, virus);
    }
    else if(pix[i] == antivirus)
    {
      int pos = checkSurroundings(i, virus);
      if(pos != -1) pixels[pos] = antivirus;
      else if((int)random(30) == 0) pixels[i] = black;
      else standardMove(i, antivirus);
    }
    else if(pix[i] == air)
    {      
      if(isBlowable(i-width)) movePixel(i-width, i-2*width, pix[i-width]);
      standardMoveUp(i, air);
    }
  }
  
  for(int i = 0; i < width; i++)
    pixels[i] = black;
    
  updatePixels();
}

boolean anyOf(int[] pos, color col)
{
  for(int i = 0; i < pos.length; i++)
    if(pix[pos[i]] == col)
      return true;
      
  return false;
}

void standardMove(int i, color col)
{
  if(pix[i+width] == black) movePixel(i,i+width,col);
  else if(pix[i+width-1] == black) movePixel(i,i+width-1,col);
  else if(pix[i+width+1] == black) movePixel(i,i+width+1,col);
}

void standardMoveUp(int i, color col)
{
  if(pix[i-width] == black) movePixel(i,i-width,col);
  else if(pix[i-width-1] == black) movePixel(i,i-width-1,col);
  else if(pix[i-width+1] == black) movePixel(i,i-width+1,col);
}

void randomMoveUp(int i, color moveIntoColor, color col)
{
  int rnd = (int)random(3);
  
  for(int j = 0; j < 3; j++)
  {
    switch((rnd+j)%3)
    {
      case 0: if(pix[i-width] == moveIntoColor){ movePixel(i,i-width,col); j += 1+(int)random(1); }break;
      case 1: if(pix[i-width-1] == moveIntoColor){ movePixel(i,i-width-1,col); j += 1+(int)random(1); } break;
      case 2: if(pix[i-width+1] == moveIntoColor){ movePixel(i,i-width+1,col); j += 1+(int)random(1); } break;
    }
  }
}

void spreadAround(int i, color moveIntoColor, color col, boolean useRandoms, int rand)
{
  int offsetx = clamp(i % width,1,width-1);
  int offsety = clamp((i / width) * width, width, (h-1)*width);
  rand = useRandoms ? rand : 0;
  
  for(int x = -1; x < 2; x++)
    for(int y = -width; y < width+1; y += width)
      if(pix[offsety+y+offsetx+x] == moveIntoColor)
        if((int)random(rand) == 0) pixels[offsety+y+offsetx+x] = col;
}

int checkSurroundings(int i, color col)
{
  int offsetx = clamp(i % width,1,width-1);
  int offsety = clamp((i / width) * width, width, (h-1)*width);
  
  for(int x = -1; x < 2; x++)
    for(int y = -width; y < width+1; y += width)
      if(pix[offsety+y+offsetx+x] == col) return offsety+y+offsetx+x;
  
  return -1;
}

void explosion(int i, int radius, color col)
{
  int offsetx = clamp(i % width,radius,width-radius);
  int offsety = clamp((i / width) * width,(radius+1)*width,(h-radius-2)*width);
  
  for(int x = -radius; x <= radius; x++)
    for(int y = -width*radius; y <= width*radius; y += width)
      pixels[offsety+y+offsetx+x] = col;
}

boolean isFlammable(int i)
{
  return (pix[i] == plant  ||  pix[i] == fuse  ||  pix[i] == explosive);
}

boolean isAcidable(int i)
{
  return (pix[i] == wall  ||  pix[i] == plant || pix[i] == virus);
}

boolean isBlowable(int i)
{
  return (pix[i] == virus  ||  pix[i] == antivirus  ||  pix[i] == sand  ||  pix[i] == fire);
}

boolean isAboveBlock(int i, color cont, color col)
{
  for( ; i > width; i -= width)
  {
    if(pix[i-width] == col) return true;
    else if(pix[i-width] != cont) return false;
  }
  
  return false;
}

color findAboveBlock(int i, color cont)
{
  for( ; i > width; i -= width)
  {
    if(pix[i-width] == black) return black;
    else if(pix[i-width] != cont) return pix[i-width];
  }
  
  return black;
}

void movePixel(int removePos, int newPos, color col)
{
  pixels[removePos] = black;
  pixels[newPos] = col;
}

void removePixels(int[] pos)
{
  for(int i = 0; i < pos.length; i++)
    pixels[pos[i]] = black;
}

int clamp(int num, int min, int max)
{
  if(num > max)
    return max;
  
  if(num < min)
    return min;
  
  return num;
}

float clamp(float num, float min, float max)
{
  if(num > max)
    return max;
  
  if(num < min)
    return min;
  
  return num;
}

