
/**
 * Bubbles Games 
 * Richard McCue (2010)
 */
 
//Bubbles Delclarations
int numBubbles = 8; // number of bubbles
int overlap = 100; //provides overlap from the canvas for more realism
float spring = 0.001;
float friction = -0.9;//the friction when bounched off an outside edge
float c = 40; //declares float c used in setting the colour of the bubbles
Bubble[] bubbles = new Bubble[numBubbles];//bubble array

// Image Declarations
PImage photo;// background image
PImage girl; // image of girl with bubble wand
int move;// used in image movement

//Game related declarations
int score = 0;  //tracks the viewers score
boolean gameStarted = false; //boolean to test if the opening screen has been viewed
boolean bubblePop = false; //boolean to start game 1, bubbles popping
boolean bubbleAvoid = false; //boolean to start game 2, bubble aviodance
char rating;

//Font Delarations
PFont fnt;
PFont fnt2;

//Timer Declarations
int starttime;//keeps a track of time
int delaytime = 60000; // delay in milliseconds - 1 minute
boolean timer = false; //used when game time is used
int time;

//Button Declarations
boolean rectOver = false; //boolean for first button
boolean rectOver2 = false; //boolean for second button
int rectWidth = 150;     // width of rectangles
int rectHeight = 80;     // eight of rectangles
int rect1X = 50; //position of first button
int rect1Y = 330;
int rect2X = 430;//position of second button
int rect2Y = 330;
    
void setup() //setup
{//start setup
  size(640, 480); //size of canvas
  noStroke(); //disables outline
  smooth(); //enhances line quality
  photo = loadImage("field.jpg");//prepares images for use
  girl = loadImage("blowing.png");
  move = -girl.width;
  image(photo,0,0);
  fnt = loadFont("fonta.vlw"); //loads fonts
  textFont(fnt,48);
  fnt2 = loadFont("fontb.vlw");
  textFont(fnt,48);
  for (int i = 0; i < numBubbles; i++) {//creates new bubbles on canvas
    bubbles[i] = new Bubble(random(0,480), random(0,680), random(120,150), i, bubbles);//sets positioning and size, random between preset parameters
  }//end for
}//end setup

void draw() //draw
{//start draw
   cursor(HAND);//changed cursor to hand for more realistic 'popping'
    if (gameStarted == false)//if a game has not yet started
     {//start if
       openingTitle ();//run opening title (the opening screen)
     }//end if
    else if (bubblePop == true) //else if bubblePop game has been selected (reffered to as game 1)
      {//start if
        game (); //start the game
        clockGame1();//start the timer
      }//end if
    else if (bubbleAvoid == true)//else if bubbleAvoid game has been selected (reffered to as game 2)
      {//start if
        game2 ();//start the game
        clockGame2(); //start the timer for game 2
      }//end if
       
}//end draw

void game()//the first game, bubble popping
{//start of game 1
  background(photo);//set the background image
  image(girl, move, 350);//creates the moving image of the girl in the bottom corner
  if(move < -10) move += 2; //stops movement after she appears on screen
  for (int i = 0; i < numBubbles; i++) {//for each bubble, give it the collide,
    bubbles[i].collision(); //display, POPPED and boundary attributes
    bubbles[i].screenEdges();
    bubbles[i].appearance();
    bubbles[i].popped();
  }//end for
     //top of screen display
    if (gameStarted == true){//if the game has started
      textAlign(LEFT);//allign text left
      stroke(0,0,0);
      textFont(fnt2, 20);//set font and colour
      fill(255,255,255);
      text("Score: "+ score,50,25);//display the score
      time = (starttime/1000) + 60 - (millis()/1000);//work out the time remaining by
      //taking the value of starttime, convert to seconds, add 60 then reduce by seconds as time ellapses
      text("Time Remaining: "+ time,400,25);//display the time remaining
    }//end if
     
}//end game 1

void game2()//the second game, bubble avoidance
{//start of game 2
  background(photo);//set the background image
  image(girl, move, 350);//creates the moving image of the girl in the bottom corner
  if(move < -10) move += 2; //stops movement after she apppears on screen
  for (int i = 0; i < numBubbles; i++) {//for each bubble, give it the collide,
    bubbles[i].collision(); //display, AVOID and boundary attributes
    bubbles[i].screenEdges();
    bubbles[i].appearance();
    bubbles[i].avoid();
  }//end for
   //top of screen display
   if (gameStarted == true){//if the game has started
     textAlign(LEFT);//allign text left
     stroke(0,0,0);
     textFont(fnt2, 20);//set font and colour
     fill(255,255,255);
     text("Score: "+ score,50,25);//display the score
     time = (starttime/1000) + 60 - (millis()/1000);//work out the time remaining by
     //taking the value of starttime, convert to seconds, add 60 then reduce by seconds as time ellapses
     text("Time Remaining: "+ time,400,25);//display the time remaining
    }//end if
}// end game 2

void clockGame1() {//the timer for game 1
 if (gameStarted == true && timer == false) {//if the game has started and the timer hasn't
   starttime = millis(); // start counting the time in milliseconds
   timer = true; // start the timer
 } //end if
 if (millis() - starttime >= delaytime) {//if the time is equal to the delaytime (the time allowed during the game)
   exitScreenGame1();//end the game and go to the exit screen for game 1
   numBubbles = 0; //stop the bubbles so the score can not continue increasing
 }//end if
}//end clockGame1

void clockGame2() {//the timer for game 2
 if (gameStarted == true && timer == false) {//if the game has started and the timer hasn't
   starttime = millis(); // start counting the time in milliseconds
   timer = true; // start the timer
 }//end if  
 if (millis() - starttime >= delaytime) {//if the time is up
   exitScreenGame2();//end the game and go to the exit screen for game 2
   numBubbles = 0;//stop the bubbles in the background
 }//end if 
}//end clockGame2

class Bubble {//class to define what a bubble is
  float x, y; //taken from the Processing 1.0.9 example CircleCollision and modified
  float diameter;//diameter for bubbles
  float vx = 2;//giving starting movemet
  float vy = 2;//startin movement
  int id;
  Bubble[] others;
  Bubble(float xin, float yin, float din, int idin, Bubble[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } //end of reference

  void collision()  {//collision detection and sets overall movement of bubbles
  //modified from the Processing 1.0.9 example CircleCollision
    for (int i = id + 1; i < numBubbles; i++) { // int 'i', the bubble number
      float ax = 0.2;
      float ay = 0.2;
      float dx = others[i].x - x;//distance between the 'ith' bubble and other bubbles
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);//the distance between 2 instances of bubbles
      if (distance < 100) { //if the distance between 2 bubbles meen the bubbles are colliding
        ax += (x - others[i].x) * spring; //reflect the angle
        ay += (y - others[i].y) * spring;
        vx -= ax;//change direction of the bubble
        vy -= ay;
        others[i].vx += ax;//change direction of the colliding bubble
        others[i].vy += ay;
      }//end if
    }//end for    
  }//end collision
  
  void screenEdges() {//sets the edges of the canvas and what to do when hit
    x += vx; // bubble movement
    y += vy;
    if (x + diameter/2 > width+overlap) {//sets right edge horizontal boundary
      x = width - diameter/2+overlap; //if the edge of the bubble touches the
      vx *= friction; // edge of the screen and overlap ajustment, bounce back losing some of the speed due to friction
    }//end if
    // calculation: if x plus diameter/2 (the edge of the bubble) goes past
    //the width of the canvas and the overlap, bounch it back, reduced by the rate of friction
    //overlap is used to provide a bit nore 'realism' as bubbles bouncing off an imaginary wall is wrong,
    //so the overlap lessens that effect. change value at the top to test
     if (x - diameter/2 <-overlap) {// sets left horizontal edge boundary
      x = diameter/2-overlap;
      vx *= friction;
    }//end if
     if (y + diameter/2 > height+overlap) {//sets bottom vertical edge boundary
      y = height - diameter/2+overlap;
      vy *= friction; 
    }//end if
     if (y - diameter/2 <-overlap) {//sets top vertical edge boundary
      y = diameter/2-overlap;
      vy *= friction;
    }//end if
  }//end screenEdges
  
  void appearance() {//sets the bubble's appearance i.e. colour
  //size and shape are defined earlier in the animation
    if (c >= 300){//if the value of is more than of equal to 300
      c = 40;//set the value to 40 (keeps within the 'hue' values range)
        } else {//else
          c = c+(vx/25);//takes the movement of the bubble divided by 25 and adds it to c
  }//end else
    colorMode(HSB, 300, 100, 100);//convert colour scheme to HSB so 'hue' can change the bubbles colour
    fill(c , 90, 96, 5);//sets the colour based on the bubbles movement to give the light reflection effect bubbles have
    ellipse(x, y, diameter, diameter);//a slight tint to the bubble body in keeping with bubbles
    stroke(color(c,90,96,100));//sets the colour to stroke and opague 
    strokeWeight(4);//4 pixels thick 
    ellipse(x, y, diameter, diameter);//around the edge of the bubble
    stroke(color(c,90,96,50));//makes the inner colour transparrant for a gradiated effect
    strokeWeight(4);//4 pixels thick inner edge 
    ellipse(x, y, diameter/1.03, diameter/1.03);//repeats the colour but futher inside the bubble
  }//end appearance
      
  void popped() {//what happens when bubbles are popped in game 1
    if(mousePressed && mouseX < x+diameter/2 && mouseX > x-diameter/2 && mouseY < y+diameter/2 && mouseY > y-diameter/2)//if the mouse is clicked inside the bubble
      {//places the bubble back at the start if touched by the mouse, creating a game like scenerio so the bubble 'pops'
      x = random(0,680);//and another is blown in its place in a random location 
      y = random(0,480);
      score ++;//add a point to the score
      print(score + " ");//test used to make sure the score system is working
    }//end if
  }//end popped

  void avoid() {//what happens when bubbles are touched in game 2
    if(mouseX < x+diameter/2 && mouseX > x-diameter/2 && mouseY < y+diameter/2 && mouseY > y-diameter/2)//if the cursor touches the bubble
      {//places the bubble back at the start if touched by the mouse, creating a game like scenerio so the bubble 'pops'
        x = random(0,680);//and another is blown in its place in a random location
        y = random(0,480);
        score ++;//add a point to the score
        print(score + " ");//test used to make sure the score system is working
      }//end if
  }//end avoid
}//end of bubble class
  
void keyPressed(){// responds to keys pressed
  if(key=='1' && gameStarted == false) //if '1' is pressed
    {//start if
       gameStarted = true;//leave entrance screen
       bubblePop = true;//start bubblePop game
    }//end if
       else if(key=='2' && gameStarted == false) //else if '2' is pressed
        {//start if
        gameStarted = true;//leave the entrance screen
        bubbleAvoid = true;//start the bubbleAvoid game
        }//end if
          else if(key=='q') // else if 'q' is pressed
            {//start if
            System.exit(0);//quit the animation
            }//end if
}//end keyPressed

void openingTitle()//load the opening page
{//start opening title
  background(0,0,0);//set the background to black
   textAlign(CENTER); //align text to the center
  stroke(0,0,0);//set colour, font and size
  fill(255,255,255);
  textFont(fnt, 48);
  text("Bubbles...",width/2,50);
  
  textAlign(CENTER);
  stroke(0,0,0);
  textFont(fnt2, 36);
  text("2 bubble games in 1!",width/2,100);
  
  textAlign(LEFT);
  stroke(0,0,0);
  textFont(fnt2, 24);
  text("Bubble Popping!",50,180);
    text("Bubble Avoidance!",400,180);
  
 textAlign(LEFT);
  stroke(0,0,0);
  textFont(fnt2, 20);
  text("Click on the bubbles to",50,230);
  text("pop as many as you can",50,260);
  text("in 60 Seconds",50,290);
              
  text("Avoid the bubbles to",400,230);
  text("prevent popping as many",400,260);
  text("as you can in 60 Seconds",400,290);
        
textAlign(CENTER);
  stroke(0,0,0);
  textFont(fnt2, 20);
  text("Type 'q' to quit at any time",width/2,450);
  
  if(rectOver && mousePressed) {//if the mouse is pressed over button one
    gameStarted = true;//stop the game screen
    bubblePop = true;//start the first game
    } else {//else
      fill(0);//black with white outline
      stroke(255);
      rect(rect1X, rect1Y, rectWidth, rectHeight); //drawing the left rectangle
      textAlign(LEFT);
      stroke(0,0,0);
      textFont(fnt2, 15);
      fill(255, 255, 255);
      text("Click here to start", 55, 360);
      text("Bubble Popping", 55, 380);  
    }//end else
  
   if ( overRect(rect1X, rect1Y, rectWidth, rectHeight) ) {//if the mouse is over the first button
    rectOver = true;//boolean is true
    } else {//if not
      rectOver = false;//boolean is false
    }//end boolean
    
   if(rectOver2 && mousePressed) {//if the mouse is pressed over the second button
    gameStarted = true;//exit the entrance screen
    bubbleAvoid = true;//start the second game
    } else {//if not
    fill(0);//black with white background
    stroke(255);
    rect(rect2X, rect2Y, rectWidth, rectHeight); //drawing the left rectangle
    textAlign(LEFT);
    stroke(0,0,0);
    textFont(fnt2, 15);
    fill(255, 255, 255);
    text("Click here to start", 435, 360);
    text("Bubble Avoidance!", 435, 380);  
  }//end else
  

  if ( overRect(rect2X, rect2Y, rectWidth, rectHeight) ) {//if the mouse is over the second rectangle
    rectOver2 = true;//boolean is true
    } else {//else
      rectOver2 = false;//its not true
    }//end else
}//end openingTitle 

boolean overRect(int x, int y, int width, int height) //boolean to test if over a rectangle
{//start boolean
  if (mouseX >= x && mouseX <= x+width && //if the mouse is within the rectangle
      mouseY >= y && mouseY <= y+height) {
       return true;//boolean is true
         } else {//else
         return false;//boolean is false
         }//end else
}//end boolean

void exitScreenGame1()//exit screen after playing game 1, bubble popping
  {
     background(0,0,0);//set background to black
     
     textAlign(CENTER);
      stroke(0,0,0);
      fill(255,255,255);
      textFont(fnt, 48);
      text("Game Over",width/2,100);
      
    textAlign(CENTER);
      stroke(0,0,0);
      textFont(fnt2, 36);
      text("Score: " + score,width/2,200);
      fill(255,255,255);;
      text("Rating: " + rating,width/2, 280);
      textFont(fnt2, 24);
      text("tip: focus on clicking overlapping bubbles close", width/2, 375);
      text(" to your mouse for maximum points in minimum time", width/2, 400);
  
    if (score >= 250) {//if the score is more than 250
      rating = 'A';//grade a
       } else if (score >= 200) {//more than 200
       rating = 'B';//grade b
        } else if (score >= 150) {//more than 150
        rating = 'C';//grade c
          } else if (score >= 100) {//more than 100
          rating = 'D';//grade d
            } else {//anything less than 100
            rating = 'F';//fail
            }
}//End exitScreenGame1

void exitScreenGame2()//start of exit screen after game 2, bubble avoidance
  {
     background(0,0,0);//set background black
      textAlign(CENTER);
        stroke(0,0,0);
        fill(255,255,255);
        textFont(fnt, 48);
        text("Game Over",width/2,100);
      textAlign(CENTER);
        stroke(0,0,0);
        textFont(fnt2, 36);
        text("Score: " + score,width/2,200);
        fill(255,255,255);;
        text("Rating: " + rating,width/2, 280);
        textFont(fnt2, 20);
        text("tip: don't try to cheat by taking your mouse off the page,", width/2, 375);
        text("the last place it was on the page is stored and acts like the mouse,", width/2, 400);
        text("causing more harm than good!", width/2, 425);
        
      if (score <= 10) {//if score is less than 10
        rating = 'A';//grade a
          } else if (score <= 30) {//less than 30
            rating = 'B';//grade b
            } else if (score <= 60) {//less than 60
              rating = 'C';//grade c
              } else if (score <= 100) {//less than 100
                rating = 'D';//grade d
                } else {//more than 100
                  rating = 'F';//fail
                  }
}//End endScreenGame2 

 

