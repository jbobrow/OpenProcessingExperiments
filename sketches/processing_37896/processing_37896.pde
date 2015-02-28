
color[][] colors;
ArrayList pending;

//updates to the colors array are set here and then applied all at once at the end.
class pendingUpdate
{
  int x;
  int y;
  color c;
  pendingUpdate(int x_, int y_, color c_)
  {
    x = x_;
    y = y_;
    c = c_;
  }
  void apply()
  {
    if (x<width && y <height && x>=0 && y>=0)
    {
      colors[x][y] = c;
    }
  }
}

//safely get a color. c:
color getPix(int x, int y)
{
  if (x>=0 && y>=0 && x<width && y<height)
  {
    return colors[x][y];
  }
  else
  {
    return PROBLEM_COLOR;
  }
}

//puts a change on the queue
void addChange(int x, int y, color c)
{
  pending.add(new pendingUpdate(x, y, c)); //defined near the bottom
}

void addDirtChange(int x, int y, color c)
{
  //only draws on stems and bg
  color d = getPix(x,y);
  if(d!=FLOWER_SEED && d!=FLOWER_SPROUT && d!=FLOWER_BLOSSOM && d!= FLOWER_PETAL && d!=FLOWER_PETAL2 && 2!=FLOWER_PETAL3)
  {
    pending.add(new pendingUpdate(x,y,c));
  }
}

void drawColorArray()
{
  for (int x = 0; x < width; ++x)
  {
    for (int y = 0; y < height; ++y)
    {
      stroke(colors[x][y]);
      point(x, y);
    }
  }
}


void setupColorArray(color c)
{
  pending = new ArrayList();
  colors = new int[width][];
  for (int i = 0; i < width; ++i)
  {
    colors[i] = new int[height];
    for (int j = 0; j < height; ++j)
    {
      colors[i][j]=c;
    }
  }
}

//apply all the changes on the queue
void applyUpdates()
{
  for (int i = 0; i < pending.size(); ++i)
  {
    pendingUpdate p = (pendingUpdate) pending.get(i);
    p.apply();
  }
  pending.clear();
}


