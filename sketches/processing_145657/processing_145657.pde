
//Ladybug ArrayList sketch
/* @pjs font="data/andy.ttf"; */

//Images
PImage wood;
PImage cats;
PImage dog;

//Counter
int counter;

//Position variables
float posX;
float posY;

//Declare and name array list
ArrayList<Ladybug> bugs;

void setup()
{
  size(500,400);
  background(255);
  smooth();
  
  //Load images
  wood = loadImage("Woodgrain.jpg");
  cats = loadImage("cats.jpg");
  dog = loadImage("dog.jpg");
  
  //Load font
  textFont(createFont("Andy",32));
  
  //Set counter
  counter = 75;
  
  //Initialize array list
  bugs = new ArrayList<Ladybug>();
  
  //Add first Ladybug object
  bugs.add(new Ladybug());
  
}

void draw()
{
  //Background
  image(wood,0,0,500,400);
  
  //Words
  String k = "Right Click for Kittens";
  String p = "Left Click for Puppies";
  float twk = textWidth(k);
  float twp = textWidth(p);
  fill(0);
  text(k, (width-twk)/2, (height-32)/2);
  text(p, (width-twp)/2, (height+32)/2);
  
  //Animate array using a for loop
  for(int i = bugs.size() -1; i >= 0; i--)
  {
    Ladybug freshbug = bugs.get(i);
    freshbug.update();
    freshbug.display();
    
    if (freshbug.finished())
    {
      //Remove item
      bugs.remove(i);
    }
    
    //println(bugs.size());
  }
  
  //Add a new Ladybug each frame
  counter++;
  if(counter >=100)
  {
    counter = int(random(0,100));
    bugs.add(new Ladybug());
  }
  
  //Mouse actions
  //Pictures
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {
      image(cats,100,50,300,300); //Show cat picture
    }
    if (mouseButton == LEFT)
    {
      image(dog,100,50,300,300); //Show dog picture
    }
  } 
  
}

//Testing using mouse wheel scrolling
void mouseWheel(MouseEvent scroll)
{
  float e = scroll.getCount();
  println(e);
}

//Begin Ladybug class block
class Ladybug
{
  //Size variables
  float lbugWidth;
  float lbugHeight;
  
  //Position variables
  float lbugX;
  float lbugY;
  
  //Speed
  float speed;
  
  //Life
  float life = 100;
  
  //Class constructor
  Ladybug()
  {
    lbugWidth = random(25,100); //Set intital lbug width (random)
    lbugHeight = lbugWidth*random(1,2); //Set intital lbug height (random)
    lbugX = random(width); //Set initial x position (random)
    lbugY = height+lbugHeight; //Set initial y position (random)
    speed = random(1,5); //Set intial speed
    
  }
  
  //Method for math stuffs behind object
  void update()
  {
    lbugY -= speed; //Y position moves upward
    
    if(lbugY <= 0-lbugWidth) //If statement "resets" snowflake when it reaches bottom 
    {
      life = -1; 
    }
  }
  
  //Method for drawing object to the screen
  void display()
  {
    //Body
    strokeWeight(3);
    fill(255,0,0);
    ellipse(lbugX,lbugY,lbugWidth,lbugHeight);
    
    //Head
    //noStroke();
    fill(0);
    arc(lbugX,lbugY-(lbugHeight/5.5),lbugWidth-(lbugWidth/15),lbugHeight/1.5,PI,TWO_PI);
    
    //Horizontal Line 
    strokeWeight(3);
    line(lbugX,lbugY-(lbugHeight/4),lbugX,lbugY+(lbugHeight/2)); 
    
    //Spots   
    strokeWeight(1);
   
    //Top spot - 1st row
    ellipse(lbugX,lbugY-(lbugHeight/9),lbugWidth/8,lbugWidth/8); //Center
   
    //2nd row from top
    ellipse(lbugX-(lbugWidth/3),lbugY-(lbugHeight/17),lbugWidth/8,lbugWidth/8); //Left
    ellipse(lbugX+(lbugWidth/3),lbugY-(lbugHeight/17),lbugWidth/8,lbugWidth/8); //Right
   
    //3rd row from top
    ellipse(lbugX-(lbugWidth/6),lbugY+(lbugHeight/20),lbugWidth/8,lbugWidth/8); //Left
    ellipse(lbugX+(lbugWidth/6),lbugY+(lbugHeight/20),lbugWidth/8,lbugWidth/8); //Right
   
    //4th row from top
    ellipse(lbugX-(lbugWidth/3.25),lbugY+(lbugHeight/5),lbugWidth/8,lbugWidth/8); //Left
    ellipse(lbugX,lbugY+(lbugHeight/5),lbugWidth/8,lbugWidth/8); // Center
    ellipse(lbugX+(lbugWidth/3.25),lbugY+(lbugHeight/5),lbugWidth/8,lbugWidth/8); //Right
   
    //Bottom spots - 5th row from top
    ellipse(lbugX-(lbugWidth/6),lbugY+(lbugHeight/3),lbugWidth/8,lbugWidth/8); //Left
    ellipse(lbugX+(lbugWidth/6),lbugY+(lbugHeight/3),lbugWidth/8,lbugWidth/8); //Right
    
  }
  
  boolean finished()
  {
    if (life < 0)
    {
      return true;
    }
    else 
    {
      return false;
    }
  }
   
}

//End class block


