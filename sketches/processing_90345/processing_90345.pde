
//global variables
int wide; //width of canvas
int tall; //height of canvas
int s; //size of players
float sensorSize; //height of players sensors
float speed; //players speed
PImage vignette; //vignette image
PImage instructions; //instruction icon
PImage player1Image; //player 1 image
PImage player2Image; //player 2 image
PImage sensor1; //player 1 sensor image
PImage sensor2; //player 2 sensor image

//colors
int backgroundColor; 

//player start position
float player1X = wide/3-s; 
float player2X = wide*2/3;
float playerY  = tall/2-(s/2);

//players class
Player player1; //player 1
Player player2; //player 2

//playground class
Playground playground;

//info and menu class
InfoDisplay screen;

//KEYS
//contains true or false state of keys
boolean[] keys = new boolean[255]; 
//when key pressed keys[pressed key] = TRUE
void keyPressed() {
  if(keyCode>255) return;
  keys[keyCode] = true;
  println(keyCode);
}
//when key pressed keys[pressed key] = FALSE
void keyReleased() {
  if(keyCode>255) return;
  keys[keyCode] = false;
}

//setup
void setup() {
 
 //----------------------------------------------// 
 //----------------------------------------------// 
  //global variables
  wide = 700; //1440; //canvas width //ful5 = 1440
  tall = 450; //900; //can2.5as height //full = 900
  s = tall/10; //player size
  speed = wide/180; //player movement speed
  sensorSize = s/6; //player sensor height
  //----------------------------------------------// 
  //----------------------------------------------// 
 
  //colors
  backgroundColor = #ffffff; //background color
  
  //player start position
  player1X = wide/3-s; 
  player2X = wide*2/3;
  playerY = tall/2-(s/2);

  //players
  player1 = new Player(player1X, playerY, s, speed, sensorSize, "WASD"); //player 1
  player2 = new Player(player2X, playerY, s, speed, sensorSize, "Arrows"); //player 2

  //playground
  playground = new Playground(wide, tall);

  //info and menus
  screen = new InfoDisplay(); //this doesnt accept parameters WHAT THE FUCK?

  //canvas
  background(backgroundColor);
  frameRate(100);
  size(wide, tall);
  fill(0);
  smooth();

  /*-------MEDIA-------*/
  
  //font
  PFont font;
  font = loadFont("VisitorTT2BRK-170.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  
  //images
  vignette = loadImage("vignette.png");
  instructions = loadImage("instructions.png");
  player1Image = loadImage("player1lighter.png");
  player2Image = loadImage("player2lighter.png");
  sensor1 = loadImage("sensor1.png");
  sensor2 = loadImage("sensor2.png");
}

//draw
void draw() {
  background(backgroundColor); //redo background
  playground.clouds(); //draw cloud blocks
  screen.instructionsIcon(instructions); //draw instruction icon
  if(screen.stillPlaying == true) updatePlayers(); //update players x and y positions
  player1.display(player1Image, sensor1); //player 1 
  player2.display(player2Image, sensor2); //player 2
  player1.win(player2.x, player2.y); //displays win screen if win occurs
  player2.win(player1.x, player1.y); //displays win screen if win occurs
  screen.tie(player1.x,player1.y, player2.x, player2.y); //tie screen if players touch
  image(vignette, 0, 0, width, height); //draw vignette image
}


 //update players x and y positions when keys are pressed
 void updatePlayers(){  
  if(keys[LEFT])  player2.move(-speed,0); 
  if(keys[RIGHT]) player2.move(speed,0); 
  if(keys[UP])  player2.move(0,-speed);
  if(keys[DOWN])  player2.move(0,speed);
 
  if(keys[65])  player1.move(-speed,0); //a
  if(keys[68])  player1.move(speed,0); //d
  if(keys[87])  player1.move(0,-speed); //w
  if(keys[83])  player1.move(0,speed);  //s 
}

class InfoDisplay{
  
  //class parameters
  int tieScreenLength   = 1000; //milliseconds that tie screen shows
  int winScreenLength   = 2000; //milliseconds that win screen shows
  boolean stillPlaying  = true; //becomes false when play ends
  int blocksTouched     = 0; //gets millis() for when blocks touched

  float instructionsSize; //size of instructions icon
  float instructionsX; //x position of instructions icon
  float instructionsY; //y position of instructions icon
  
 //construct
 InfoDisplay(){
  }
  
 //draws intstuctions icon
 void instructionsIcon(PImage tempInstructions){
   PImage instructions = tempInstructions;
   
   instructionsSize = width/30; //size of instructions icon
   instructionsX = width/80;//wide-instructionsSize-wide/60;
   instructionsY = width/80;//tall-instructionsSize-tall/60;

   //if mouse over instructions icon execute instructionsScreen
   if(mouseX >= instructionsY &&
      mouseX <= instructionsY+instructionsSize &&
      mouseY >= instructionsX &&
      mouseY <= instructionsX+instructionsSize
      ) instructionsScreen(); //display instructions
      
   image(instructions, instructionsX, instructionsY , instructionsSize, instructionsSize); //draws instructions icon
 }
  
 //displays instructions 
 void instructionsScreen(){
   
   //draws rectangle that tints screen black
   fill(0, 150); 
   rect(0,0, width, height);
   
   //draws instructions on screen
   fill(255);
   textSize(width/24);
   textAlign(LEFT);
   text("Tag is a two player game. Move your bot using the WASD or arrow keys. Hit your opponent's sensor (located on top of player) before they hit yours. Non-sensor contact always results in a tie.", width/4, height/4, width/2, height/2);
 }
 
 //displays tie screen
 void tie(float tempX, float tempY ,float tempOtherX, float tempOtherY){
      float otherX = tempOtherX; //other players x
      float otherY = tempOtherY; //other players y
      float x = tempX; // players x
      float y = tempY; // players y
      
      //displays tieScreen if players touch eachother
      if(x < otherX+s &&
         x+s > otherX &&
         y < otherY+s &&
         y+s > otherY) tieScreen(); //display tie screen
    
 }
  
 //draws tie screen
 void tieScreen(){
     background(0, 100); 
     fill(255); 
     textSize(width/8.5);
     textAlign(CENTER, CENTER);
     text("DRAW", width/2, height/2); //TIE text
     stillPlaying = false; //stops updatePlayers
     if(blocksTouched == 0) blocksTouched = millis(); //sets millis() that blocks touched  
     
     //displays tie screen as long for the length of tieScreenLength
     if(millis() - blocksTouched >= tieScreenLength){ 
       setup(); //reset sketch/game
     }
    }
  
  //displays win screen
  void winScreen(String tempControls){
      String controls = tempControls;
      background(0, 100); //color for TIE background
      fill(255); //color for TIE text
      textSize(width/9.6);
      textAlign(CENTER, CENTER);
      text(controls+" Wins!", width/2, height/2); //TIE text
      stillPlaying = false; //stops updatePlayers
      if(blocksTouched == 0) blocksTouched = millis(); //sets millis() that blocks touched  
       
      //displays tie screen as long for the length of tieScreenLength
      if(millis() - blocksTouched >= winScreenLength){
        setup(); //reset sketch/game
        loop(); // start draw
      }
  }
}
class Playground{
  
  //class parameters
  int cloudMin        = 75; //minimum size for cloud
  int cloudMax        = 300; //maximum size for cloud
  int cloudNumber     = 200; //number of clouds
  float cloudSpeed    = 1; // cloud speed
  int cloudDistance   = -4000; // distance clouds can start from fram
  float[] cloudX      = new float[cloudNumber+1]; //creates array for cloud x positions
  float[] cloudY      = new float[cloudNumber+1]; //creates array for cloud y positions
  float[] cloudWidth  = new float[cloudNumber+1]; //creates array for cloud width
  float[] cloudHeight = new float[cloudNumber+1]; //creates array for cloud height
  
  //construct
  Playground(int tempWide, int tempTall){
     //populates cloudX, cloudY arrays with random numbers
      int wide = tempWide; //sets canvas x value as sent by object instantiation parameter
      int tall = tempTall; //sets canvas y value as sent by object instantiation parameter
      
      for(int varCreate = 0; varCreate <= cloudNumber; varCreate++){
        cloudX[varCreate]      = int(random(cloudDistance, wide)); //random cloud x position
        cloudY[varCreate]      = int(random(0, tall)); //random cloud y position
        cloudWidth[varCreate]  = int(random(cloudMin, cloudMax/2)); //random cloud width
        cloudHeight[varCreate] = int(random(cloudMin, cloudMax)); //random cloud height
      }
  }
 //make block clouds 
 void clouds(){
  fill(0, 10); //fill color and opacity for clouds
  noStroke(); 
  
  //draw clouds
  for(int i = 0; i <= cloudNumber; i++){
    rect(cloudX[i], cloudY[i], cloudWidth[i], cloudHeight[i]);
    
    //update cloud variables
    cloudX[i] += cloudSpeed;
  }  
 }
}
class Player{
   
   //class parameters
   float x; // x position
   float y; // y position
   float sensorX; //sensor x position
   float sensorY; //sensor y position
   int s; //size
   float sensorSize; //sensor height
   float speed; //speed
   String controls; //controls
   int colors; //player color
   float otherX; //oposing players x value
   float otherY; //oposing players y value
   PImage playerImage; //player image
   
  
     //construct
     Player(float tempX, float tempY, int tempS , float tempSpeed, float tempSensorSize, String tempControls){
       x = tempX; 
       y = tempY; 
       s = tempS; 
       speed = tempSpeed; 
       controls = tempControls;
       sensorSize = tempSensorSize;
     }
    
     //updates players x and y values
     void move(float tempX, float tempY){
       x += tempX;
       y += tempY;
     }
     
     //draws new players positions
     void display(PImage playerImage, PImage sensor){
       
       // draw player
       image(playerImage, x, y-2, s, s); //draw player using image
       fill(0,100);
       imageMode(CORNERS);//changes rectMode to corners to draw sensor
       image(sensor, x, y, x+s, y-sensorSize); //draw players sensor
       imageMode(CORNER); //resets rectMode
       
       //wraparound
       boundaries();
     }
     
     //displays winner screen if player hits others sensor
     void win(float tempOtherX, float tempOtherY){
       
      otherX = tempOtherX;
      otherY = tempOtherY;
      
      //displays win screens if a player touches other players sensor
      if (x < otherX+s &&
          x+s > otherX &&
          y < otherY-sensorSize &&
          y+s > otherY-sensorSize){
          screen.winScreen(controls); //launches win screen from InfoDisplay class
      }
     }
      
      //pacman style wraparound
      void boundaries(){
       if(x >= width) x = 2;
       if(y >= height) y = 2;
       if(x <= 0) x = width+1;
       if(y <= 0) y = height+1;
      }
    }


