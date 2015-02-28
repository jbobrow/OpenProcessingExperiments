
//@pjs preload="spider.jpg;"
//@pjs preload="web.jpg;"
//@pjs preload="Jazz.vlw;"
class Spyder
{
  PImage image;
  PVector position;
  PVector direction;
  PVector velocity;
  float rotateSpeed;
  float speed;
  int numLives;
}
class Prey
{
  PImage image;
  PVector position;
}
Spyder spider;
Prey food1;
Prey food2;
Prey food3;
int xBuffer = 50;
int yBuffer = 40;
boolean good = false;
boolean bad = false;
boolean running = true;
int randX = random(0, 200);
int randY = random(0, 200);
int score;
float left = 0;
float right = 0;
float down = 0;
float up = 0;

//Sets up font, spider, and preys. 
void setup(){
  PFont font;
  font = loadFont("Jazz.vlw");
  textFont(font);
  score = 0;
  imageMode(CENTER);
  size(400, 400);
  spider = new Spyder();
  spider.image = loadImage("spider.jpg");
  spider.position = new PVector(200, 150);
  spider.direction = new PVector(0, 1);
  spider.velocity = new PVector(0, 0);
  spider.speed = 3;
  spider.rotateSpeed = .1;
  spider.numLives = 3;
  food1 = new Prey();
  food1.image = loadImage("web.jpg");
  food1.position = new PVector(randX, randY);
  food2 = new Prey();
  food2.image = loadImage("web.jpg");
  randX = random(0, 200);
  randY = random(0, 200);
  food2.position = new PVector(randX, randY);
  food3 = new Prey();
  food3.image = loadImage("web.jpg");
  randX = random(0, 200);
  randY = random(0, 200);
  food3.position = new PVector(randX, randY);
}

void draw(){
  if(spider.numLives <= 0){  //check if lose
    background(255, 0, 0);
    fill(0);
    textSize(60);
    text("GAME OVER", 20, 200);
  }
  else if(score >= 10){  //check if win
    background(124, 252, 0);
    fill(0);
    textSize(60);
    text("YOU WIN!", 50, 200);
  }
  else{
    if(good){            //check if scored a point
      background(124, 252, 0);
    }
    else if(bad){      //check if lost a life
      background(255, 0, 0);
    }
    else{
      background(255);
    }
    makeWeb();
    rotate2D(spider.direction, spider.rotateSpeed * (left + right));
    spider.velocity.x = spider.direction.x * (spider.speed * (up + down));
    spider.velocity.y = spider.direction.y * (spider.speed* (up + down));
    spider.position.add(spider.velocity);
    pushMatrix();
    translate(spider.position.x, spider.position.y);      //spider movement
    rotate(spider.direction.heading2D());
    imageMode(CENTER);
    image(spider.image, 0, 0); 
    popMatrix();
    
    //check collisions
    if(imagesCollided(spider.image, spider.position, food1.image, food1.position)){
      score++;
      randX = random(0, 200);
      randY = random(0, 200);
      while((spider.position.x - xBuffer <= randX && spider.position.x >= randX) 
        || (spider.position.x + xBuffer >= randX && spider.position.x <= randX)){  //Makes sure new prey
          randX = random(0, 200);                                                //are not made atop the spider
      }
      while((spider.position.y - yBuffer <= randY && spider.position.y >= randY) 
        || (spider.position.y + xBuffer >= randY && spider.position.y <= randY)){
          randY = random(0, 200);
      }
      food1.position.x = randX;
      food1.position.y = randY;
      randX = random(0, 200);
      randY = random(0, 200);
      while((spider.position.x - xBuffer <= randX && spider.position.x >= randX) 
        || (spider.position.x + xBuffer >= randX && spider.position.x <= randX)){
          randX = random(0, 200);
      }
      while((spider.position.y - yBuffer <= randY && spider.position.y >= randY) 
        || (spider.position.y + xBuffer >= randY && spider.position.y <= randY)){
          randY = random(0, 200);
      }
      food2.position.x = randX;
      food2.position.y = randY;
      randX = random(0, 200);
      randY = random(0, 200);
      while((spider.position.x - xBuffer <= randX && spider.position.x >= randX) 
        || (spider.position.x + xBuffer >= randX && spider.position.x <= randX)){
          randX = random(0, 200);
      }
      while((spider.position.y - yBuffer <= randY && spider.position.y >= randY) 
        || (spider.position.y + xBuffer >= randY && spider.position.y <= randY)){
          randY = random(0, 200);
      }
      food3.position.x = randX;
      food3.position.y = randY;
      good = true;
      bad = false;
    }
    else if(imagesCollided(spider.image, spider.position, food2.image, food2.position)){
      score++;
      randX = random(0, 200);
      randY = random(0, 200);
      while((spider.position.x - xBuffer <= randX && spider.position.x >= randX) 
        || (spider.position.x + xBuffer >= randX && spider.position.x <= randX)){
          randX = random(0, 200);
      }
      while((spider.position.y - yBuffer <= randY && spider.position.y >= randY) 
        || (spider.position.y + xBuffer >= randY && spider.position.y <= randY)){
          randY = random(0, 200);
      }
      food1.position.x = randX;
      food1.position.y = randY;
      randX = random(0, 200);
      randY = random(0, 200);
      while((spider.position.x - xBuffer <= randX && spider.position.x >= randX) 
        || (spider.position.x + xBuffer >= randX && spider.position.x <= randX)){
          randX = random(0, 200);
      }
      while((spider.position.y - yBuffer <= randY && spider.position.y >= randY) 
        || (spider.position.y + xBuffer >= randY && spider.position.y <= randY)){
          randY = random(0, 200);
      }
      food2.position.x = randX;
      food2.position.y = randY;
      randX = random(0, 200);
      randY = random(0, 200);
      while((spider.position.x - xBuffer <= randX && spider.position.x >= randX) 
        || (spider.position.x + xBuffer >= randX && spider.position.x <= randX)){
          randX = random(0, 200);
      }
      while((spider.position.y - yBuffer <= randY && spider.position.y >= randY) 
        || (spider.position.y + xBuffer >= randY && spider.position.y <= randY)){
          randY = random(0, 200);
      }
      food3.position.x = randX;
      food3.position.y = randY;
      good = true;
      bad = false;
    }
    else if(imagesCollided(spider.image, spider.position, food3.image, food3.position)){
      spider.numLives--;
      randX = random(0, 200);
      randY = random(0, 200);
      while((spider.position.x - xBuffer <= randX && spider.position.x >= randX) 
        || (spider.position.x + xBuffer >= randX && spider.position.x <= randX)){
          randX = random(0, 200);
      }
      while((spider.position.y - yBuffer <= randY && spider.position.y >= randY) 
        || (spider.position.y + xBuffer >= randY && spider.position.y <= randY)){
          randY = random(0, 200);
      }
      food1.position.x = randX;
      food1.position.y = randY;
      randX = random(0, 200);
      randY = random(0, 200);
      while((spider.position.x - xBuffer <= randX && spider.position.x >= randX) 
        || (spider.position.x + xBuffer >= randX && spider.position.x <= randX)){
          randX = random(0, 200);
      }
      while((spider.position.y - yBuffer <= randY && spider.position.y >= randY) 
        || (spider.position.y + xBuffer >= randY && spider.position.y <= randY)){
          randY = random(0, 200);
      }
      food2.position.x = randX;
      food2.position.y = randY;
      randX = random(0, 200);
      randY = random(0, 200);
      while((spider.position.x - xBuffer <= randX && spider.position.x >= randX) 
        || (spider.position.x + xBuffer >= randX && spider.position.x <= randX)){
          randX = random(0, 200);
      }
      while((spider.position.y - yBuffer <= randY && spider.position.y >= randY) 
        || (spider.position.y + xBuffer >= randY && spider.position.y <= randY)){
          randY = random(0, 200);
      }
      food3.position.x = randX;
      food3.position.y = randY;
      bad = true;
      good = false;
    }
    else{
      good = false;
      bad = false;
    }
    imageMode(CENTER);
    image(food1.image, food1.position.x, food1.position.y);
    image(food2.image, food2.position.x, food2.position.y);
    image(food3.image, food3.position.x, food3.position.y);  //make prey
    fill(0);
    textSize(30);
    text(score, 365, 20);
    text("Lives: " + spider.numLives, 20, 20);  //show lives and score
  } 
}

//Collision detection
boolean imagesCollided(PImage image1, PVector position1, PImage image2, PVector position2)
{
  boolean collided = true;
   
  float left1 = position1.x - image1.width / 2;
  float right1 = position1.x + image1.width / 2;
  float top1 = position1.y - image1.height / 2;
  float bottom1 = position1.y + image1.height / 2;
   
  float left2 = position2.x - image2.width / 2;
  float right2 = position2.x + image2.width / 2;
  float top2 = position2.y - image2.height / 2;
  float bottom2 = position2.y + image2.height / 2;
  
  if (left2 > right1 || right2 < left1 || top2 > bottom1 || bottom2 < top1)
  {
    collided = false;
  }
 
  return collided;
}

//Rotation
void rotate2D(PVector v, float theta)
{
  float m = v.mag();
  float a = v.heading2D();
  a += theta;
  v.x = m * cos(a);
  v.y = m * sin(a);
}

//Controls
void keyPressed()
{
    if (keyCode == RIGHT)
    {
      right = 1;
    }
    if (keyCode == LEFT)
    {
      left = -1;
    }
    if (keyCode == UP)
    {
      up = 1;
    }
    if (keyCode == DOWN) 
    {
      down = 1;
    }

}
void keyReleased()
{
    if (keyCode == RIGHT)
    {
      right = 0;
    }
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN) 
    {
      down = 0;
    }

}

//Web background
void makeWeb(){
  //Axes
  line(0,400,400,0);
line(0,0,400,400);
line(400,200,0,200);
line(200,400,200,0);
// Inner Webbing
line(185,200,190,190);
line(200,185,190,190);
line(210,190,200,185);
line(215,200,210,190);
line(210,210,215,200);
line(200,215,210,210);
line(200,215,190,210);
line(190,210,185,200);
//
line(170,200,180,180);
line(170,200,180,220);
line(180,220,200,230);
line(200,230,220,220);
line(220,220,230,200);
line(230,200,220,180);
line(220,180,200,170);
line(200,170,180,180);
//
line(150,200,165,165);
line(165,165,200,145);
line(200,145,235,165);
line(235,165,250,200);
line(250,200,235,235);
line(235,235,200,250);
line(200,250,165,235);
line(165,235,150,200);
//
line(130,200,150,150);
line(150,150,200,120);
line(200,120,250,150);
line(250,150,270,200);
line(270,200,250,250);
line(250,250,200,270);
line(200,270,150,250);
line(150,250,130,200);
//
line(110,200,135,135);
line(135,135,200,95);
line(200,95,265,135);
line(265,135,290,200);
line(290,200,265,265);
line(265,265,200,290);
line(200,290,135,265);
line(135,265,110,200);
//
line(200,310,280,280);
line(280,280,310,200);
line(310,200,280,120);
line(280,120,200,70);
line(200,70,120,120);
line(120,120,90,200);
line(90, 200, 120, 280);
line(120, 280, 200, 310);
//
line(70, 200, 105, 105);
line(105, 105, 200, 50);
line(200, 50, 295, 105);
line(295, 105, 330, 200);
line(330, 200, 295, 295);
line(295, 295, 200, 330); 
line(200, 330, 105, 295);
line(105, 295, 70, 200);
//
line(50, 200, 90, 90);
line(90, 90, 200, 30);
line(200, 30, 310, 90); 
line(310, 90, 350, 200);
line(350, 200, 310, 310);
line(310, 310, 200, 350);
line(200, 350, 90, 310);
line(90, 310, 50, 200);
//
line(30, 200, 75, 75);
line(75, 75, 200, 10);
line(200, 10, 325, 75);
line(325, 75, 370, 200);
line(370, 200, 325, 325);
line(325, 325, 200, 370);
line(200, 370, 75, 325);
line(75, 325, 30, 200);
//
line(10, 200, 60, 60);
line(60, 60, 200, -10);
line(200, -10, 340, 60);
line(340, 60, 390, 200);
line(390, 200, 340, 340);
line(340, 340, 200, 390);
line(200, 390, 60, 340);
line(60, 340, 10, 200);
}


