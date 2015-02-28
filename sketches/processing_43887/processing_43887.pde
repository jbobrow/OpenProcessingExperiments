
//instance variables
Ball ball;
Paddle lpaddle;
Paddle rpaddle;
int userScore = 0;
int computerScore = 0;
PFont font;
int time;
int level = 125;
int levelcount = 1;

//instance variables

void setup()
{
  size(600, 600); // 600 pixels by 600 pixels
  background(0, 0, 0); // 0 = black background
  smooth();
  strokeWeight(4); //thickness of line
  strokeJoin(ROUND); //tip of rect rounded
  colorMode(RGB, width); //setting the color mode
  fill(0); //black fill
  ball = new Ball(10, 300, 5); //creating new ball
  lpaddle = new Paddle (10, 240, 10, 1); //creating left paddle line
  rpaddle = new Paddle (580, 240, 10, 0); //creating right paddle line
  frameRate(60); //the speed the program runs at
  font = loadFont("OCRAExtended-32.vlw"); //loads font into program
  time = 0;
}


void draw() {

  background(0, 0, 0); //background set to black
  time=time+1;

  if (time<100) {
    textFont(font, 25);
    textAlign(CENTER);
    fill(166, 3, 250);
    text("3", 300, 300);
  }

  if ((time<200) &&(time>100)) {
    textFont(font, 25);
    textAlign(CENTER);
    fill(166, 3, 250);
    text("2", 300, 300);
  }

  if ((time<300)&&(time>200)) {
    textFont(font, 25);
    textAlign(CENTER);
    fill(166, 3, 250);
    text("1", 300, 300);
  }


  if ( time >= 300) { 
    background(0);
    ball.disp();
    lpaddle.disp();
    rpaddle.disp();
    fill(255);
    line(0, 300, 600, 300);
    textFont(font, 20);
    textAlign(CENTER);
    fill(166, 3, 250);
    text("computer Score - " + computerScore + " : " + userScore + " - User Score", 300, 100);
    text("Level - " + levelcount , 300, 120);
    
    int timer = second(); //intialising timer

    text ("Timer : " + timer + "Seconds", 300, 25);
    loop();
  }
}




//Creation of class ball
class Ball {
  //intialising variables
  int x;
  int y;
  int speed;
  int i;
  int j;
  int win = 0;
  int lose = 0;
  //int player1score;
  //int player2score;




  //constructor for the class Ball
  Ball(int setx, int sety, int setspeed) {
    x = setx;
    y = sety;
    speed = setspeed;
    j = speed;
    i = int(random(1, speed));
    lose = 0;
  }

  //method to set what is displayed on screen
  void disp() {
    noStroke();
    fill(0); 
    rect(0, 0, width, height); 


    fill(245, 3, 250); //pink fill
    ellipse(x, y, 25, 25); //ellipse for pong ball


    if (win == 0) {
      if (x<=40 &&( y > lpaddle.getpos() && y < (lpaddle.getpos() + 100))) {
        //if x is less than or equal to 40 and y is greater than postion of left paddle and left paddle +100
        // less than y.
        //j=speed;
        //j will equal speed
        j= speed + int(random(0, 3));
      }

      else if (x<=40 &&( y < lpaddle.getpos() || y > (lpaddle.getpos() + 100))) {
        // although if x is less than or equal to 40 and position of left paddle is greater than y
        // OR y is greater than position of left paddle +100
        j=0;
        i=0;
        win = 1;
        userScore++;
        if(userScore == 10){
          levelcount ++;
        level-=2;}
        
        if (userScore != 10){
          
          setup();}
             

        //THEN j and i will be set to 0 and 1 will be added to player 1's score
      } 
      if (x>=560 &&( y > rpaddle.getpos() && y < (rpaddle.getpos() + 100))) {
        //If x is greater than or equal to 560 and y is greater than right paddle postion
        // AND right paddle position + 100 is less than y
        j=(speed + int(random(0, 3)))*-1;
        //Then J will be set to speed times negative 1
      }

      else if (x>=560 &&( y < rpaddle.getpos() || y > (rpaddle.getpos() + 100))) {
        //If x is greater than or equal to 560 AND right paddle position is less than y
        // OR y is greater than right paddle + 100
        j=0;
        i=0;
        win = 1;
        computerScore++;
       
       
        if (computerScore != 10){
        setup();}
       
        //THEN j and i is set to 0 then 1 is added to player 2's score
      }

      if (y<=40) {
        i=speed;
      }
      if ( y>=560) {
        i=(speed)* -1;
      } 
      x=(x+j);
      y=(y+i);
     
        
    }
  }
}

  //creation of class paddle 
  class Paddle {
    //intialising variables
    int x;
    int y;
    int speed;
    int isleft;
    

    // Constructor for the class paddle
    Paddle(int setx, int sety, int setspeed, int l) {

      x = setx;
      y = sety;
      speed = setspeed;
      isleft = l;
      
      
    }

    //Method to get position of ball
    public int getpos() {
      return y;
    }

    void disp() {
      fill(250, 18, 223); //fill is pink for the paddle
      rect(x, y, 10, 100);

      if (isleft == 0) {
        //if isleft equals 0
        if (keyPressed == true) {
          // then the keypressed will equal true
          if  (keyCode == UP && y>0) {
            // if keycode pressed equals up button and y is greater than 0
            y-= speed;
            // then y = y - speed
          }
          if (keyCode == DOWN && y<500) {
            // if keycode pressed equals down button and y is less than 50
            y+= speed;
            // then y= y + speed
          }
        }
      }

      if (isleft == 1) {
        // if isleft equals 1
        // if (keyPressed == true) {
        //Then keyPressed will be true
        if ((y>ball.y -50 + int(random(0, level))) && y>0) {
          // if key equals "w" or "W" and y is greater than 0
          y-= speed;
          // then y = y - speed
        }
        if ((y<ball.y - 50 - int(random(0, level))) && y<500) {
          // if key equals "s" or "S" and y is less than 500
          y+= speed;
          //then y = y + speed
        }
      }
    

      if (userScore == 10 )
        //if player 1 score is greater than 100
      {

        fill(0);
        rect(0, 0, width, height);
        textFont(font, 20); 
        textAlign(CENTER); //Center aligned
        fill(250, 5, 42); // random color change everytime message is displayed
       text("Congrats you won =D press x to play next level!", 300, 300);
        text("Press z to exit", 300, 340);
        noLoop(); //not repeated
        
        
      }
      //OR
      else if (computerScore ==10 ){
        //if player 2 score is greater than 100
      

        fill(0);
        rect(0, 0, width, height);
        textFont(font, 20);
        textAlign(CENTER);
        fill(250, 5, 42);
        text("Sorry you lose D=  press x to play again!", 300, 300);
        text("Press z to exit", 300, 320);
        noLoop();
        levelcount = 0;
        
      }
      if (keyPressed) {
        if ( key == 'x' || key == 'X') {
          setup();
          int win = 0;
          int level = 125;
          computerScore = 0;
          userScore = 0;
          int timer = second();
        }
        
        if ( key == 'z' || key == 'Z') {
            exit();
          }

       
          
        }
      }
    }
  



