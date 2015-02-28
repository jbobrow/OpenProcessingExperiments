
FrogBot kermit;
Walker w;



int q;
int flyDifficulty = 5;
float difficulty = 10;
PoisonFly[] flies = new PoisonFly[flyDifficulty];



 

//initial set up of the program is here
void setup()
{
  size(600, 600);
  smooth();
  //initialize
  kermit = new FrogBot(400,height-100);
 w = new Walker();

//initialized poinsonflies
flies[0] = new PoisonFly(400, 400);
for (int n=0; n<flyDifficulty; n++)
{
  flies[n] = new PoisonFly(random(0, width), random(50, height-150));
}

  
 

}

//this shows each step of the program and runs the game
void draw()
{
  for (int n = 0; n<flyDifficulty; n++)
  {
    if (kermit.getX() >= flies[n].getX()-10 && kermit.getX() <= flies[n].getX()+10
    &&
    kermit.getY() >= flies[n].getX() -10 && kermit.getY() <= flies[n].getY() +10 && mousePressed)
    {
      System.out.println("you hit a poison fly");
      stop();
    }
  }
  
  //this shows the end of the game
 if (kermit.getX() >= w.getX() - difficulty && kermit.getX() <= w.getX()+difficulty
 && 
 kermit.getY() >= w.getY()-difficulty && kermit.getY() <= w.getY()+difficulty && mousePressed)
 {
  // q++;
  // System.out.println(q);
   System.out.println("congratulations you caught it!");
   System.out.println("your score is " + (w.getX()-kermit.getX()) + " " + (w.getY()-kermit.getY()));
  stop();
 }
 
  //the background is going to change.  just for pretty points
  background(0, 0, 255, 200);
  kermit.run(); 
  w.step();
  w.display();
  for (int n = 0; n<flyDifficulty; n++)
  {
  flies[n].step();
  flies[n].display();
  }
}

class FrogBot
{
  //global variables
  float x = 0;
  float y = 0;
  float speedY=50;
  
  float tongueHeight;

  //functions
  void display()
  {
    //end of tongue
    ellipse(x, y, 5, 5);
    
   
   //frog tongue
   fill(255, 0, 0);
 triangle(mouseX-5, height-65, mouseX+5 , height -65, mouseX, y);
   
  //frog head
  fill(0, 200, 0);
    ellipse(x, height-40, 50, 75);
   //frog eye
   fill(255);
    ellipse(x-25, height-20, 30, 30);
    //eye pupil
    fill(0);
    ellipse(x-25, height -30, 10, 10);
    
   // frog mouth
    line(mouseX, height-65, mouseX, height-78);
    fill(255);
    
  }

//this initializes the frog
  FrogBot(float _x, float _y)
  {
    x = _x;
    y = _y;
  }
  
  //getX and getY are for the gaming purposes
  float getX()
  {
    return x;
  }
  float getY()
  {
    return y;
  }

  void run()
  {
    //display
    display();

    //move
    move();

    //bounce

      //gravity
  }


  void move()
  {
    x = mouseX;


    if (mousePressed)
    {
      y -= speedY;
    }
    else
    {
      y += speedY/2;
    }

    if (y>=height-100)
    {
      y=height-100;
    }

    if (y<-0)
    {
      y =0;
    }
  }
}

class Walker {
  float x;
  float y;

  ArrayList<Pair> pairs = new ArrayList<Pair>();
  ArrayList<Integer> choices = new ArrayList<Integer>();
  
//the initial position is going to be in the middle of the screen
Walker() {
  x = width/2;
  y = height/2;
}

float getX()
{
  return x;
}

float getY()
{
  return y;
}
  

void display()
{
  stroke(0);
  point(x,y);
  fill(0);
  ellipse(x, y-5, 7, 7);
  ellipse(x, y,10, 10);

  
}

void circle()
{
  int choice = int(random(5));
  
  if (choice == 5)
  {
    for (int n = 0; n <50; n++)
    {
      stroke(0);
      point(x--, y);
      Pair p = new Pair(x, y);
    }
  }
  
  if (choice == 0)
  {
  for (int n = 0; n< 50;n++)
  {
    stroke(0);
    point(x, y--);
    Pair p = new Pair(x, y);
      pairs.add(p);
  }
  for(int n = 0; n<50; n++)
  {
    stroke(0);
    point(x++,y);
    Pair p = new Pair(x, y);
      pairs.add(p);
  }
  
  }
   if (choice == 3)
  {
  for (int n = 0; n< 50;n++)
  {
    stroke(0);
    point(x, y++);
    Pair p = new Pair(x, y);
      pairs.add(p);
  }
  for(int n = 0; n<50; n++)
  {
    stroke(0);
    point(x++,y);
    Pair p = new Pair(x, y);
      pairs.add(p);
  }
  
 
  }
  
  if (choice == 2)
  {
    for (int n = 0; n<50;n++)
    {
      stroke(0);
      point(x++,y--);
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
  }
  
  if (choice == 1)
  {
   for (int n = 0; n<50; n++)
   {
     stroke(0);
     point(x--,y++);
     Pair p = new Pair(x, y);
      pairs.add(p);
   }
  }

  
}

void step() 
{
  

  if (x>width)
  {
    for (int j = 0; j<100;j++)
    {
      stroke(0);
      point(x--,y);
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    
  }
  
  if(x<0)
  {
    for(int j = 0; j<100;j++)
    {
      stroke(0);
      point(x++, y);
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
  }
  
  if(y> height-90)
  {
    for(int j = 0; j<100; j++)
    {
    stroke(0);
    point(x,y--);
    Pair p = new Pair(x, y);
      pairs.add(p);
    }
  }
  
  if(y<0)
  {
    for (int j = 0; j<100; j++)
    {
    stroke(0);
    point(x,y++);
    Pair p = new Pair(x, y);
      pairs.add(p);
    }
  }
  
  
 
  if(choices.size() == 0)
  {
    int choice = int(random(4));
    choices.add(choice);
    
    if (choice == 0)
    {
      x++;
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    
    else if (choice == 1)
    {
      x--;
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    
    else if (choice == 2)
    {
      y++;
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    else if (choice == 3)
    {
      y--;
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    
  }
  
  else
  {
    ArrayList<Integer> availables = new ArrayList<Integer>();
    boolean a = true;
    boolean b = true;
    boolean c = true;
    boolean d = true;
    
  
  for(int n = 0; n < pairs.size(); n++)
  {
    if(pairs.get(n).getX() == x+1 && pairs.get(n).getY() == y)
    {
      a = false;
    }

    
    if(pairs.get(n).getX() == x-1 && pairs.get(n).getY() == y)
    {
    b = false;
    }
    
    if(pairs.get(n).getX() == x && pairs.get(n).getY() == y+1)
    {
      c = false;
    }
    
    if(pairs.get(n).getX() == x && pairs.get(n).getY() == y-1)
    {
     d = false;
    }
  }  
  
  if( a == true)
  {
    availables.add(0);
  }
  
  if (b == true)
  {
    availables.add(1);
  }
  
  if (c == true)
  {
    availables.add(2);
  }
  
  if (d == true)
  {
    availables.add(3);
  }
  
    if (availables.size() == 0)
  {
    circle();
  }
  
  else
  {
  
  int choice = availables.get(int(random(availables.size())));
  for (int q = 0; q< availables.size(); q++)
  {
    //System.out.println(availables.get(q));
  }
  

  
   if (choice == 0)
    {
      x++;
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    
    else if (choice == 1)
    {
      x--;
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    
    else if (choice == 2)
    {
      y++;
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    else if (choice == 3)
    {
      y--;
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    
  }
   
  
  
}}
}

//the purpose of this class is to keep track of where the fly has been already
class Pair
{
  float x;
  float y;
  Pair(float s, float r)
  {
    x = s;
    y = r;
  }
  
  float getX()
  {
    return x;
  }
  
  float getY()
  {
    return y;
  }
  
  void getPair()
  {
    System.out.println(x + " " + y);
  }
}


class PoisonFly
{
  float x;
  float y;
  
  ArrayList<Pair> pairs = new ArrayList<Pair>();
  ArrayList<Integer> choices = new ArrayList<Integer>();
//the initial position is going to be in the middle of the screen

PoisonFly(float s, float r)
{
  x = s;
  y = r;
}

float getX()
{
  return x;
}

float getY()
{
  return y;
}
  

void display()
{
  stroke(0);
  point(x,y);
  fill(255);
  ellipse(x, y-10, 13, 13);
  ellipse(x, y,20, 20);

}

//make only horizontal movement happen
  
void step() 
{
  
  int choice = int(random(2));
   if (choice == 0 || x < 5)
    {
      x = x+10;
      Pair p = new Pair(x, y);
      pairs.add(p);
    }
    
    else if (choice == 1)
    {
      x= x-10;
      Pair p = new Pair(x, y);
      pairs.add(p);
    } 
   if (x > width-10)
   {
   x = x -10;
   Pair p = new Pair(x,y);
   pairs.add(p);
   }
}
}
