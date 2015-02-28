
int score; //Initialise score
int ballSize = 25; //Set ball size
  boolean attack = false; //
  
 int gameOver = 0; //Initialise gameOver varible
  
   int RandomX() //declares varible 
   
 {
    return int(random(600));
  }
   
  int[] ballx = { RandomX(), RandomX(), RandomX(), RandomX(), RandomX() }; //sets random spawn points for balls along the x axis
  int[] bally = { 0, 0, 0, 0, 0 };// tells the balls to spawn at the top of the screen
   
  void setup() //setup() does not return a value
  {
     
   size (700, 500); //sets the size of the area
    smooth (); // draws areas smoothly
     
  }
   
  void draw()
  {
 
   
//Draw Background    
size(700,500); // sets the size of the background
background(0,0,255); // sets the colour of the background
 
//Draw Oso 
   stroke(255) ; // This white stroke allows the white indevidual shapes to appear as one shape.
  fill(255) ; // Fill for the ellipse, rectangle and triangle listed below.
  ellipse(mouseX, mouseY, 100, 100) ; // White ellipse which creates the shape of OSO's head & location from mouse
   rect(mouseX-10, mouseY+40, 20, 100) ; // White rectangle which forms OSO's neck & location from mouse
   triangle(mouseX, mouseY+100, mouseX-50, mouseY+170, mouseX+50, mouseY+170) ; // Triangle shape created to form the body of OSO & location from mouse
   fill(150) ; // This fill makes the following ellipses appear a mild grey colour.
  ellipse(mouseX-30, mouseY+170, 45, 30) ; // This grey ellipse is OSO's left foot with a white stroke & location from mouse
  ellipse(mouseX+30, mouseY+170, 45, 30) ; // This grey ellipse is OSO's right foot with a white stroke & location from mouse.
  ellipse(mouseX-15, mouseY+130, 25, 18) ; // This grey ellipse is OSO's left hand with a white stroke & location from mouse
  ellipse(mouseX+15, mouseY+130, 25, 18) ; // This grey ellipse is OSO's right hand with a white stroke & location from mouse
  fill(0, 200, 250) ; // This aqua colour fills the following ellipses for OSO's eyes 
  ellipse(mouseX-20, mouseY, 30, 50) ; // This ellipse creates OSO's left iris for the left eye & location from mouse
  ellipse(mouseX+20, mouseY, 30, 50) ; // This ellipse creates OSO's right iris for the right eye & location from mouse
  fill(0) ; // This black fill is the colour used for OSO's pupils within his eyes.
  ellipse(mouseX-20, mouseY, 18, 38) ; // This black ellipse is for the pupil of OSO's left eye & location from mouse
  ellipse(mouseX+20, mouseY, 18, 38) ; // This black ellipse is for the pupil of OSO's right eye & location from mouse
  fill(255) ; // White fill for the glimmer effect on OSO's eyes.  
  ellipse(mouseX-25, mouseY-10, 10, 10) ; // White ellipse for the inside of the eye & location from mouse
  ellipse(mouseX+15, mouseY-10, 10, 10) ; // White ellipse for the inside of the eye & location from mouse
  ellipse(mouseX-13, mouseY+11, 5, 5) ; // White ellipse for the inside of the eye & location from mouse
  ellipse(mouseX+27, mouseY+11, 5, 5) ; // White ellipse for the inside of the eye & location from mouse
  fill(0);// Black fill for the mouth
   ellipse(mouseX, mouseY+30, 15, 15); // Black ellipse for mouth & location from mouse
 
    // display score
    fill(255); // colour of text
    text(score, 20,20); // what the text will display and where it will be located
    if(attack)
    {
      oso(mouseX); //controls where oso attacks with the mouse
      attack = false; // the attack is set to false 
    }
   
     ballFalling();
     gameFinish(); 
  }
  
  
  
  void mousePressed()
  {
    attack = true; // oso will attack where the mouse is located when the mouse is pressed
  }
   
  void ballFalling() // makes ball disappear when mouse is over ball and mouse is pressed.
  { 
    stroke(39, 154, 240);// 
    fill (255, 0, 0); //colour of ball
     
    for (int i=0; i<5; i++)
    {
      ellipse(ballx[i], bally[i]++, ballSize, ballSize);
    }
  }
    
 void oso(int shotX)
  {
    boolean strike = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
        strike = true;
        line(mouseX, 565, mouseX, bally[i]);
        ellipse(ballx[i], bally[i],
                ballSize+25, ballSize+25);
        ballx[i] = RandomX();
        bally[i] = 0;
 
 

        score++;
      }   
    }
   
    if(strike == false)
    {
      line(mouseX, 565, mouseX, 0);
    } 
   
  }
   
   
  void gameFinish()
  {
    for (int i=0; i< 5; i++)
    {
      if(bally[i]==530) // game over if ball makes it past the bottom of the screen
      {
 
     
        fill(color(200,0,100)); //Colour of text
     fill(200, 0, 100);// Colour of text
    textAlign(CENTER); //Alignment on text
    text("GAME OVER!!", width/2, height/3);// Position of text
    text(" Score  "+ score, width/2, height/3 + 50); //Position of text
       
     noLoop();
 
   
       }
      }
    }


