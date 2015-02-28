
/*
/ Project name: The like game
 /
 / Creators: Ludvig Malmros, Michaela Schmied
 / Date: 2013-04-24
 /
 /
 /
 / What does the program do?:
 / It is a game where you collect likes and avoid getting hit by dislikes
 /
 /
 */


//Image of the objects
PImage like;
PImage dislike;
//Image player
PImage Ludvig;
PImage Michaela;

//Background
PImage play_background;

//restart button variables
int restart_button_x = 500;
int restart_button_y = 280;
int restart_button_width = 100;
int restart_button_height = 40;



//variables player
int player_x = 40;//start value
int player_y = 300;//start value
int player_width = 40;
int player_height= 40;

//variables objects
//for the randoms
int speed_random_high = 6;//upper speed limit
int speed_random_low = 2;//lower speed limit
int random_y_pos_low =70;
int random_y_pos_high =375;

//dislike objects size
int dislike_object_width = 113;
int dislike_object_height = 37;
//like objects size
int like_object_width=113;
int like_object_height=37;


//The dislike objects
//position and speed object one, start value
int dislike_object_x=700;
int dislike_object_y=280;
int dislike_object_speed=3;
//position and speed object 2, start value
int dislike_object_x2=700;
int dislike_object_y2=350;
int dislike_object_speed2=3;
//position and speed object 3, start value
int dislike_object_x3=700;
int dislike_object_y3=380;
int dislike_object_speed3=3;
//position and speed object 4, start value
int dislike_object_x4=700;
int dislike_object_y4=380;
int dislike_object_speed4=3;
//position and speed object 5, start value
int dislike_object_x5=700;
int dislike_object_y5=380;
int dislike_object_speed5=3;
//position and speed object 6, start value
int dislike_object_x6=700;
int dislike_object_y6=380;
int dislike_object_speed6=3;
//position and speed object 7, start value
int dislike_object_x7=700;
int dislike_object_y7=380;
int dislike_object_speed7=3;
//position and speed object 8, start value
int dislike_object_x8=700;
int dislike_object_y8=380;
int dislike_object_speed8=3;
//position and speed object 9, start value
int dislike_object_x9=700;
int dislike_object_y9=380;
int dislike_object_speed9=3;



//The like objects
//position and speed like_object one, start value
int like_object_x = width+like_object_width;
int like_object_y = 100;
int like_object_speed = 3;
//position and speed like_object 2, start value
int like_object_x2 = width+like_object_width;
int like_object_y2 = 150;
int like_object_speed2 = 3;
//position and speed like_object 3, start value
int like_object_x3 = width+like_object_width;
int like_object_y3 = 200;
int like_object_speed3 = 3;
//position and speed like_object 4, start value
int like_object_x4 = width+like_object_width;
int like_object_y4 = 200;
int like_object_speed4 = 3;
//position and speed like_object 5, start value
int like_object_x5 = width+like_object_width;
int like_object_y5 = 200;
int like_object_speed5 = 3;
//position and speed like_object 6, start value
int like_object_x6 = width+like_object_width;
int like_object_y6 = 200;
int like_object_speed6 = 3;
//position and speed like_object 7, start value
int like_object_x7 = width+like_object_width;
int like_object_y7 = 200;
int like_object_speed7 = 3;
//position and speed like_object 8, start value
int like_object_x8 = width+like_object_width;
int like_object_y8 = 200;
int like_object_speed8 = 3;
//position and speed like_object 9, start value
int like_object_x9 = width+like_object_width;
int like_object_y9 = 200;
int like_object_speed9 = 3;


//variables hit count
int dislike_hit_count = 0;
int like_hit_count = 0;

//variables for choosing player
boolean choose_Ludvig = false;
boolean choose_Michaela = false;
int Michaela_x = 400;
int Michaela_y =200;
int Ludvig_x = 600;
int Ludvig_y = 200;
int player_start_screen_width=100;
int player_start_screen_height=100;


boolean start_screen = true;



void setup() {



  //Loads the object/like/dislike and player images
  like = loadImage("like.png");
  dislike = loadImage("dislike.png");
  
  Ludvig = loadImage("Ludvig.png");
  Michaela = loadImage("Michaela.png");
  play_background = loadImage("FB_Bakgrund.jpg");
  imageMode(CENTER);
  

  //Gives the playing field its size
  size(1000, 400);
  //Rectangles are drawn from their center
  rectMode(CENTER);
  textMode(CENTER);
}

void draw() {

 // background(play_background);
  background(255);




  if (choose_Michaela==true) {
    //Draws the player(Michaela), the photo
    fill(255);
    image(Michaela, player_x, player_y, player_width, player_height);
  }

  if (choose_Ludvig==true) {
    //Draws the player(Ludvig), the photo
    fill(255);
    image(Ludvig, player_x, player_y, player_width, player_height);
  }

  //Reads accelerometer data that comes from the accelerometer on the Arduino that is connceted to the computer and gives
  //the value to the players y position
  //if(servo_on==false){

  //player_y =int( map(player_y_read,98,124,0,400));//for accelerometer, if you point
  //player_y =int( map(player_y_read,98,148,0,400));//for facebook hand accelerometer
  //player_y =int( map(player_y_read,0,255,0,600));//for potentiometer
  //player_y=player_y_read;//for calebration
  player_y = mouseY;

//keeps player within the playing field
if(player_y>375){
player_y=375;
}
if(player_y<25){
player_y=25;
}



  println(player_y);//for calibration
  //}



 
  flying_objects();//activates the "attacking" likes/dislikes
when_hit();//activates behavior of what happens when the player gets hit by likes/dislikes



  //counters
  fill(0);
  textSize(25);
  text("Dislikes:", width/3*2 - 130, 35);
  text(dislike_hit_count, width/3*2, 35);
  text("Likes:", width/3 - 100, 35 );
  text(like_hit_count, width/3, 35 );

  game_over();//activates game over

//start screen
    if (start_screen==true) {
    //background(play_background);
    background(255);
    textSize(40);
    text("Choose player", width/2-130, 100);
    image(Michaela, Michaela_x, Michaela_y, player_start_screen_width, player_start_screen_height); 
    image(Ludvig, Ludvig_x, Ludvig_y, player_start_screen_width, player_start_screen_height);
    //check void mouseClicked for choosing the player
  }
}



void flying_objects() {



  //dislike 1
  image(dislike, dislike_object_x, dislike_object_y, dislike_object_width, dislike_object_height);
  dislike_object_x = dislike_object_x - dislike_object_speed;
  if (dislike_object_x <= -dislike_object_width) {
    dislike_object_x = width + dislike_object_width;
    dislike_object_y = int(random(25, 375));//gives random position
    dislike_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //dislike 2
  image(dislike, dislike_object_x2, dislike_object_y2, dislike_object_width, dislike_object_height);
  dislike_object_x2 = dislike_object_x2 - dislike_object_speed2;
  if (dislike_object_x2 <= -dislike_object_width) {
    dislike_object_x2 = width + dislike_object_width;
    dislike_object_y2 = int(random(25, 375));//gives random position
    dislike_object_speed2 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //dislike 3
  image(dislike, dislike_object_x3, dislike_object_y3, dislike_object_width, dislike_object_height);
  dislike_object_x3 = dislike_object_x3 - dislike_object_speed3;
  if (dislike_object_x3 <= -dislike_object_width) {
    dislike_object_x3 = width + dislike_object_width;
    dislike_object_y3 = int(random(25, 375));//gives random position
    dislike_object_speed3 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  
  if(like_hit_count>10){//increase the number of objects aka difficulty
   //dislike 4
  image(dislike, dislike_object_x4, dislike_object_y4, dislike_object_width, dislike_object_height);
  dislike_object_x4 = dislike_object_x4 - dislike_object_speed4;
  if (dislike_object_x4 <= -dislike_object_width) {
    dislike_object_x4 = width + dislike_object_width;
    dislike_object_y4 = int(random(25, 375));//gives random position
    dislike_object_speed4 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //dislike 5
  image(dislike, dislike_object_x5, dislike_object_y5, dislike_object_width, dislike_object_height);
  dislike_object_x5 = dislike_object_x5 - dislike_object_speed5;
  if (dislike_object_x5 <= -dislike_object_width) {
    dislike_object_x5 = width + dislike_object_width;
    dislike_object_y5 = int(random(25, 375));//gives random position
    dislike_object_speed5 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //dislike 6
  image(dislike, dislike_object_x6, dislike_object_y6, dislike_object_width, dislike_object_height);
  dislike_object_x6 = dislike_object_x6 - dislike_object_speed6;
  if (dislike_object_x6 <= -dislike_object_width) {
    dislike_object_x6 = width + dislike_object_width;
    dislike_object_y6 = int(random(25, 375));//gives random position
    dislike_object_speed6 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  }
  if(like_hit_count>25){
  //dislike 7
  image(dislike, dislike_object_x7, dislike_object_y7, dislike_object_width, dislike_object_height);
  dislike_object_x7 = dislike_object_x7 - dislike_object_speed7;
  if (dislike_object_x7 <= -dislike_object_width) {
    dislike_object_x7 = width + dislike_object_width;
    dislike_object_y7 = int(random(25, 375));//gives random position
    dislike_object_speed7 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //dislike 8
  image(dislike, dislike_object_x8, dislike_object_y8, dislike_object_width, dislike_object_height);
  dislike_object_x8 = dislike_object_x8 - dislike_object_speed8;
  if (dislike_object_x8 <= -dislike_object_width) {
    dislike_object_x8 = width + dislike_object_width;
    dislike_object_y8 = int(random(25, 375));//gives random position
    dislike_object_speed8 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //dislike 9
  image(dislike, dislike_object_x9, dislike_object_y9, dislike_object_width, dislike_object_height);
  dislike_object_x9 = dislike_object_x9 - dislike_object_speed9;
  if (dislike_object_x9 <= -dislike_object_width) {
    dislike_object_x9 = width + dislike_object_width;
    dislike_object_y9 = int(random(25, 375));//gives random position
    dislike_object_speed9 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  }
  
  

  //like 1
  image(like, like_object_x, like_object_y, like_object_width, like_object_height);
  like_object_x = like_object_x - like_object_speed;
  if (like_object_x <= -like_object_width) {
    like_object_x = width + like_object_width;
    like_object_y = int(random(25, 375));//gives random position
    like_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }

  //like 2
  image(like, like_object_x2, like_object_y2, like_object_width, like_object_height);
  like_object_x2 = like_object_x2 - like_object_speed2;
  if (like_object_x2 <= -like_object_width) {
    like_object_x2 = width + like_object_width;
    like_object_y2 = int(random(25, 375));//gives random position
    like_object_speed2 = int(random(speed_random_low, speed_random_high));//gives random speed
  }


  //like 3
  image(like, like_object_x3, like_object_y3, like_object_width, like_object_height);
  like_object_x3 = like_object_x3 - like_object_speed3;
  if (like_object_x3 <= -like_object_width) {
    like_object_x3 = width + like_object_width;
    like_object_y3 = int(random(25, 375));//gives random position
    like_object_speed3 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  
  if(like_hit_count>10){//increase the number of objects aka difficulty
   //like 4
  image(like, like_object_x4, like_object_y4, like_object_width, like_object_height);
  like_object_x4 = like_object_x4 - like_object_speed3;
  if (like_object_x4 <= -like_object_width) {
    like_object_x4 = width + like_object_width;
    like_object_y4 = int(random(25, 375));//gives random position
    like_object_speed4 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like 5
  image(like, like_object_x5, like_object_y5, like_object_width, like_object_height);
  like_object_x5 = like_object_x5 - like_object_speed5;
  if (like_object_x5 <= -like_object_width) {
    like_object_x5 = width + like_object_width;
    like_object_y5 = int(random(25, 375));//gives random position
    like_object_speed5 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like 6
  image(like, like_object_x6, like_object_y6, like_object_width, like_object_height);
  like_object_x6 = like_object_x6 - like_object_speed6;
  if (like_object_x6 <= -like_object_width) {
    like_object_x6 = width + like_object_width;
    like_object_y6 = int(random(25, 375));//gives random position
    like_object_speed6 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
}
if(like_hit_count>25){
 //like 7
  image(like, like_object_x7, like_object_y7, like_object_width, like_object_height);
  like_object_x7 = like_object_x7 - like_object_speed7;
  if (like_object_x7 <= -like_object_width) {
    like_object_x7 = width + like_object_width;
    like_object_y7 = int(random(25, 375));//gives random position
    like_object_speed7 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like 8
  image(like, like_object_x8, like_object_y8, like_object_width, like_object_height);
  like_object_x8 = like_object_x8 - like_object_speed8;
  if (like_object_x8 <= -like_object_width) {
    like_object_x8 = width + like_object_width;
    like_object_y8 = int(random(25, 375));//gives random position
    like_object_speed8 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like 9
  image(like, like_object_x9, like_object_y9, like_object_width, like_object_height);
  like_object_x9 = like_object_x9 - like_object_speed9;
  if (like_object_x9 <= -like_object_width) {
    like_object_x9 = width + like_object_width;
    like_object_y9 = int(random(25, 375));//gives random position
    like_object_speed9 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
}
}


void when_hit() {

  //dislike hit
  //dislike hit one
  if (player_y >= dislike_object_y - dislike_object_height/2 && player_y <= dislike_object_y + dislike_object_height/2 && player_x <= dislike_object_x + dislike_object_width/2 && player_x >= dislike_object_x - dislike_object_width/2 ) {
    println("CRAZY");
    dislike_hit_count = dislike_hit_count+1;
    dislike_object_x = width + dislike_object_width;//when a dislike is hit the like jumps back to starting position
    dislike_object_y = int(random(25, 375));//gives random position
    dislike_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }

  //dislike hit 2
  if (player_y >= dislike_object_y2 - dislike_object_height/2 && player_y <= dislike_object_y2 + dislike_object_height/2 && player_x <= dislike_object_x2 + dislike_object_width/2 && player_x >= dislike_object_x2 - dislike_object_width/2 ) {
    println("CRAZY");
    dislike_hit_count = dislike_hit_count+1;
    dislike_object_x2 = width + dislike_object_width;//when a dislike is hit the like jumps back to starting position
    dislike_object_y2 = int(random(25, 375));//gives random position
    dislike_object_speed2 = int(random(speed_random_low, speed_random_high));//gives random speed
  }

  //dislike hit 3
  if (player_y >= dislike_object_y3 - dislike_object_height/2 && player_y <= dislike_object_y3 + dislike_object_height/2 && player_x <= dislike_object_x3 + dislike_object_width/2 && player_x >= dislike_object_x3 - dislike_object_width/2 ) {
    println("CRAZY");
    dislike_hit_count = dislike_hit_count+1;
    dislike_object_x3 = width + dislike_object_width;//when a dislike is hit the like jumps back to starting position
    dislike_object_y3 = int(random(25, 375));//gives random position
    dislike_object_speed3 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
    //dislike hit 4
  if (player_y >= dislike_object_y4 - dislike_object_height/2 && player_y <= dislike_object_y4 + dislike_object_height/2 && player_x <= dislike_object_x4 + dislike_object_width/2 && player_x >= dislike_object_x4 - dislike_object_width/2 ) {
    println("CRAZY");
    dislike_hit_count = dislike_hit_count+1;
    dislike_object_x4 = width + dislike_object_width;//when a dislike is hit the like jumps back to starting position
    dislike_object_y4 = int(random(25, 375));//gives random position
    dislike_object_speed4 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
    //dislike hit 5
  if (player_y >= dislike_object_y5 - dislike_object_height/2 && player_y <= dislike_object_y5 + dislike_object_height/2 && player_x <= dislike_object_x5 + dislike_object_width/2 && player_x >= dislike_object_x5 - dislike_object_width/2 ) {
    println("CRAZY");
    dislike_hit_count = dislike_hit_count+1;
    dislike_object_x5 = width + dislike_object_width;//when a dislike is hit the like jumps back to starting position
    dislike_object_y5 = int(random(25, 375));//gives random position
    dislike_object_speed5 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
    //dislike hit 6
  if (player_y >= dislike_object_y6 - dislike_object_height/2 && player_y <= dislike_object_y6 + dislike_object_height/2 && player_x <= dislike_object_x6 + dislike_object_width/2 && player_x >= dislike_object_x6 - dislike_object_width/2 ) {
    println("CRAZY");
    dislike_hit_count = dislike_hit_count+1;
    dislike_object_x6 = width + dislike_object_width;//when a dislike is hit the like jumps back to starting position
    dislike_object_y6 = int(random(25, 375));//gives random position
    dislike_object_speed6 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
      //dislike hit 7
  if (player_y >= dislike_object_y7 - dislike_object_height/2 && player_y <= dislike_object_y7 + dislike_object_height/2 && player_x <= dislike_object_x7 + dislike_object_width/2 && player_x >= dislike_object_x7 - dislike_object_width/2 ) {
    println("CRAZY");
    dislike_hit_count = dislike_hit_count+1;
    dislike_object_x7 = width + dislike_object_width;//when a dislike is hit the like jumps back to starting position
    dislike_object_y7 = int(random(25, 375));//gives random position
    dislike_object_speed7 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
      //dislike hit 8
  if (player_y >= dislike_object_y8 - dislike_object_height/2 && player_y <= dislike_object_y8 + dislike_object_height/2 && player_x <= dislike_object_x8 + dislike_object_width/2 && player_x >= dislike_object_x8 - dislike_object_width/2 ) {
    println("CRAZY");
    dislike_hit_count = dislike_hit_count+1;
    dislike_object_x8 = width + dislike_object_width;//when a dislike is hit the like jumps back to starting position
    dislike_object_y8 = int(random(25, 375));//gives random position
    dislike_object_speed8 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
      //dislike hit 9
  if (player_y >= dislike_object_y9 - dislike_object_height/2 && player_y <= dislike_object_y9 + dislike_object_height/2 && player_x <= dislike_object_x9 + dislike_object_width/2 && player_x >= dislike_object_x9 - dislike_object_width/2 ) {
    println("CRAZY");
    dislike_hit_count = dislike_hit_count+1;
    dislike_object_x9 = width + dislike_object_width;//when a dislike is hit the like jumps back to starting position
    dislike_object_y9 = int(random(25, 375));//gives random position
    dislike_object_speed9 = int(random(speed_random_low, speed_random_high));//gives random speed
  }






  //like_hit
  //like 1
  if (player_y >= like_object_y - like_object_height/2 && player_y <= like_object_y + like_object_height/2 && player_x <= like_object_x + like_object_width/2 && player_x >= like_object_x - like_object_width/2 ) {
    println("CRAZY");
    like_hit_count = like_hit_count+1;
    like_object_x = width + like_object_width;//when a like is hit the like jumps back to starting position
    like_object_y = int(random(25, 375));//gives random position
    like_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //like 2
  if (player_y >= like_object_y2 - like_object_height/2 && player_y <= like_object_y2 + like_object_height/2 && player_x <= like_object_x2 + like_object_width/2 && player_x >= like_object_x2 - like_object_width/2 ) {
    println("CRAZY");
    like_hit_count = like_hit_count+1;
    like_object_x2 = width + like_object_width;//when a like is hit the like jumps back to starting position
    like_object_y2 = int(random(25, 375));//gives random position
    like_object_speed2 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //like3
  if (player_y >= like_object_y3 - like_object_height/2 && player_y <= like_object_y3 + like_object_height/2 && player_x <= like_object_x3 + like_object_width/2 && player_x >= like_object_x3 - like_object_width/2 ) {
    println("CRAZY");
    like_hit_count = like_hit_count+1;
    like_object_x3 = width + like_object_width;//when a like is hit the like jumps back to starting position
    like_object_y3 = int(random(25, 375));//gives random position
    like_object_speed3 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like4
  if (player_y >= like_object_y4 - like_object_height/2 && player_y <= like_object_y4 + like_object_height/2 && player_x <= like_object_x4 + like_object_width/2 && player_x >= like_object_x4 - like_object_width/2 ) {
    println("CRAZY");
    like_hit_count = like_hit_count+1;
    like_object_x4 = width + like_object_width;//when a like is hit the like jumps back to starting position
    like_object_y4 = int(random(25, 375));//gives random position
    like_object_speed4 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like5
  if (player_y >= like_object_y5 - like_object_height/2 && player_y <= like_object_y5 + like_object_height/2 && player_x <= like_object_x5 + like_object_width/2 && player_x >= like_object_x5 - like_object_width/2 ) {
    println("CRAZY");
    like_hit_count = like_hit_count+1;
    like_object_x5 = width + like_object_width;//when a like is hit the like jumps back to starting position
    like_object_y5 = int(random(25, 375));//gives random position
    like_object_speed5 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like6
  if (player_y >= like_object_y6 - like_object_height/2 && player_y <= like_object_y6 + like_object_height/2 && player_x <= like_object_x6 + like_object_width/2 && player_x >= like_object_x6 - like_object_width/2 ) {
    println("CRAZY");
    like_hit_count = like_hit_count+1;
    like_object_x6 = width + like_object_width;//when a like is hit the like jumps back to starting position
    like_object_y6 = int(random(25, 375));//gives random position
    like_object_speed6 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like7
  if (player_y >= like_object_y7 - like_object_height/2 && player_y <= like_object_y7 + like_object_height/2 && player_x <= like_object_x7 + like_object_width/2 && player_x >= like_object_x7 - like_object_width/2 ) {
    println("CRAZY");
    like_hit_count = like_hit_count+1;
    like_object_x7 = width + like_object_width;//when a like is hit the like jumps back to starting position
    like_object_y7 = int(random(25, 375));//gives random position
    like_object_speed7 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like8
  if (player_y >= like_object_y8 - like_object_height/2 && player_y <= like_object_y8 + like_object_height/2 && player_x <= like_object_x8 + like_object_width/2 && player_x >= like_object_x8 - like_object_width/2 ) {
    println("CRAZY");
    like_hit_count = like_hit_count+1;
    like_object_x8 = width + like_object_width;//when a like is hit the like jumps back to starting position
    like_object_y8 = int(random(25, 375));//gives random position
    like_object_speed8 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
   //like6
  if (player_y >= like_object_y9 - like_object_height/2 && player_y <= like_object_y9 + like_object_height/2 && player_x <= like_object_x9 + like_object_width/2 && player_x >= like_object_x9 - like_object_width/2 ) {
    println("CRAZY");
    like_hit_count = like_hit_count+1;
    like_object_x9 = width + like_object_width;//when a like is hit the like jumps back to starting position
    like_object_y= int(random(25, 375));//gives random position
    like_object_speed9 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
}



void game_over() {

  if (dislike_hit_count >= 3) {//How many lives the player has
    //background(play_background);
    background(255);
    textSize(50);
    fill(0);
    text("GAME OVER", width/2-150, height/2);


    //highlights the restart button
    if (mouseX< (restart_button_x + restart_button_width/2) && mouseX> (restart_button_x - restart_button_width/2) && mouseY< (restart_button_y + restart_button_height/2) && mouseY> (restart_button_y - restart_button_height/2) ) {
      fill(0, 255, 0);
    }
    else {
      fill(255);
    }


    //draw restart button
    rect(restart_button_x, restart_button_y, restart_button_width, restart_button_height, 10, 10, 10, 10);
    fill(0);
    textSize(25);
    text("Restart", restart_button_x-40, restart_button_y+10);
  }
}


void mouseClicked() {
  //when restart button is pressed  
  if (mouseX< (restart_button_x + restart_button_width/2) && mouseX> (restart_button_x - restart_button_width/2) && mouseY< (restart_button_y + restart_button_height/2) && mouseY> (restart_button_y - restart_button_height/2) ) {

    like_hit_count = 0;//restarts the like counter
    dislike_hit_count = 0;//resets the game by stopping it from activationg game over void
  }
//When choosing player
  if (mouseX< (Michaela_x + player_start_screen_width/2) && mouseX> (Michaela_x - player_start_screen_width/2) && mouseY< (Michaela_y + player_start_screen_height/2) && mouseY> (Michaela_y - player_start_screen_height/2) ) {
    choose_Michaela = true;
    start_screen=false;
    like_hit_count = 0;//restarts the like counter
    dislike_hit_count = 0;//resets the game by stopping it from activationg game over void
  } 

  if (mouseX< (Ludvig_x + player_start_screen_width/2) && mouseX> (Ludvig_x - player_start_screen_width/2) && mouseY< (Ludvig_y + player_start_screen_height/2) && mouseY> (Ludvig_y - player_start_screen_height/2) ) {
    choose_Ludvig = true;
    start_screen=false;
    like_hit_count = 0;//restarts the like counter
    dislike_hit_count = 0;//resets the game by stopping it from activationg game over void
  }
}



