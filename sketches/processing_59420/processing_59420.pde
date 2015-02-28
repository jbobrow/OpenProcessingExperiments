

float enemyX = 790;

float mylifeX = 200;
float enemylifeX = 200;
float youcolor = 0;
float enemycolor = 0;

void playGame() {

  //(float rx, float ry, float rw, float rh, float cx, float cy, float cr
  if (imgCircleIntersect(enemyX, y, 100, 150, x, bally+20, radius) == true) {

    enemycolor = 255;
    x = 60;
    move = false;
    //    score = score + 1;
    speedEnemy = speedEnemy + 0.3;
    enemylifeX = enemylifeX - 10;

  }

  if (enemylifeX == 0) {
    mode = 2;      ///////YOU WIN. GAME OVER
  }
//player 1
  if (imgCircleIntersect(35, Character, 100, 150, enemyballx, y+23, radius) == true) {
    youcolor = 255;
    enemyballx = 800;

    mylifeX = mylifeX - 10;
  }

  
  if (mylifeX == 0) {
    mode = 3; ////// YOULOSE
  }
  if(enemylifeX ==100) {
    enemyballradius = 25;

    
  }
  if(enemylifeX ==20) {
    enemyballradius = 40;
  }

  
  
  
  /////////////// Ball////////////////
  fill(0, 52, 252);
  ellipse(x, bally, radius, radius);

  //////////////////ENEMY BALL
  fill(255, 0, 0);
  ellipse(enemyballx, y+5, enemyballradius, enemyballradius);

  int enemyshoot = int (random(10));
  if (enemyshoot ==1) {
    enemymove = true;
  }

  if (enemymove == true) {
    enemyballx -= speedEnemyball;

  }

  if (enemyballx < 0) {
    enemymove = false;
    enemyballx = 800;
  }

    



  //ENEMY

  fill(enemycolor, 0, 0);
  image(img2, enemyX, y);  


  if (enemycolor > 0) {
    enemycolor = enemycolor-3;

  }

  //println(enemycolor);



  //////////////////MYLIFE////////////////////////////////
  fill(37, 180, 27);
  stroke(1);
  rect(130, 40, mylifeX, 20);




  ///////////////////ENEMYLIFE//////////////////////////
  rect(570, 40, enemylifeX, 20);

  ///////////////////GAUGESLIFE////////////////////////////////
  noFill();
  rect(570, 40, 200, 20);
  rect(130, 40, 200, 20);

  /////////////////////YOU////////////////////////////////////////////////


  fill(youcolor, 0, 0);
        image(img, 30,Character);
        



  if (youcolor > 0) {
    youcolor = youcolor-3;
  }

  y += speedEnemy * direction;
  if((y> height-20) || (y < 20)) {
    direction = -direction;
  }







}




boolean imgCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
 
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);
 
  if (circleDistanceX > (rw/2 + cr)) { return false; }
  if (circleDistanceY > (rh/2 + cr)) { return false; }
  if (circleDistanceX <= rw/2) { return true; }
  if (circleDistanceY <= rh/2) { return true; }
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}

int radius = 10;
int enemyballradius = 10;
float x = 23;
float y = 35;
float speedBall = 50;
float speedEnemyball = 10;
float speedEnemy = 30;
int direction = 1;
//int score = 0;
float bally;
boolean move = false;

float enemyballx = 800;
float enemybally = 58;
boolean enemymove = false;
PFont font;
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5; 
PImage img6;
// 
float diameter;
int mode = 0;
int Character = 0;





void setup() {
  size(800, 480);
  smooth();
  
  font = loadFont( "TimesNewRomanPSMT-48.vlw" );
    textFont( font );




  noCursor();
  noStroke();
  
    img = loadImage("character 1.png");
        img2 = loadImage("character 2.png");
                img3 = loadImage("floor.png");
                img4 = loadImage("opening.png");
                  size(img4.width, img4.height);
                    img5 = loadImage("game over.png");
                     img6 = loadImage("winner.png");



                



}

void draw() {
  background(255);
  translate(-50, -25);
  

  if (mode == 0) {
  

    image (img4, 40, 0);
     fill(0);
    textSize(35);
    stroke (20);
    text("INSTRUCTIONS", 85, 380);
    text("CLICK TO PLAY", 400, 600);

        textSize(20);

        text("EASY", 55, 420);
        text("A", 150, 420);
        text("Move Up", 240, 420);
        text("D", 150, 458);
        text( "Move Down", 227, 458);
        text( "Move Up", 240, 497);
        text( "Move Down", 227, 535);
        text("THROW", 50, 580);
          text("Ball Stops When", 210, 570);
           text("Player Moves", 226, 595);





         text("HARD", 55, 500);
         textSize(15);
         text( "Up ", 149, 486);
          text( "Arrow ", 140, 500);
          text( "Down ", 140, 525);
          text( "Arrow ", 140, 540);
           text( "Space ", 138, 584);
          text( "Bar ", 145, 598);
          text( "Hold ", 140, 570);






        

         
            strokeWeight (3);
  fill (50);
  //outer box
          line (50, 350, 375, 350);
          line (50, 391, 375, 391);
          line (375, 350, 375, 600);
          line (375, 600, 50, 600);
   //inner box
          line (190, 391, 190, 600);
          line (125, 393, 125, 600);
          line (125, 430, 375, 430);
          line (50, 470, 375, 470);
          line (125, 508, 375, 508);
          line (50, 550, 375, 550);





   








 
    // page 1, 2, 3, 4

  }
  else if (mode == 1) {
            image(img3, 40,0);
    playGame();
  }

  if (mode == 2) {
               image(img6, 40,0);
    fill (101, 112, 232);
    textSize(60);
  }
  if (mode == 3) {
               image(img5, 40,0);
    fill (255, 0, 0);
    textSize(60);
    
    

    
   
// keyboard commands
  }
}
void keyPressed(KeyEvent evt) {
 //Keyboard Commands
 
  int key = evt.getKeyCode();  // Keyboard code for the pressed key.
 
 if (key == KeyEvent.VK_UP) {  // up-arrow key; move up
    Character -= 8;
    if (Character < -3)
      Character = -3;
    redraw();
  }
 else if (key == KeyEvent.VK_DOWN) {  // down-arrow key; move down
    Character += 8;
    if (Character > getSize().height - 3- 50)
      Character = getSize().height - 3-50 ;
    redraw();
  }
   if (key == KeyEvent.VK_A) {  // up-arrow key; move up
    Character -= 18;
    if (Character < -3)
      Character = -3;
    redraw();
  }
 else if (key == KeyEvent.VK_D) {  // down-arrow key; move down
    Character += 18;
    if (Character > getSize().height - 3- 50)
      Character = getSize().height - 3-50 ;
    redraw();
  }
   if (key == KeyEvent.VK_SPACE) {
   x += speedBall;
  } 
  else {
    bally = Character;
  }
    //ball distance
  if (x > 1050) {
    move = false;
    x = 45;
    
  }
}








void mousePressed() {

  if (mode == 0) {
    enemylifeX = 200;
    speedEnemy = 5;
    enemycolor = 0;
    mode = 1;
    mylifeX= 200;
    youcolor = 0;
    enemyballradius=10;
  } 
  else if (mode == 1) {
    //x = 0;
    move = true;
    enemymove = true;
  }
  if (mode == 2) {
    mode = 0;
  }
  if (mode ==3) {
    mode = 0;
  }
}

