
//Version: 1.0.0.3
//ship can turn in all directions,
//your ship can fire up and down
//and left or right.but has some issues with firing.
//the enemies move but the background still needs to move

//variables
float x = 350;
float x1 = 350;
float x2 = 0;
float y = 600;
float y1 = 600;
float y2 = 0;
float enemyX =400;
float enemyY = 500;
float speed = 4;
float backSpeed;
float direction =1;
float backgroundUp;
float backgroundRight;
float widthX = 600;
float heightY = 350;
float bulletDirection;
boolean fireFirst = true;
boolean fire = false; 
PImage enemy1;
PImage fighterUp;
PImage fighterLeft;
PImage fighterRight;
PImage fighterDown;
PImage background1;
//Needs a variable to tell which direction the ship is facing,
//so that it will fire in that direction.



void setup() {
  size(1200, 700);
//  load images
  fighterUp = loadImage("Bosconian_Star_Fighter.png");
  fighterDown = loadImage("Bosconian_Star_Fighter_Down.png");
  fighterRight = loadImage("Bosconian_Star_Fighter_Right.png");
  fighterLeft = loadImage("Bosconian_Star_Fighter_Left.png");
  background1 = loadImage("nightSky.png");
  enemy1 = loadImage("Bosconian_Enemy_Base.png");
  background(0);
// Set starting Image
//  imageMode(CENTER);
//  image(background1,width/ 2, height/ 2);
  imageMode(CENTER);
  image(fighterUp, width/2, height/2, -35, -35);
  smooth();
}

void draw() {
//  print(fireFirst);
//  All ship Processes
  back();
  enemy();
  ship();
  shipRight();
  shipLeft();     
  shipDown();
  shipFire();
  

}

void ship() {
    if (keyCode == UP) {
      direction = 1;
      imageMode(CENTER);
//      image(background1, width / 2, height / 2);
      image(fighterUp, width/2, height/2, -35, -35);
    }
}

void shipRight() {
    if (keyCode == RIGHT) {
      direction = 2;
      imageMode(CENTER);
//      image(background1, width/ 2, height/2);
      image(fighterRight, width/2, height/2, -35, -35);
    }
}

void shipLeft() {
    if (keyCode == LEFT) {
      direction = 3;
//      imageMode(CENTER);
//      image(background1, width/ 2, height/2);
      imageMode(CENTER);
      image(fighterLeft, width/2, height/2, -35, -35);
    }
}

void shipDown() {
    if (keyCode == DOWN) {
      direction = 4;
//      image(background1, width/ 2, height/2);
      imageMode(CENTER);
      image(fighterDown, width/2, height/2, -35, -35);
    }
}

//controls all Star fighter weapons
//Needs a variable to control the direction in which it fires.

void shipFire() {
  if (key == ' ' ) {  
    if(direction == 1) {
    imageMode(CENTER);
//        image(background1, width/ 2, height/2);
    image(fighterUp, width/2, height/2, -35, -35);
    }
    if(direction == 2){
       imageMode(CENTER);
//           image(background1, width/ 2, height/2);
    image(fighterRight, width/2, height/2, -35, -35);
    }
    if(direction == 3) {
       imageMode(CENTER);
//           image(background1, width/ 2, height/2);
    image(fighterLeft, width/2, height/2, -35, -35);
    }
    if(direction == 4) {
       imageMode(CENTER);
//           image(background1, width/ 2, height/2);
    image(fighterDown, width/2, height/2, -35, -35);
    }
    fire = true;
    speed = 4;
  }
//  this is where you want to go to spencer this is the function you want
  if (fire == true) {
    if(fireFirst == true){
      fireFirst = false;
      bulletDirection = direction;
    }
    if(bulletDirection == 1){
    ellipse(600, x - 6, 7, 7);
    ellipse(600, x1 + 6, 7, 7);
    }
    if(bulletDirection == 2){
    ellipse(y + 6, 350, 7, 7);
    ellipse(y1 - 6, 350, 7, 7);
    }
     if(bulletDirection == 3){
    ellipse(y - 6, 350, 7, 7);
    ellipse(y1 + 6, 350, 7, 7);
    }
     if(bulletDirection == 4){
    ellipse(600, x - 6, 7, 7);
    ellipse(600, x1 + 6, 7, 7);
    }
    
  }


  if (fire == false) {
    x = 340;
    x1 = 360;
    y = 600;
    y1 = 600;
  }
  if (x <= 0) {
    x = 340;
    speed = 0;
    fire = false;
    fireFirst = true;
  }
  if (x1 >= 700){
    x1 = 360;
  speed = 0;
  fire = false;
  fireFirst = true;
}
  if (y <= 0) {
    y = 580;
    speed = 0;
    fire = false;
    fireFirst = true;
  }
  if (y1 >= 1200){
    y1 = 620;
  speed = 0;
  fire = false;
  fireFirst = true;
}
x = x - speed;
x1 = x1 + speed;
y = y - speed; 
y1 = y1 + speed;
}

void enemy() {
//  image(background1, width/ 2, height/2);here
  if(direction == 1) {
  image(enemy1, enemyX, enemyY, enemy1.width/ 1.7, enemy1.height/ 1.7);
  enemyY= enemyY +1.5;
}
  if(direction == 2) {
  image(enemy1, enemyX, enemyY, enemy1.width/ 1.7, enemy1.height/ 1.7);
  enemyX = enemyX - 1.5;
}
  if(direction == 3) {
  image(enemy1, enemyX, enemyY, enemy1.width/ 1.7, enemy1.height/ 1.7);
  enemyX = enemyX +1.5;
}
  if(direction == 4) {
  image(enemy1, enemyX, enemyY, enemy1.width/ 1.7, enemy1.height/ 1.7);
  enemyY = enemyY -1.5;
}
}
void back(){
  imageMode(CENTER);
  image(background1,widthX, heightY);
  if(direction == 1) {
    heightY = heightY +2;
  }
  if(direction == 2) {
    widthX = widthX - 2;
  }
  if(direction == 3) {
    widthX = widthX + 2;
  }
  if(direction == 4) {
    heightY = heightY - 2;
  }
  if(heightY >= 400) {
    heightY = 250;
  }
  if(heightY <= 200) {
    heightY = 400;
  }
  if(widthX <= 375) {
    widthX = 775;
  }
  if(widthX >= 800) {
    widthX = 400;
  }
}
//void hit() {
// if(dist(width / 2, height / 2,enemyX, enemyY)<=100){
//   print("crash");
//}
//}


