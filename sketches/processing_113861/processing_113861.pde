
//Group 18 - Idris Shafiq, Kirsty Sneddon, Kieran Small, Daniel Ronan

Circle circle1; 
Circle circle2;
Circle circle3;
Circle circle4;
Circle circle5;

void setup() 

{ 
  size(600,600); 

  // initialise the objects. 
  // pass parameters to constructor 
  circle1 = new Circle(45, color(255,0,0),500 ,250 ,1, 2, 2);  
  circle2 = new Circle(45, color(0,0,255),width/2 ,250,2, 2.5, 2.5); 
  circle3 = new Circle(45, color(255,100,0),10, 10 ,2, 2.5, 2.5);
  circle4 = new Circle(45, color(255,0,100),590, 10 ,2, 2.5, 2.5);
  circle5 = new Circle(45, color(random(255),random(255),random(255)),width/2,590, 2, 2.5, 2.5); //The "random" ensures that the circle will be a different colour each time the program runs.
} 

void draw() 

{
  background (99,37,193);
  circle1.display(); 
  circle1.drive(); 
  circle2.display();
  circle2.drive(); 
  circle3.display(); 
  circle3.driveOrange();
  circle4.display();
  circle4.drivePink();
  circle5.display();
  circle5.driveDisco();
} 

// create the class 
// one class, multiple objects 

class Circle 

    {  
      float a;
      color c; 
      float xPos; 
      float yPos; 
      float xSpeed;
      float xChange = cos(radians(a)); 
      float yChange = sin(radians(a));  


  // The Constructor is defined with arguments. 
  // Create temp variables that are used within the function. 

Circle(float temp_a, color temp_c, float temp_xPos, float temp_yPos, float temp_xSpeed, float temp_xChange, float temp_yChange) 

    {  
      a = temp_a;
      c = temp_c; 
      xPos = temp_xPos; 
      yPos = temp_yPos; 
      xSpeed = temp_xSpeed; 
      xChange = temp_xChange;
      yChange = temp_yChange;
    } 
 
  
// show the object on the screen 

void display()

    { 
      stroke(0); 
      fill(c); 
      ellipse(xPos, yPos, 20, 20);
    } 
  
// move object on the screen 
// use realistic and sensible names 

void drive() 

    { 
      a=a+1; 

      float xChange = cos(radians(a)); 
      float yChange = sin(radians(a)); 
      float prevX = xPos;
      float prevY = yPos;

      xPos += xChange * 2.5 ; 
      yPos += yChange * 2.5 ; 


    } 

//Instructions for how the orange circle should behave.  
//Glides from top to bottom the moves back to the top and 100px to the left
void driveOrange()

    {
      if (yPos<600)
         {
           yPos++;
         }
         else
         {
           yPos=0;
           xPos+=100;
         }
//Resets the position of the circle so it won't dissapear off-screen.
       if (xPos<10 || xPos>590)
         {
           xPos=10;
         }
    }  

//Instructions for how the pink should behave.
//Glides from top to bottom the moves back to the top and 100px to the right
void drivePink()

    {
      if (yPos<600)
         {
           yPos++;
         }
         else
         {
           yPos=0;
           xPos-=100;
         }
//Resets the position of the circle so it won't dissapear off-screen.
         
      if(xPos<10 || xPos>590)
        {
          xPos=590;
        }
    }

//Instructions for how the Disco(Centred)circle should behave.
//Glides from top to bottom, then re-appears at the top again.
void driveDisco()

    {
      if (yPos>0)
         {
           yPos--;
         }
         else
         {
           yPos=600;
         }
         
      
    }
    
 
  


}

