
import interfascia.*;
GUIController c;
IFButton b1, b2, b3, b4;

Drop [] drips;
int numDrips = 0;
int red = 255;
int green = 253;
int blue = 240;
void setup()
{
  size(1000,600);
  background(0);
  drips = new Drop[6000];
  smooth();  

  c = new GUIController (this);
  b1 = new IFButton ("Candy Lime Green", 3, 1, 102, 17);
  b2 = new IFButton ("Purple", 120, 1, 40, 17);
  b3 = new IFButton ("Racing White", 175, 1, 90, 17);
  b4 = new IFButton ("Random", 280, 1, 47, 17);
  b1.addActionListener(this);
  b2.addActionListener(this);
  b3.addActionListener(this);
  b4.addActionListener(this);
  c.add (b1);
  c.add (b2);
  c.add (b3);
  c.add (b4);
}


void draw()
{
  for(int i = 0; i < numDrips; i++)
  {
    drips[i].drip();
    drips[i].show();
    drips[i].stopping();
  }
  if(mousePressed == true && mouseButton == LEFT && mouseY>20)
  {
    for(int i = 0; i < 50; i++)
    {
      float theta = random(0,2*PI);
      int radius = int(random(0,20));
      int x = mouseX + int(cos(theta)*radius);
      int y = mouseY + int(sin(theta)*radius);
      stroke(red,green,blue,100);
      fill(red,green,blue);
      ellipse(x,y,2,2);

    }
    if(numDrips < 999 && random(1) < .2)
    {
      drips[numDrips] = new Drop(mouseX,mouseY,red,green,blue);
      numDrips++;
    }
  }
  else if(mousePressed == true && mouseButton == RIGHT){
    fill(0);
    stroke(0);
    float theta = random(0,2*PI);
    int radius = int(random(0,20));
    int x = mouseX + int(cos(theta)*radius);
    int y = mouseY + int(sin(theta)*radius);
    ellipse(x,y,20,20);
  }
}
void actionPerformed (GUIEvent e) {
  if (e.getSource() == b1) {
    red=32;
    green=164;
    blue=29;
  } 
  else if (e.getSource() == b2) {
    red=155;
    green=48;
    blue=255;
  } 
  else if (e.getSource() == b3) {
    red = 255;
    green = 253;
    blue = 240;
  }
  else if (e.getSource() == b4) {
    red=int(random(0,255));
    green = int(random(0,255));
    blue = int(random(0,255));
  }
  }

class Drop
{
  int x, y, size,r,red,green,blue;
  boolean isMoving;
  Drop(int theX, int theY, int theRed, int theGreen, int theBlue)
  {
    x = theX;
    y = theY;
    red = theRed;
    green = theGreen;
    blue = theBlue;
    r = int(random(399,600));
    size=10;
    isMoving=true;
  }
  void drip()
  {
    if(size > 1 && random(1) < .3)
    {
      size--;
    }
    if(isMoving==true){
      y++;
    }
  }
  void stopping(){
    if(int(random(100))==0){
      isMoving=false;
    }
  }
  void show()
  {
    fill(red,green,blue,100);
    stroke(red,green,blue,100);
    ellipse(x,y,size,size);
  }
}   


