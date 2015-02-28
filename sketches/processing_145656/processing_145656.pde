

//Images
PImage wood;
PImage cats;

//Declare and name array
Ladybug[] bugs = new Ladybug[20]; //Set # of "slots" in second []

void setup()
{
  size(500,400);
  background(255);
  smooth();
  
  //Load images
  wood = loadImage("Woodgrain.jpg");
  cats = loadImage("cats.jpg");
  
  //Initialize array using a for loop (length=number of slots)
  for(int i = 0; i < bugs.length; i++)
  {
    bugs[i] = new Ladybug();
  }
  
}

void draw()
{
  image(wood,0,0,500,400);
  
  //Animate array using a for loop
  for(int i = 0; i< bugs.length; i++)
  {
    bugs[i].update(); //Math
    bugs[i].display(); //Visual
  }
  //Show cat pic
  if(mousePressed)
  {
    image(cats,100,50,300,300);
  }
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
    
    if(lbugY <= -height-lbugWidth) //If statement "resets" snowflake when it reaches bottom 
    {
      lbugX = random(width);
      lbugY = height+lbugHeight;
      speed = random(1,5); 
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
}

//End class block


