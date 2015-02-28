
Wiggler peter, paul, mary; // Declare all your wigglers.
 
void setup()
{
   size(500,500);
   smooth();
   peter = new Wiggler(width/2,height/2, 1); //Initializing each Wiggler.
   paul = new Wiggler(10,10, 6);       // The constructor is expecting 3 params. X pos, Y pos and Speed...
   mary = new Wiggler(400,300,  4.5);
}
 
void draw()
{
  background(255);
   //Call methods on the wiggler.
   peter.display();
   peter.update();
   peter.wrap();
   peter.isMouseOverMe();
    
   paul.display();
   paul.update();
   paul.wrap();
   paul.isMouseOverMe();
    
   mary.display();
   mary.update();
   mary.wrap();
   mary.isMouseOverMe();
    
   //Access an individual Wiggler's fields, like it's position!
   println(paul.xpos);
}

class Wiggler
{
  //Data -- All the data that describes a wiggler
  // "fields"
  float xpos, ypos;
  float speed;
 
  //Constructor is like a "setup" for this class
  //This constructor takes in 3 parameters and uses them to initialize this Wiggler's fields.
  Wiggler( float tx, float ty, float ts   )
  {
    xpos= tx;
    ypos = ty;
    speed = ts;
  }
 
  //Functionality -- All the things a Wiggler knows how to do.
  // "methods"
  void update()
  {
    float rx = random(-speed, speed);
    float ry = random(-speed, speed);
 
    xpos = xpos + rx;
    ypos = ypos + ry;
  }
  //Anything having to do with how the Wiggler "looks"
  void display()
  {
    stroke(0);
    fill(100);
    ellipse(xpos, ypos, 20, 20);
  }
  //Screen Wrapping
  void wrap()
  {
    if (xpos >= width)
      xpos=0;
    else if (xpos <= 0)
      xpos=width;
    else if (ypos >= height)
      ypos =0;
    else if (ypos <= 0)
      ypos = height;
  }
  //Added in class -- Check to see if the mouse is over THIS wiggler.
  void isMouseOverMe()
  {
     if(  dist(xpos,ypos,  mouseX,mouseY) < 10  ) //if the dist btw the mouse and MY position is < MY radius.
     {
        fill(0, 100);
        rect(xpos,ypos, 50,100); //Text box, or something.
     }
  }
}



