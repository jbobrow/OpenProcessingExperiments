
ArrayList hax;

void setup()
{
  hax = new ArrayList();
  
  for(int y = 0; y < 30; y++)
    addLine();
  
  size(300, 300);
  smooth();
  textFont(loadFont("Courier-48.vlw"));
  
  frameRate(30);
}

void addLine()
{
  String s = "";
  
  for(int c = 0; c < 100; c++)
    if(random(1) < .6)
      s += "1";
    else
      s += "0";
  
  hax.add(s);
}
void removeLine()
{
  hax.remove(0);
}

void draw()
{
  addLine();
  removeLine();
  
  background(0);
  fill(0, 255, 0);
  textSize(20);
  for(int y = 0; y < hax.size(); y++)
    text((String)hax.get(y), 0, y*textAscent() - 3);
}
