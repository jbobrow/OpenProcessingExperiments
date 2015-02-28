
final byte empty = 0, conductor = 1, spark_head = 2, spark_tail = 3;
final String[] names = new String[] { "empty", "conductor", "sprk_head", "sprk_tail" };
color c_conductor = color(205, 125, 50);
color c_spark_head = color(255, 255, 0);
color c_spark_tail = color(170, 0, 0);
byte[][] world;
int wx, wy;
float w, h;
int choice1 = conductor;
int choice2 = empty;
boolean paused = false;

int numSaved = 0;
char[] elemSet = new char[] { ' ', '@', '*', '@' };

void setup()
{
  w = 700; h = 700;
  size(int(w), int(h) + 50);
  smooth();
  wx = 80; wy = 80;
  world = new byte[wx][];
  for (int x=0;x<wx;x++)
  {
    world[x] = new byte[wy];
    for (int y=0;y<wy;y++)
    {
      world[x][y] = empty;
    }
  }
  //frameRate(20);
}
int mx, my;
void draw()
{
    if (!paused) step();
    
    float sx = w / (float)wx;
    float sy = h / (float)wy;
    mx = int(mouseX / sx);
    my = int(mouseY / sy);
    
    if (mousePressed && mx >= 0 && my >= 0 && mx < wx && my < wy)
    {
      float theta = atan2(mouseY-pmouseY,mouseX-pmouseX);
      float dist = dist(pmouseY, pmouseX, mouseY, mouseX);
      if (dist < sx) dist = sx;
      for (float r = 0; r < dist; r += min(sx, sy))
      {
        float x = pmouseX + r * cos(theta);
        float y = pmouseY + r * sin(theta);
        int cmx = int(x / sx), cmy = int(y / sy);
        if (mouseButton == LEFT)
          put(cmx, cmy, (byte)choice1);
        else if (mouseButton == RIGHT)
          put(cmx, cmy, (byte)choice2);
      }
    }
    
    strokeWeight(2);
    stroke(255);
    for (float x = 0; x < w; x += sx)
    {
      line(x, 0, x, h);
    }
    for (float y = 0; y < h; y += sy)
    {
      line(0, y, w, y);
    }
    
    noStroke();
    
    for (int x=0;x<wx;x++)
    {
      for (int y=0;y<wy;y++)
      {
        byte t = world[x][y];
        if (t == empty) fill(0);
        else if (t == conductor) fill(c_conductor);
        else if (t == spark_head) fill(c_spark_head);
        else if (t == spark_tail) fill(c_spark_tail);
        rect(x*sx,y*sy,sx,sy);
      }
    }
    
    strokeWeight(1.5);
    stroke(0,255,0);
    fill(0, 255, 0, 50);
    rect(mx*sx, my*sy, sx, sy);
    
    translate(0,h);
    noStroke();
    fill(50);
    doStroke(0);
    rect(0,0,w/3,h);
    fill(c_conductor);
    doStroke(1);
    rect(w/3,0,w/3,h);
    fill(c_spark_head);
    doStroke(2);
    rect(2*w/3,0,w/3,h);
    translate(0,-h);
    
    if (mousePressed && mouseY > h)
    {
      float x = mouseX;
      int c = int(x / (w / 3));
      if (mouseButton == LEFT && c != choice2) choice1 = c;
      else if (mouseButton == RIGHT && c != choice1) choice2 = c;
    }
    
    if (paused)
    {
      fill(255, 40);
      noStroke();
      rect(0,0,width,height);
    }
}
void step()
{
  byte[][] copy = new byte[wx][];
  for (int x=0;x<wx;x++)
  {
    copy[x] = new byte[wy];
    for (int y=0;y<wy;y++)
    {
      copy[x][y] = world[x][y];
    }
  }
  for (int x=0;x<wx;x++)
  {
    for (int y=0;y<wy;y++)
    {
      byte t = copy[x][y];
      if (t == spark_head) world[x][y] = spark_tail;
      else if (t == spark_tail) world[x][y] = conductor;
      else if (t == conductor)
      {
        int n = 0;
        if (getAt(x-1, y-1, copy) == spark_head) n++;
        if (getAt(x, y-1, copy) == spark_head) n++;
        if (getAt(x+1, y-1, copy) == spark_head) n++;
        if (getAt(x+1, y, copy) == spark_head) n++;
        if (getAt(x+1, y+1, copy) == spark_head) n++;
        if (getAt(x, y+1, copy) == spark_head) n++;
        if (getAt(x-1, y+1, copy) == spark_head) n++;
        if (getAt(x-1, y, copy) == spark_head) n++;
        if (n == 1 || n == 2) world[x][y] = spark_head;
      }
    }
  }
}
byte getAt(int x, int y, byte[][] a)
{
  if (x < 0 || y < 0 || x >= wx || y >= wy) return empty;
  return a[x][y];
}
void doStroke(int x)
{
  strokeWeight(3);
  if (x == choice1) stroke(0,0,255);
  else if (x == choice2) stroke(255, 0, 0);
  else noStroke();
}
void keyPressed()
{
  if (key == 'p' || key == ' ') paused = !paused;
  if (paused && keyCode == RIGHT) step();
  
  if (key == 'c') setup();
  else if (key == 's') saveWorld();
  else if (key == 'd') saveWorldSpecial(elemSet);
}
void put(int x, int y, byte type)
{
  if (x >= 0 && y >= 0 && x < wx && y < wy)
  {
    if (type == spark_head)
    {
      if (world[x][y] == conductor) world[x][y] = spark_head;
    }
    else world[x][y] = type;
  }
}
void saveWorld()
{
  String[] lines = new String[wy];
  for (int y=0;y<wy;y++) lines[y] = "";
  for (int x = 0; x < wx; x++)
  {
    for (int y = 0; y < wy; y++)
    {
      byte type = world[x][y];
      lines[y] += type;
    }
  }
  saveStrings("screen_save_" + (++numSaved) + ".txt", lines);
}
void saveWorldSpecial(char[] chars)
{
  String[] lines = new String[wy];
  for (int y=0;y<wy;y++) lines[y] = "";
  for (int x = 0; x < wx; x++)
  {
    for (int y = 0; y < wy; y++)
    {
      byte type = world[x][y];
      lines[y] += chars[int(type)];
    }
  }
  saveStrings("screen_save_" + (++numSaved) + ".txt", lines);
}

