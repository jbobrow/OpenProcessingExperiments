
color[] colors = new color[16];
color[] temp = new color[16];
int[] ranks = new int[16];
PFont font; 
int count = 0;
float crossoverRate = 0.7;

void setup()
{
  size(400,400);
  for(int i=0; i < 16; i++)
  {
    colors[i] = color((int) random(255), (int) random(255), (int) random(255));
  }
  font = loadFont("SansSerif-32.vlw"); 
  textFont(font, 32);
  textAlign(CENTER);
}

void draw()
{
  if(count == 16)
    gen();
  for(int i = 0;i < 16; i++)
  {
    fill(colors[i]);
    rect((i % 4) * 100, (i / 4) * 100, 100, 100);
  }
  stroke(255, 0, 0);
  strokeWeight(3);
  noFill();
  rect((mouseX / 100) * 100, (mouseY / 100) * 100, 100, 100);
  stroke(0);
  strokeWeight(1);
  fill(0);
  for(int i = 0; i < count; i++)
    text(i + 1, (ranks[i] % 4) * 100 + 50, (ranks[i] / 4) * 100 + 50 + 12);
}

void mouseClicked()
{
  boolean isNew = true;
  {
    int cell = (mouseY / 100) * 4 + (mouseX / 100);
    for(int i = 0; i < count; i++)
      if(cell == ranks[i])
        isNew = false;
    if(isNew)
    {
      ranks[count] = cell;
      count++;
    }
  }
}

void gen()
{
  for(int i = 0; i < 16; i += 2)
  {
    float p1c = random(90);
    int p1 = 0;
    int num = 30;
    p1c -= num;
    num /= 1.5;
    while(p1c > 0)
    {
      p1++;
      if(num != 0)
        p1c -= num;
      else
        p1c -= 1;
      num /= 1.5;
    }
    
    float p2c = random(90);
    int p2 = 0;
    num = 30;
    p2c -= num;
    num /= 1.5;
    while(p2c>0)
    {
      p2++;
      if(num != 0)
        p2c -= num;
      else
        p2c -= 1;
      num /= 1.5;
    }
    
    color off1 = colors[ranks[p1]];
    color off2 = colors[ranks[p2]];
    //crossover
    if(random(1) < crossoverRate)
    {
      int crossoverPoint = 8 + (int) random(24);
      String o1 = binary(off1).substring(8,crossoverPoint)+binary(off2).substring(crossoverPoint,32);
      String o2 = binary(off2).substring(8,crossoverPoint)+binary(off1).substring(crossoverPoint,32);
      off1 = unbinary(o1) | 0xFF << 24;
      off2 = unbinary(o2) | 0xFF << 24;
    }
    //reproduce
    temp[i] = off1;
    temp[i+1] = off2;
  }
  count = 0;
  for(int i=0;i<16;i++)
  {
    colors[i] = temp[i];
  }
}

