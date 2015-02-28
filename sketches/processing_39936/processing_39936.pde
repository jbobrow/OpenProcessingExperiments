
float ball_x = 300;
float ball_y = 300;

float ball_x_direction = 1;
float ball_y_direction = 1;

float paddle1_y = 250;
float paddle2_y = 250;

int TeamUSA_score = 0;
int Voldemort_score = 0;

int final_score = 10;

void setup () {
  size(600, 600);

  noStroke();
  fill(255);
 
  PFont font;
  PFont fonts;
  font = loadFont ("AmericanTypewriter-30.vlw");
  fonts = loadFont ("AmericanTypewriter-14.vlw");
  textFont(font);
  textFont(fonts);
}


void draw() {

  background(0);

  // draw ball and paddles
  ellipse( ball_x, ball_y, 10, 10);

  rect(60, paddle1_y, 10, 50);
  rect(540, paddle2_y, 10, 50);

  // move paddles
  if ( keyPressed ) {
    if ( key == 'q' ) {
      paddle1_y = paddle1_y - 2;
    }
    if ( key == 'z' ) {
      paddle1_y = paddle1_y + 2;
    }
    if ( key == 'i' ) {
      paddle2_y = paddle2_y - 2;
    }
    if ( key == 'm' ) {
      paddle2_y = paddle2_y + 2;
    }
  }
    
    //Stop Paddles
     if(paddle1_y >= height-50){
      paddle1_y = height-50;
     }
     if(paddle1_y <=60){
       paddle1_y = 60;
     }
     if(paddle2_y >= height-50){
      paddle2_y = height-50;
     }
     if(paddle2_y <=60){
       paddle2_y = 60;
     }
  // check ceiling and floor collision  
  if ( ball_y <= 65 ) {
    ball_y_direction = 1;
  }
  if ( ball_y >= 595 ) {
    ball_y_direction = -1;
  }

  // check paddle collision
  if ( ball_y >= paddle1_y && ball_y <= paddle1_y + 50 && ball_x <= 70 ) {
    ball_x_direction = 1*1.1;
  }
  if ( ball_y >= paddle2_y && ball_y <= paddle2_y + 50 && ball_x >= 540 ) {
    ball_x_direction = -1*1.1;
  }
  //check wall collision
  //Right wall
  if ( ball_y >= 0 && ball_y <=600 && ball_x >=width+10) {
     ball_x = 300;
     ball_y = 300;
  }
  //left wall
  if ( ball_y >= 0 && ball_y <=600 && ball_x <=0-10) {
     ball_x = 300;
     ball_y = 300;
  }
  // update ball position
  ball_x = ball_x + ball_x_direction;
  ball_y = ball_y + ball_y_direction;

  
 //Scoreboard
 //Frame
 strokeCap(ROUND);
 stroke(255);
 line(5,5,width-5,5);
 line(width-5,5,width-5,60);
 line(width-5,60,5,60);
 line(5,60,5,5);
 //Directions
 textAlign(LEFT);
 textSize(14);
 text("(q-up z-down)",7,55);
 textAlign(RIGHT);
 text("(i-up m-down)",593,55);
 //Dunderball
 textAlign(CENTER);
 textSize(30);
 text("Dunder Ball" , width/2, 40);
 //Team USA
 textAlign(LEFT);
 textSize(14);
 text("Team USA",10,40);
 //Voldemort
 textAlign(RIGHT);
 textSize(14);
 text("Voldemort",width-10,40);
 //Score
 //Voldemort
 textSize(30);
 text(Voldemort_score, 500,40);
 if ( ball_y >= 60 && ball_y <=600 && ball_x <= -10) {
  Voldemort_score++;
  }
  //USA
 textSize(30);
 text(TeamUSA_score, 115,40);
 if ( ball_y >= 60 && ball_y <=600 && ball_x >=width+10) {
  TeamUSA_score++;
  }


//GAME OVER

if(TeamUSA_score == final_score) {
   background(0);
   textAlign(CENTER);
   textSize(30);
   text("Message from Team Voldemort", width/2, 200);
   textSize(14);
   text("Congratulations Team USA, but I want you listen to me,",
   width/2, 300); 
   text("friend, and I want you to listen to me good. I am going", width/2,325);
   text("to come at you, and I am going to come at you hard. I am",width/2,350);
   text("going to steal all of your clients, and then I am going",width/2,375);
   text("to kill them in front of you.",width/2,400);
   text("Press the Space Bar to play again", width/2,450);
   if(keyPressed){
     if(key == ' '){
   background(0);
     TeamUSA_score = 0;
     Voldemort_score = 0;
     ball_x_direction = 1;
     ball_y_direction = 1;
     ball_x = 300;
     ball_y = 300;
     }
   }
}

 if(Voldemort_score == final_score) {
   background(0);
   textAlign(CENTER);
   textSize(30);
   text("Message from Team USA", width/2, 200);
   textSize(14);
   text("You think this is some kind of game? No. This is a war.",
   width/2, 300); 
   text("I will not stop. I will not rest. You have no idea what", width/2,325);
   text("kind of enemy you've created. You have unleashed the wolf!",width/2,350);
   text("Press the Space Bar to play again",width/2,400);
   if(keyPressed){
     if(key == ' '){
     background(0);
     TeamUSA_score = 0;
     Voldemort_score = 0;
     ball_x_direction = 1;
     ball_y_direction = 1;
     ball_x = 300;
     ball_y = 300;
     }
   }
 }
}



