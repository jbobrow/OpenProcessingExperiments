
int curRule = 110;
boolean rand = false;
PFont font;

void setup()
{
  size(900,450,JAVA2D);
  noLoop();
  stroke(0);
  fill(0, 102, 153);
  
  font = loadFont("ArialMT-18.vlw");
  textFont(font,18);
  textAlign(LEFT, TOP);
}

void draw()
{
  background(255);
  
  if(rand)
    for(int i = 0; i < width; i++)
    {
      if((int)random(0,2) == 0)
        point(i,0);
    }
  else
    point(width/2,0);
    
  drawRule(makeRule(curRule));
}

void drawRule(Hashtable rule)
{   
  loadPixels();
  
  for(int y = 0; y < height-1; y++)
    for(int x = 1; x < width-1; x++)
      pixels[(y+1)*width+x] = color(((Boolean)rule.get(shiftCells(getPixel(y*width+x-1), getPixel(y*width+x), getPixel(y*width+x+1)))) ? 0 : 255);
      
  updatePixels();
  
  text("Rule: " + curRule, 10, 10);
}

int getPixel(int pos)
{
  return (pixels[pos] == color(0)) ? 1 : 0;
}

Hashtable makeRule(int num)
{
  String bin = ruleToBinary(num);
  println(bin);
  boolean[] alive = new boolean[8];
  for(int i = 0; i < bin.length(); i++)
    alive[i] = (bin.substring(i,i+1).equalsIgnoreCase("1"));  
  
  Hashtable rule = new Hashtable();
  rule.put(shiftCells(1,1,1), alive[0]);
  rule.put(shiftCells(1,1,0), alive[1]);
  rule.put(shiftCells(1,0,1), alive[2]);
  rule.put(shiftCells(1,0,0), alive[3]);
  
  rule.put(shiftCells(0,1,1), alive[4]);
  rule.put(shiftCells(0,1,0), alive[5]);
  rule.put(shiftCells(0,0,1), alive[6]);
  rule.put(shiftCells(0,0,0), alive[7]);
  
  return rule;
}

String ruleToBinary(int num)
{
  clamp(num,0,255);
  String bin = Integer.toBinaryString(num);
  int len = bin.length();
  
  if(len < 8)
    for(int i = 0; i < (8-len); i++)
      bin = "0" + bin;      
      
  return bin;
}

Integer shiftCells(int left, int mid, int right)
{
  return new Integer((left << 2) | (mid << 1) | right);
}

int clamp(int num, int min, int max)
{
  if(num > max)
    return max;
  if(num < min)
    return min;
  
  return num;
}

void changeRule(int num)
{
  num = clamp(num,0,255);
  curRule = num;
  redraw();
}

void mousePressed()
{
  changeRule((int)random(1,256));
}

void keyPressed()
{
  if(key == CODED)
  {
    switch(keyCode)
    {
      case LEFT: changeRule(curRule-1); break;
      case RIGHT: changeRule(curRule+1); break;
      case DOWN: changeRule(curRule-10); break;
      case UP: changeRule(curRule+10); break;
    }
  }
  else
  {
    switch (key)
    {
      case 'r': rand = !rand; redraw(); break;
      case 'n': redraw(); break;
    }
  }
}

