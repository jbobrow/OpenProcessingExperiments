
//This code was made by Mariam Osman
//Please Click the mouse to see more smiley faces added
//DECLARE
ArrayList EyeCollection;
Eye e1, e2, e3, e4, e5, e3x;


void setup()
{
  size(600, 600);
  EyeCollection = new ArrayList();
  e1 = new Eye (50, 20, 70);
  e2 = new Eye (64, 85, 30);
  e3 = new Eye (width/2 -70, height/2, 50);
  e3x = new Eye (width/2 +70, height/2, 60);
  e4 = new Eye (150, 44, 30);
  e5 = new Eye (175, 120, 40);
}
void draw()
{
  //INITIALIZE 


  background(0);
  frameRate(30);
  e1.run();
  e2.run();
  e4.run();
  e5.run();
  e3.run();
  e3x.run();
  for ( int i=0; i< EyeCollection.size() ; i++) 
  {
    Eye myB = (Eye) EyeCollection.get(i);
    myB.run();
  }


  if (mousePressed)
  {   
    Eye myEye = new Eye (mouseX, mouseY, 30);
    EyeCollection.add(myEye);
  }
}


// Class Eye

class Eye
{
  //GLOBAL VARIABLES
  float x;
  float y;
  float speedX = random(-1, 1);
  float speedY = random(-1, 1);
  int size;
  int size2;
  float angle= 0.0;


  //CONSTRUCTOR
  Eye(float _x, float _y, int s)
  {
    x = _x;
    y = _y;
    size = s;
  }

  //FUNCTIONS
  void run()
  {
    displayFace();
    displayEye1();
    displayEye2();
    move();
    bounce();
  }


  void bounce()
  {
    if (x > width || x <0 )
    {
      speedX= speedX * -1;
    }
    if (y > height || y <0 )
    {
      speedY= speedY * -1;
    }
  }
  void move()
  {
    x += 2*speedX;
    y += 2*speedY;
  }

  void update(float mx, float my)
  {
    angle= atan2(my-y-(size/4), mx-x-(size/4));
  }


  void displayEye1()
  {
    pushMatrix();
    translate (x, y);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0, mouseX, mouseY);
    ellipse(size/4, 0, size/2, size/2);
    fill(0);
    stroke(0);
    strokeWeight(1);
    ellipse((size/4) + size/8, 0, size/4, size/4);
    fill(200);
    ellipse((size/4) + size/8, 0, size/8, size/8);
    popMatrix();
    update(mouseX, mouseY);
  }

  void update2(float mx, float my)
  {
    angle= atan2(my-y+(size/4), mx-x+(size/4));
  }


  void displayEye2()
  {
    pushMatrix();
    translate (x+size, y);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0, mouseX, mouseY);
    ellipse(size/4, 0, size/2, size/2);
    fill(0);
    stroke(0);
    strokeWeight(1);
    ellipse(((size/4) + size/8), 0, size/4, size/4);
    fill(200);
    ellipse(((size/4) + size/8), 0, size/8, size/8);
    popMatrix();
    update2(mouseX, mouseY);
  }
  void displayFace()
  {
    pushMatrix();
    translate (x, y);
    fill(255, 255, 0);
    ellipse(size/2, size/8, size*2.5, size*2.8);
    fill(100, 0, 0);
    arc(constrain(mouseX/3, size-90, size), size*0.9, size/3, size*0.8, 0, PI);
    fill(255, 255, 0);
    arc(size/2, size*0.9 -(size/6), size*1.5, size*0.7, 0, PI);

    popMatrix();
  }
}


