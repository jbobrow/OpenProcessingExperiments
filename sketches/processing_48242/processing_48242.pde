
PFont font;
Circle[] circles;
radio[] buttons = new radio[6];
int numCircles = 0;
color temp;

void setup()
{
  size(400,500);
  background(255);
  font = loadFont("AmericanTypewriter-Light-48.vlw");
  circles = new Circle[100];
  buttons[0] = new radio(120,50,30,color(255), color(0), 0, buttons);
  buttons[1] = new radio(170,50,30,color(255,0,0), color(0), 1, buttons);
  buttons[2] = new radio(220,50,30,color(0,255,0), color(0), 2, buttons);
  buttons[3] = new radio(270,50,30,color(0,0,255), color(0), 3, buttons);
  buttons[4] = new radio(320,50,30,color(0), color(255), 4, buttons);
  buttons[5] = new radio(370,50,30, color(120,120,120), color(255), 5, buttons);
}

void mousePressed()
{
  buttons[0].press(mouseX,mouseY);
  buttons[1].press(mouseX,mouseY);
  buttons[2].press(mouseX,mouseY);
  buttons[3].press(mouseX,mouseY);
  buttons[4].press(mouseX,mouseY);
  buttons[5].press(mouseX,mouseY);

  float tempNumber = random(0,255);

  if(buttons[0].checked == true)
  temp = color(255,255,255);
  else if (buttons[1].checked == true)
  temp = color(tempNumber,0,0);
  else if (buttons[2].checked == true)
  temp = color(0,tempNumber,0);
  else if (buttons[3].checked == true)
  temp = color(0,0,tempNumber);
  else if (buttons[4].checked == true)
  temp = color(0,0,0);
  else
  temp = color(255,255,255);
   
  if(mouseY>100 && numCircles<=99 && buttons[5].checked == false)
  {
  circles[numCircles] = new Circle(numCircles, temp);
  numCircles++;
  }
}

void draw()
{
  background(255);
  line(0,100,400,100);
  textFont(font);
  fill(0);
  text(numCircles,10,65,80);  
  buttons[0].display();
  buttons[1].display();
  buttons[2].display();
  buttons[3].display();
  buttons[4].display();
  buttons[5].display();
  
  for(int i = 0; i<numCircles; i++)
  {
    circles[i].direction();
    circles[i].display();
  } 
  
  if(buttons[5].checked==true)
  numCircles = 0;
  
  if(numCircles >=2)
  ObjectCollision(circles,numCircles);
}

class Circle
{
  float myRadius = int(random(5,30));
  int myself;
  color myColor;
  PVector location = new PVector(int(random(width)), int(random(400))+100);
 
  PVector velocity = new PVector(int(random(-3,3)), int(random(-3,3)));
  
  float opacity= random(100,200);
  
  float change = (random(-1,1));

  
  Circle(int m, color c)
  {
    myself = m;
    myColor = c;
    this.location = location;
    this.location.x = location.x;
    this.location.y = location.y;
    this.velocity = velocity;
    this.velocity.x = velocity.x;
    this.velocity.y = velocity.y;
    this.myColor = myColor;
    this.myRadius = myRadius;
    this.change = change;
      
  }
  

  void direction()
  {
  if ((location.x>width) || location.x<0)
    {
      velocity.x=velocity.x*-1;
    }
  if(location.y<100 || (location.y>height))
    {
      velocity.y=velocity.y*-1;
    }
    location.y = location.y +velocity.y;
    location.x = location.x +velocity.x;
  }
  
  void display()
  { 
    fill(myColor,opacity);
    ellipse(location.x,location.y,myRadius,myRadius);
  }
  
}


class radio
{
  int x;
  int y;
  int rsize;
  int dotsize;
  color base;
  color highlighted;
  boolean checked = false;
  int me;
  radio[] others;
  
radio(int xp, int yp, int s,color b,color d,int m, radio[] o)
  {
    x=xp;
    y=yp;
    rsize = s;
    dotsize = rsize - rsize/3;
    base = b;
    highlighted = d;
    others = o;
    me = m;
  }
  
  boolean press(float mx, float my)
  {
    if(dist(x,y,mx,my) < rsize/2)
    {
      checked = true;
      for(int i = 0; i< others.length; i++)
      {
        if(i != me)
        {
          others[i].checked = false;
        }
      }
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void display()
  {
    fill(base);
    ellipse(x,y,rsize,rsize);
    if(checked == true)
    {
      fill(highlighted);
      ellipse(x,y,dotsize,dotsize);
    }
  }
}

void ObjectCollision(Circle[] circles, int numCircles)
{
  PVector cVect = new PVector();
  for(int i = numCircles-1; i >0; i--)
  {
  for(int j =0; j<i; j++)
  {
  cVect.x = circles[i].location.x - circles[j].location.x;
  cVect.y = circles[i].location.y - circles[j].location.y;
  
  float cVectMag = sqrt(cVect.x * cVect.x + cVect.y*cVect.y);
  
  if (cVectMag <= circles[j].myRadius + circles[i].myRadius)
  { 
    float redTemp1= red(circles[j].myColor)/2;
    float greenTemp1= green(circles[j].myColor)/2;
    float blueTemp1= blue(circles[j].myColor)/2;
    float redTemp2 = red(circles[i].myColor)/2;
    float greenTemp2= green(circles[i].myColor)/2;
    float blueTemp2 = blue(circles[i].myColor)/2;
    if(circles[i].change > 0)
    circles[i].myColor = color(redTemp1 + redTemp2, greenTemp1 + greenTemp2, blueTemp1 + blueTemp2);
    if(circles[j].change > 0)
    circles[j].myColor = color(redTemp2 + redTemp1, greenTemp2 + greenTemp1, blueTemp2 + blueTemp1);
    
    PVector vTemp = new PVector();
    }
    }
  }
}


