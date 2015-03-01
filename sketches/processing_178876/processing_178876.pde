
boolean tri;
int size;
ArrayList<Letter> letters = new ArrayList<Letter>();

void setup()
{
  size(600,600);
  background(255);
  tri = true;
  size = 50;
  noStroke();
}

void draw()
{
  color c = color ( random(255), random(255), random(255));
  fill(c);
  if (tri)
  {
    triangle(mouseX-size,mouseY+size,mouseX-size,mouseY-size/2,mouseX+size,mouseY);
  }
  else
  {
    ellipse(mouseX,mouseY,size,size);
  }
  for (int i = 0; i < letters.size(); i++)
  {
    Letter l = letters.get(i);
    l.drawLetter();
  }
  for (int i = 0; i < letters.size(); i++)
  {
    Letter l = letters.get(i);
    if (l.done())
    {
      letters.remove(i);
    }
  }
}

void mousePressed()
{
  if (tri) tri = false;
  else tri = true;
}
    

void keyPressed()
{
  if (keyCode == DOWN)
  {
    size -= 10;
  }
  else if (keyCode == UP)
  {
    size += 10;
  }

  fill(0);
  for (int i = 0; i < letters.size(); i++)
  {
    letters.get(i).setToWhite();
  }
  letters.add(new Letter(str(key)));
}

class Letter
{
  int count;
  int limit = 185;
  String letter;
  
  Letter(String l)
  {
    letter = l.toUpperCase();
    count = 255;
  }
  
  void drawLetter()
  {
    textSize(350);
    if (count > limit)
    {
      fill(0);
    }
    else
    {
      fill(255,255,255-count);
    }
    text(letter,width/2-40,height/2);
    count -= 5;
  }
  
  boolean done()
  {
    if (count <= 0)
    {
      return true;
    }
    else return false;
  }
  
  void setToWhite()
  {
    count = limit;
  }
    
}
    
