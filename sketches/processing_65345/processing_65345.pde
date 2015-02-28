
float ball_x =300;

float  ball_forw_back = 1;

float  ball_y = 100;

float  ball_up_down = 1;

float ballsize = 20;

//These are the variables for the left bat
float  bat_x = 40;// left and right
float  bat_y = 70;// open down


float  bawith = 10; //is the large of both of the bat
float  bahight = 100;// is the long of both of the bat

//these are the variables for the right bat
float  rightbat_x = 580;// left and right
float  rightbat_y = 70;// open down




float  ballspeed=2;

int score_a=0;

String score_a_string= " ";


int score_b=0;

String score_b_string= " ";



// this the thing where you can put the draw of the background,nathing move here because the computer gone do once
void setup() {

  size (640, 500); // sets size of sketch w x h
  background (200, 20, 100);// RGB values
  smooth (); // takes the anti-aliasing off the lines to create a smooth effect
}


//the void draw the computer read over over again

void draw() {
  
  background (200, 20, 100);// RGB values

  stroke (33, 0, 0);//RGB values the color for the outside  
  strokeWeight (3);//the sight how fick the lane
  fill (245, 12, 0); // RGB values 
  
  rectMode(CENTER);

rect ( bat_x, bat_y, bawith, bahight); //first 2 numbers xy co-ordinates second 2 numbers size of rectangle


rect ( rightbat_x, rightbat_y, bawith, bahight);



  stroke (33, 0, 0);//RGB values
  strokeWeight (3);
  fill (245, 120, 0); // RGB values
  shapeMode(CENTER);

  ellipse ( ball_x, ball_y, ballsize, ballsize); //first 2 numbers xy co-ordinates second 2 numbers size of ellipse
  //  ball_x = ball_x + 1;


  if (ball_y > 240- ballsize/2) {
    ball_up_down = -1;
  }
  
//  if (ball_x == bat_x) {
//    ball_forw_back = ball_forw_back * -1;
//  }
//  
  if (ball_y < 0+ ballsize/2) {
    ball_up_down= 1;
  }


  ball_y = ball_y + ball_up_down * ballspeed;



//tests if the ball goes past the edge of the screen on the right
  if (ball_x > width - ballsize/2) { 
    ball_forw_back = -1;
    score_a = score_a + 1; //a score goes up by one
  }
  
  
   if (ball_x < 0 + ballsize/2) { //tests if the ball goes past the edge of the screen on the left
    ball_forw_back = 1;
    score_b = score_b + 1; //b score goes up by one
  }
  
  
//Test if the ball has hit the left bat
  if (ball_y   > bat_y   -    bahight /2 //tests if the ball is lower than the top of the bat
  && ball_y     <   bat_y   +    bahight /2 //tests if the ball ishigher than the bottom of the bat
  && ball_x  -  ballsize   /2   >=   bat_x   +    bawith/2
  && ball_x   -   ballsize/2    <=  bat_x  +   bawith/2   + ballspeed)
  {
   ball_forw_back = ball_forw_back *-1; 
   ballspeed=dist(ball_x,ball_y,bat_x,bat_y)/5;
   //if ball_forw_back is negative it sets it to positive, 
   //if it is positive it sets it to negative
  }
  
  //Test if the ball has hit the right bat
    if (ball_y   > bat_y   -    bahight /2 //tests if the ball is lower than the top of the bat
  && ball_y     <   bat_y   +    bahight /2 //tests if the ball ishigher than the bottom of the bat
  && ball_x  +  ballsize /2   <=   rightbat_x   -    bawith/2
  && ball_x +   ballsize/2    >=   rightbat_x  -   bawith/2   - ballspeed)
  {
   ball_forw_back = ball_forw_back *-1; 
   
   ballspeed=dist(ball_x,ball_y,rightbat_x,rightbat_y)/5;
   //if ball_forw_back is negative it sets it to positive, 
   //if it is positive it sets it to negative
  }
  
  
  
  
  //Score a
  score_a_string=""+score_a;
  
  PFont right_score;
  right_score=loadFont("Algerian-48.vlw");
  textFont(right_score);
  text(score_a_string,200,50,100,100);
  
  //score b
  
  score_b_string= "" +score_b;
  
  PFont left_score;
  left_score=loadFont("Algerian-48.vlw");
  textFont(left_score);
  text(score_b_string,400,50,100,100);


  ball_x = ball_x + ball_forw_back *ballspeed;




  if ( keyPressed) {
    
    if (key == 'o') {
        bat_y = constrain(bat_y-4,     0+bahight/2,      height -bahight/ 2   );
      }
      
      if (key == 't') {
        bat_y =constrain(bat_y+4,     0+bahight/2,    height-bahight/  2 );
      }
      
      if (key == 'a') {
        rightbat_y = constrain( rightbat_y -  4,     bahight  / 2,      height - bahight/ 2   );
      }
      
      if (key == 'b') {
        rightbat_y =constrain( rightbat_y+4,      bahight /  2,    height  -  bahight/  2 );
      }
      
    }
    
    
   
    
    
    
}


