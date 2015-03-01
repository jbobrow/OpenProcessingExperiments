
//these integers are the speeds that all of the objects in the game move at
float playerspeed = 5;
float ballspeed = 3;
float ballxspeed = 2;
float ballyspeed = 2;
float aispeed = 3.0;
//counts how many times the ball has been succesfully deflected by the player
int bounces = 0;
//the level
int level = 1;
int textx = -200;
boolean start;
boolean win;
boolean left;
boolean right;
boolean up;
boolean down;
boolean space;
boolean r;
boolean aispeedincrease;
boolean aispeeddecrease;
boolean stop = false;
//these next couple of lines are to determine what direction the ball is moving in
boolean forward = true;
boolean backward = false;
boolean leftbounce = true;
boolean rightbounce = false;
boolean upbounce = true;
boolean downbounce = false;
void setup()
{
  size(1000,550,P3D);
  lightFalloff(1.0,0.001,0.0);
  pointLight(150,250,150,50,50,50);
  //directionalLight(126, 126, 126, 0, 0, -1);
  ambientLight(102, 102, 102);
  background(255);
}
//these are the coordinates of the ball and paddle
int ballx = (width / 2);
int bally = (height / 2);
int ballz = -100;
int paddlex = (width / 2);
int paddley = (height / 2);
int paddlez = 300;
int aix = (width / 2);
int aiy = (height / 2);
int aiz = -300;

void draw()
{
  background(255);
  arena();
  movingball();
  playerpaddle();
  aipaddle();
  //this "if" statement starts the game if spacebar is pressed
  if (space == true){
    start = true;
  }
  if (start == true)
  {
    bouncing();
  }
  if (level == 0 && win == false){
    endgame(); 
  }
  if (win == true){
    win();
  }
  writing();  
}

void writing()
{
  if (level != 0){
    textSize(25);
    fill(0);
    textAlign(CENTER);
    text("LEVEL " + level,width / 2,30);
    text("C L I C K  T H E  A R R O W  K E Y S  T O " ,width / 2,height - 115);
    text("  C H A N G E  A I  D I F F I C U L T Y   ",width / 2,height - 75);
  }
  if (start == false && level != 0){
    textSize(45);
    fill(0);
    textAlign(CENTER);
    text("P R E S S  S P A C E B A R  T O",width / 2,175);
    text("B E G I N  P L A Y I N G !",width / 2,215);
  }
}

void keyPressed()
{
  //setting the keys
  if (key == 'R' || key =='r'){
    r = true;
  }
  if (keyCode == UP){
    aispeedincrease = true;
  }
  if (keyCode == DOWN){
    aispeeddecrease = true;
  }
  if (key == 'A' || key == 'a'){
    left = true;
  }
  if (key == 'D' || key == 'd'){
    right = true;
  }
  if (key == 'W' || key == 'w'){
    up = true;
  }
  if (key == 'S' || key == 's'){
    down = true;
  }
  if (key == ' '){
    space = true;
  }
}

void keyReleased()
{
  //again setting the keys
  if (key == 'R' || key == 'r'){
    r = false;
  }
  if (keyCode == UP){
    aispeedincrease = false;
  }
  if (keyCode == DOWN){
    aispeeddecrease = false;
  }
  if (key == 'A' || key == 'a'){
    left = false;
  }
  if (key == 'D' || key == 'd'){
    right = false;
  }
  if (key == 'W' || key == 'w'){
    up = false;
  }
  if (key == 'S' || key == 's'){
    down = false;
  }
  if (key == ' '){
    space = false;
  }
}

void arena()
{
  //left wall
  pushMatrix();
  translate(100,height / 2,0);
  stroke(0);
  fill(30,120,200);
  box(1,height - 150,width * .75);
  popMatrix();
  pushMatrix();
  //right wall
  translate(width - 100,height / 2,0);
  stroke(0);
  fill(30,120,200);
  box(1,height - 150,width * .75); 
  popMatrix();
  pushMatrix();
  translate(width/2,height,-100);
  stroke(0);
  fill(30,100,25);
  box(width,1,width);
  popMatrix();
}

void playerpaddle()
{
  //makin the paddle
  pushMatrix();
  translate(paddlex,paddley,paddlez);
  stroke(0);
  noFill();
  box(125,70,10);
  //this is making the paddle move if the arrowkeys are pressed
  if (start == true){
    if (up == true && paddley > 150){
      paddley -= playerspeed;
    }
    if (down == true && paddley < height - 150){
      paddley += playerspeed;
    }
    if (left == true && paddlex > 200){
      paddlex -= playerspeed;
    }
    if (right == true && paddlex < width - 200){
      paddlex += playerspeed;
    }
  }
  popMatrix();
}

void aipaddle()
{
  //makin the AI paddle
  pushMatrix();
  translate(aix,aiy,aiz);
  stroke(0);
  fill(40,150,50);
  box(125,70,10);
  if (start == true && level != 0)
  {
    if (aix < ballx && aix < (width - 200)){
      aix += aispeed;
    }
    if (aix > ballx && aix > 200){
      aix -= aispeed;
    }
    if (aiy < bally && aiy < (height -150)){
      aiy += aispeed;
    }
    if (aiy > bally && aiy > 150){
      aiy -= aispeed;
    }
    else{
      aix = aix;
      aiy = aiy;
    }
    if (aispeedincrease == true){
      aispeed += 1.0;
    } 
    if (aispeeddecrease == true){
      aispeed -= 1.0;
    }
  }
  popMatrix();  
}

void movingball()
{
  pushMatrix();
  //draws the ball each time
  translate(ballx,bally,ballz);
  stroke(30,30,170);
  fill(255,25,120);
  sphere(10);
  popMatrix();  
}

void bouncing()
{
  //movement of the code
  //these 3 commands control the bounces and angles at which they bounce
  ballxangles(); 
  ballzangles();
  ballyangles();
  levelincrease(); 
}

void ballxangles()
{
  //this determines how the ball will bounce off the left and right walls
  ballx += ballxspeed;
  if (ballx >= width - 250)
  {
    leftbounce = true;
    rightbounce = false;
    ballxspeed *= -1;
    changingspeed();
  }
  if (ballx <= 250)
  {
    ballxspeed *= -1;
    rightbounce = true;
    leftbounce = false;
    changingspeed();
  }
}

void ballzangles()
{
  ballz += ballspeed;
  //this will determine how the ball moves back and forth
  if (ballz >= 270)
  {
    //ball only bounces off paddle
    backward = true;
    forward = false;
    //counts the number of times the paddle has succesfully deflected the paddle
    bounces += 1;
    if (ballx >= paddlex - 75 && ballx <= paddlex + 75 && bally <= paddley + 40 && bally >= paddley - 40){
      ballspeed *= -1;
      changingspeed();
    }
    else{
      //resetting everything if you miss the ball
      ballspeed = 0;
      ballxspeed = 0;
      ballyspeed = 0;
      level = 0;
      bounces = 0;
    }
  }
  if (ballz <= -250)
  {
    if (ballx >= aix - 75 && ballx <= aix + 75 && bally <= aiy + 40 && bally >= aiy - 40){
      ballspeed *= -1;
      forward = true;
      backward = false;
    }
    else{
      ballspeed = 0;
      ballxspeed = 0;
      ballyspeed = 0;
      bounces = 0;
      level = 0;
      win = true;
    }
  }
}
void ballyangles()
{
  //this determines how the ball will move up and down
  bally += ballyspeed;
  if (bally >= height - 160)
  {
    downbounce = false;
    upbounce = true;
    ballyspeed *= -1;
    changingspeed();
  }
  if (bally <= 160)
  {
    ballyspeed *= -1;
    downbounce = true;
    upbounce = false;
    changingspeed();
  }
}
void endgame()
{
  float textcolor;
  textcolor = random(int(255));
  arena();
  playerpaddle();
  aipaddle();
  
  //this part of the code makes the game have to restart if u miss the ball
  if (level == 0)
  {
    textSize(50);
    fill(textcolor);
    text(" G A M E  O V E R  L O S E R ",textx,225);
    textSize(35);
    fill(textcolor);
    text("P R E S S  R  T H E N  S P A C E",textx,260);
    fill(textcolor);
    text("    T O  R E S T A R T    ",textx,295);
    textx += 3;
    if (textx > width + 200){
      textx = -200;
    }
    //this is setting all of the variables that are inportant back to their original state
    if (r == true){
      level = 1;
      ballx = width / 2;
      bally = height / 2;
      ballz = -100;
      ballspeed = 3;
      ballxspeed = 2;
      ballyspeed = 2;
      textx = -200;
      paddlex = width / 2;
      paddley = height / 2;
      aix = (width / 2);
      aiy = (height / 2);
      aiz = -300;
      aispeed = 3;
      win = false;
    }
    start = false;
  }
}

void win()
{
  float textcolor;
  textcolor = random(int(255));
  arena();
  playerpaddle();
  aipaddle();
  
  //this part of the code makes the game have to restart if u miss the ball
  if (level == 0)
  {
    textSize(45);
    fill(textcolor);
    text(" C O N G R A T S  Y O U  W I N ",textx,225);
    textSize(35);
    fill(textcolor);
    text("  Y O U  A R E N 'T A  B I G   ",textx,260);
    fill(textcolor);
    text("            N E R D !          ",textx,295);
    fill(textcolor);
    text("P R E S S  R  T H E N  S P A C E",textx,330);
    fill(textcolor);
    text("       T O  R E S T A R T       ",textx,365);    
    textx += 3;
    if (textx > width + 200){
      textx = -200;
    }
    //this is setting all of the variables that are inportant back to their original state
    if (r == true){
      level = 1;
      ballx = width / 2;
      bally = height / 2;
      ballz = -100;
      ballspeed = 3;
      ballxspeed = 2;
      ballyspeed = 2;
      textx = -200;
      paddlex = width / 2;
      paddley = height / 2;
      aix = (width / 2);
      aiy = (height / 2);
      aiz = -300;
      aispeed = 3;
      win = false;
    }
    start = false;
  }
  
}

void levelincrease()
//this is increasing the level as the succesful bounces increase
{
  if (bounces > 1){
    level = 2;
  }
  if (bounces > 2){
    level = 3;
  }
  if (bounces > 3){
    level = 4;
  }
  if (bounces > 4){
    level = 5;
  }
  if (bounces > 5){
    level = 6;
  }
  if (bounces > 6){
    level = 7;
  }
  if (bounces > 7){
    level = 8;
  }
  if (bounces > 8){
    level = 9;
  }
  if (bounces > 9){
    level = 10;
  }
  else{
    level = level;
  }
}

void changingspeed()
{
  boolean ballspeedneg = false;
  boolean ballxspeedneg = false;
  boolean ballyspeedneg = false;
//these lines are making the next x, y, or z speed negative if the previous one was also negative
//so that the ball doesn't change direction out of nowhere when it hits a wall
  if (ballspeed < 0){
    ballspeedneg = true;
  }
  if (ballxspeed < 0){
    ballxspeedneg = true;
  }
  if (ballyspeed < 0){
    ballyspeedneg = true;
  }
  if (ballspeed > 0){
    ballspeedneg = false;
  }
  if (ballxspeed > 0){
    ballxspeedneg = false;
  }
  if (ballyspeed > 0){
    ballyspeedneg = false;
  }
  ballxspeed = getballxspeed(level);
  ballyspeed = getballyspeed(level);
  ballspeed = getballzspeed(level);
  if (ballspeedneg == true){
    ballspeed *= -1;
  }
  if (ballxspeedneg == true){
    ballxspeed *= -1;
  }
  if (ballyspeedneg == true){
    ballyspeed *= -1;
  }
}

float getballxspeed(int number)
{
  float x = 2;
  for (int i = 1;i < number;i++)
  {
    x += .5;
  }
  return x;
}

float getballyspeed(int number)
{
  float y = 2;
  for (int j = 1;j < number;j++)
  {
    y += .5;
  }
  return y;
}

float getballzspeed(int number)
{
  float z = 3;
  for (int k = 1;k < number;k++)
  {
    z += .5;
  }
  return z;
}
  
  
   


    
     
  
  
  
 
  
    
      
      
  
 
