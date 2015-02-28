
//Charlotte Lim
//z3377671
//Derived from week 7 homework
//Press s to shoot, up and down arrow keys to move


//definining images
PImage bg;
PImage upArrow;
PImage downArrow;
PImage shootButton;
PImage bird;
PImage beiber;

//bird's initial coordinates
int birdX = 100; 
int birdRow = 3;
//y values for rows
int[] row = {65, 140, 215, 290};

//initial projectile coordinate
int shootX = 160;
int currShootY = -10;

//Beiber's initial coordinates
int beiberX = 700;
int beiberY = row[0];
int beiberOp = 255;

//bool checking if beiber has been shot
boolean beiberShot = false; 
//bool checking if projectile has been launched
boolean projectile = false;


void setup(){
  
  size(800, 480);
  
  //loading images
  bg = loadImage("bg.jpg");
  upArrow = loadImage("upArrow.png");
  shootButton = loadImage("shootButton.png");
  downArrow = loadImage("downArrow.png");
  bird = loadImage("bird.png");
  beiber = loadImage("beiber.png");
  
}


void draw(){  
  
  image(bg, 0, 0);
  
  //showing controls
  tint(255, 100);
  image(upArrow, 10, 80);
  image(shootButton, 10, 160);
  image(downArrow, 10, 240);
  noTint();
  
  //beiber image is displayed if it hasn't been shot
  //image wraps around to right side of the screen if it reaches the left 
  if (beiberShot == false){
    image(beiber, beiberX, beiberY);
    beiberX -= 2;
    if (beiberX <= -45){
      beiberX = 800;
    }
  }
  
  //bird moves up and down when arrows are used
  //arrows on screen get pressed
  image(bird, birdX, row[birdRow]);
  if (keyPressed){
     if (key == CODED){
        if (keyCode == UP && birdRow != 0){
          image(upArrow, 10, 80);
          birdRow -= 1;
        } else if (keyCode == DOWN && birdRow != 3){
          image(downArrow, 10, 240);
          birdRow += 1;
        }
     }
  }
  
  //When S is pressed, shoot button is pressed and projectile bool turns true
  if (keyPressed){
    if (key == 's'){
      currShootY = row[birdRow];
      projectile = true;
      image(shootButton, 10, 160);
    }
  }
  
  //projectile is shot when bool turns true
  if (projectile == true){
    ellipse(shootX, currShootY, 10, 10);
    shootX += 5; 
  }
  
  //if projectile reaches end of screen or hits beiber, projectile bool turns false and resets X and Y coords.
  if (shootX >= 800){
    projectile = false;
    shootX = 160;
    int shootY = row[birdRow];
  }
  
  //if projectile hits Beiber, YOU WIN. 
  if (shootX >= beiberX && currShootY == beiberY){
    background(0); 
    fill(255);
    textSize(50);
    text("WINNER.", 290, 250);
    textSize(25);
    noLoop(); 
  }
 
}


