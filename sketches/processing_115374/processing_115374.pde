
//Create player object reference
Player player1;

//Create objects to fly across the screen
Object object,object2,object3,object4,object5,object6,object7;

//Declare x and y initial and current positions
int starting_x_Position = 300, starting_y_Position = 500, xPosition, yPosition;

//Boolean to determine whether the move is happening or not
boolean move = false;

//For storing bullet position
int bulletX, bulletY;

// sets up array to store multiple aliens
Alien [] invaders;
Alien [] invaders1;
Alien [] invaders2;

//Declare starting positions and starting rows
int alien_startx;
int alien_starty;
int alien_startrow2;
int alien_startrow3;

//Different direction+speed indicators for every alien row
float m1=-0.5, m2 = -0.5, m3 = -0.5;  

void setup () 
{
  objectiful();
  rectMode(CENTER);
  
  //Set starting positions
  alien_startx = 30;
  alien_starty = 50;
  alien_startrow2 = 100;
  alien_startrow3 = 150;
  
  //Create new alien objects
  invaders = new Alien[8];
  invaders1 = new Alien[8];
  invaders2 = new Alien[8];
  
  xPosition = starting_x_Position;
  yPosition = starting_y_Position;
  
  //Create player object
  player1 = new Player(starting_x_Position, starting_y_Position);
  
  //Background size and colour
  size(600, 600);
  background(0);
  
  //Create aliens in row 1
  for (int i=0; i<8; i++)
  {
    invaders[i] = new Alien(alien_startx, alien_starty, 1, true);
    alien_startx += 60;
  }
  
  //Reset startx to 30
  alien_startx=30;
  
  //Create aliens in row 2
  for (int i=0; i<8; i++)
  {
     invaders1[i] = new Alien(alien_startx, alien_startrow2, 2, true);
     alien_startx += 60;
  }
  
  //Reset startx to 30   
  alien_startx = 30;
  
  //Create aliens in row 3   
  for (int i=0; i<8; i++)
  {
      invaders2[i] = new Alien(alien_startx, alien_startrow3, 3, true);
      alien_startx += 60;
  }
    
  //Draw rectangles from center
  rectMode(CENTER);
  fill(0, 255, 0);
  
  //Draw the player on-screen
  drawplayer(xPosition, yPosition);
}

void draw () 
{
  //Background must be set to black at the start of draw to prevent hundreds of copies of objects being drawn
  background(0);
  
  //Display background objects
  drawing();
  
  //For each alien in row 1
  for (int i=0; i<8; i++) 
  {
    //If the alien is alive
    if (invaders[i].returnAlive() == true)
    {
      //Display and move
      invaders[i].display();
      invaders[i].move();
    }
  }
 
 //For each alien in row 2
 for (int j=0; j<8; j++) 
 {
   //If the alien is alive
   if (invaders1[j].returnAlive() == true)
   {
     //Display and move
      invaders1[j].display();
      invaders1[j].move();
   }
 }
 
 //For each alien in row 3
 for (int k=0; k<8; k++) 
 {
   //If the alien is alive
   if (invaders2[k].returnAlive() == true)
   {
     //Display and move
      invaders2[k].display();
      invaders2[k].move();
   }
 }
 
 //Move player if a key is pressed
 if (keyPressed)
 {
    player1.moveplayer();
 }
 
 //If a move has been initiated
 if (move == true)
 {
   //Create the bullet at the bullet x and y position
    createbullet(bulletX, bulletY);
    
    //Move bullet up
    bulletY -= 5;
 }
 
  //For each alien in row 1
  for (int i=0; i<8; i++)
  {
     //If the bullet touches the alien (alien is 30x30 so its boundares will be 15 places from its x and y position)
     if ((bulletX >= (invaders[i].returnX() - 15)) && (bulletX <= (invaders[i].returnX() + 15)) && (bulletY <= (invaders[i].returnY() + 15)) && (bulletY >= (invaders[i].returnY() - 15)))
     {
      invaders[i].death();
     }
  }

  //For each alien in row 2
  for (int j=0; j<8; j++)
  {
    //If the bullet touches the alien
     if ((bulletX >= (invaders1[j].returnX() - 15)) && (bulletX <= (invaders1[j].returnX() + 15)) && (bulletY <= (invaders1[j].returnY() + 15)) && (bulletY >= (invaders1[j].returnY() - 15)))
     {
      //Run death method
      invaders1[j].death();
     }
  }

  //For each alien in row 3
  for (int k=0; k<8; k++)
  {
     //If the bullet touches the alien
     if ((bulletX >= (invaders2[k].returnX() - 15)) && (bulletX <= (invaders2[k].returnX() + 15)) && (bulletY <= (invaders2[k].returnY() + 15)) && (bulletY >= (invaders2[k].returnY() - 15)))
     {
      //Run death method
      invaders2[k].death();
     }
  }

  //Draw the player
  drawplayer(xPosition,yPosition);
   
}

//Draws the player at the current position
void drawplayer (int locationX, int locationY) 
{

  fill(0, 255, 0);
  ellipseMode(CENTER);
  ellipse(locationX, locationY, 50, 50);
  strokeWeight(4);
  triangle(locationX-2, locationY-1, locationX+2, locationY-1, locationX, locationY+4);
  strokeWeight(2);
  noSmooth();
  line(locationX-10, locationY+10, locationX+10, locationY+10);
  line(locationX-10, locationY+10, locationX-10, locationY+20);
  line(locationX+10, locationY+10, locationX+10, locationY+20);
  fill(random(255),random(255),random(255));
  smooth();
  strokeWeight(3);
  ellipse(locationX+10, locationY-10, 10, 10);
  ellipse(locationX-10, locationY-10, 10, 10);
  
}


//Draws the bullet at the current position
void createbullet(int locationX,int locationY)
{
  
  fill(255);
  strokeWeight(0);
  rect(locationX, locationY, 7, 10);
  
}

//Method for when the mouse is clicked
void mouseClicked() 
{
    //Create the bullet at the player's position
    createbullet(xPosition, yPosition);
    
    //Set initial bullet position
    bulletX = xPosition;
    bulletY = yPosition;
    
    //
    move = true;
}

//Alien class
class Alien
{

  //instance variables
  float xpos;
  float ypos;
  int width_block; 
  int height_block;
  int rownumber;
  
  //Boolean determining whether alien should be drawn or not
  boolean is_alive;

  // constructor for Alien class
  Alien(int temp_x,int temp_y, int temp_rownumber, boolean temp_alive)
  {
    rownumber = temp_rownumber;
    xpos=temp_x;
    ypos=temp_y;
    width_block=30;
    height_block=30;
    is_alive = temp_alive;
  }
  
  //Accessor method for alien x position
  float returnX()
  {
    return xpos;
  }
  
  //Accessor method for alien y position
  float returnY()
  {
    return ypos;
  }
  
  //Accessor method to check if alien is alive
  boolean returnAlive()
  {
    return is_alive;
  }
  
  //Outputs graphic display of alien on screen
  void display()
  {   
      stroke(0);
      strokeWeight(1);
      fill(42, 66, 247);  
      rect(xpos-7, ypos-1, 14, 10);  
      arc(xpos, ypos, 30, 30, PI, 2*PI, OPEN);
      fill(0);
      strokeWeight(4);
      point(xpos-4, ypos-4);
      point(xpos+4, ypos-4);
      line(xpos, ypos+2, xpos, ypos+8);     
  }
  
  //Moves alien across screen and reverses direction with boundary detection
  void move()
  {
    //First row
    if (rownumber == 1)
    { 
      if(xpos>=width-15)
      {
        //Multiply by -1 to reverse direction
        m1=m1*(-1);
      }
      
      if(xpos<15)
      {
        //Reverse
        m1=m1*(-1);
      }
      
      //Move
      xpos += m1;
    }
    
    //Second row
    if (rownumber == 2)
    {
      
      if(xpos>=width-15)
      {
        //Multiply by -1 to reverse direction
        m2=m2*(-1);
      }
      
      if(xpos<15)
      {
        //Reverse
        m2=m2*(-1);
      }
      
      //Move
      xpos += m2;
    }
    
    //Third row
    if (rownumber == 3 )
    {
      
      if(xpos>=width-15)
      {
        //Multiply by -1 to reverse direction
        m3=m3*(-1);
      }
      
      if(xpos<15)
      {
        //Reverse
        m3=m3*(-1);
      }
      
      //Move
      xpos += m3;
    }
  }
  
  //Method for killing alien
  void death()
  {
    //Sets boolean to false so that the alien will stop displaying
    is_alive = false;
  }

}

//Player class
class Player 
{
  int positionX, positionY;
  
  //Constuctor for class Player
  Player(int temp_x_Position,int temp_y_Position)
  {
    positionX = temp_x_Position;
    positionY = temp_y_Position;
  }
  
  //Method to make the player move
  void moveplayer()
  {
    
    //Left key pressed
    if (keyCode == LEFT) 
    {
      if(xPosition < 30)
      {
        //Do nothing as the player has hit a wall
      }
      else
      {
        //Move 5 places to the left
        xPosition -= 5;
      }
    }
    
    //Right key pressed
    if (keyCode == RIGHT)
    {
      if(xPosition > 570)
      {
        //Do nothing as the player has hit a wall
      }
      else
      {
        //Move 5 places to the right
        xPosition += 5;
      }
    }
    
  }
}

//Background object class
class Object 
{
  int xPos;
  int yPos;
  int speed;
  
  
  //Constructor for class Object
  Object(int tempxPos, int tempyPos, int tempSpeed) 
  {
    xPos = tempxPos;
    yPos = tempyPos;
    speed = tempSpeed;
    
  }
  
  //Method for displaying the object
  void displayObject()
  { 
    noStroke();
    rectMode(CORNER);  
    fill(0,random(255),0,200);
    rect(xPos,yPos,50,25); //Main body
    rect(xPos,yPos,10,35); //Left long block
    rect(xPos+50,yPos,10,35); //Right long block
    rect(xPos-5,yPos+7,10,15); //Left short block
    rect(xPos+55,yPos+7,10,15); //Right short block
    rect(xPos-10,yPos+15,5,20);  //Far Left thin block
    rect(xPos+65,yPos+15,5,20);  //Far right thin block
    rect(xPos+10,yPos-7,7,7);   //Left lower antenna 
    rect(xPos+40,yPos-7,7,7);   //Right lower antenna
    rect(xPos+3,yPos-14,7,7);   //Left upper antenna
    rect(xPos+47,yPos-14,7,7);   //Right upper antenna
    rect(xPos+10,yPos+35,13,5);  //Left mouth piece thingy
    rect(xPos+37,yPos+35,13,5);  //Right mouth piece thingy
    fill(0);
    rect(xPos+10,yPos+10,7,7);   //Left eye
    rect(xPos+40,yPos+10,7,7);   //Right Eye 
  }
 
  //Method for moving the object
  void moveObject() 
  {
   int i=0;
   i= i + speed; //The speed is set in the third number in the object (tempSpeed)
   xPos+=i;
   
   if(xPos >= 750)
   {
     xPos=-200;
   }
   
  }
  
  //Second object display
  void displayObject2()
  {
    fill(random(255),0,0,200);
    noStroke();
    rect(xPos,yPos, 80,7); //bottom long body bar
    rect(xPos+5,yPos-7, 70,7); //1+ bottom long body bar
    rect(xPos+10,yPos-14, 60,7); //2+ bottom body bar
    rect(xPos+25,yPos-21, 30,7); // top body bar
    rect(xPos+10,yPos+7, 15,7); // left lazer upper thingy, i dont know, i dont have the vocab
    rect(xPos+55,yPos+7, 15,7); // right lazer upper thingy, i dont know, i dont have the vocab
    rect(xPos+14,yPos+14, 7,7);  // left lazer lower thingy, i dont know, i dont have the vocab
    rect(xPos+59,yPos+14, 7,7);  // right lazer lower thingy, i dont know, i dont have the vocab
    fill(0);
    rect(xPos+15,yPos-7,7,7); //window 1
    rect(xPos+30,yPos-7,7,7); //window 2
    rect(xPos+45,yPos-7,7,7); //window 3
    rect(xPos+60,yPos-7,7,7); //window 4 
  }
  
  //Third object display
  void displayObject3()
  {
    fill(0,0,random(255),200);
    noStroke();
    rect(xPos,yPos, 60,15);  //main body
    rect(xPos+10,yPos-10, 40 ,10); //middle of body 
    rect(xPos+18,yPos-17, 25,7);  // bottom of imaginary tophat
    rect(xPos+25,yPos-24, 11,7);  //top of top hat
    rect(xPos+18,yPos+14, 7,7);   //dont even know what to call this left
    rect(xPos+36,yPos+14, 7,7);   //dont even know what to call this right
    rect(xPos+10,yPos+21, 40,7);  // second tenticle layer 
    rect(xPos,yPos+28, 60,7);  //third tenticle layer
    
    
    fill(0);
    rect(xPos+18,yPos, 7,7);  //left eye
    rect(xPos+36,yPos, 7,7);  //right eye
    rect(xPos+18,yPos+21, 7,7);  //left black pyramidy sort of tenticle thingy
    rect(xPos+36,yPos+21, 7,7);  //right black pyramidy sort of tenticle thingy
    rect(xPos+11,yPos+28, 7,7);  //left lower black pyramidy sort of tenticle thingy
    rect(xPos+43,yPos+28, 7,7);  //right lower black pyramidy sort of tenticle thingy
    rect(xPos+25,yPos+28, 11,7); //middle lower black pyramidy sort of tenticle thingy 
  }
  
  //Frankly the most important part of the program
  void daText()
  {
     textSize(48);
     fill(0, random(255),0,200);
     text("GROUP 23 BHAIS!!!", xPos, yPos); 
  }
  
  void moveObject2() //This moves the object
  {
   int i=0;
   
   i= i + speed; //The speed is set in the third number in the object (tempSpeed)
   yPos+=i;
   
   if(yPos >= 750)
   {
     yPos=-200;
   }
  }
   
  
}

//Method to call the various display and move sub-procedures for each object
void drawing()
{
  object.displayObject();
  object.moveObject();
  object2.displayObject2();
  object2.moveObject();
  object3.displayObject();
  object3.moveObject2();
  object4.displayObject();
  object4.moveObject(); 
  object5.daText();
  object5.moveObject();
  object6.displayObject3();
  object6.moveObject();
  object7.displayObject3();
  object7.moveObject2();
  
}

//Declares objects
void objectiful()
{
  object = new Object(-100, 300, 3);
  object2 = new Object(-100,100, 4);
  object3 = new Object(400,-100, 1);
  object4 = new Object(-100,520, 7); 
  object5 = new Object(-100,590, 5);
  object6 = new Object(-100,250, 8);
  object7 = new Object(200,-100, 5);
}
