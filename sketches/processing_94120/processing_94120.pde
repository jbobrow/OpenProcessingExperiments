
Char player;
PImage imgChar;
PImage imgLevel;
PImage imgPlan;
PImage imgEnemy;
PImage imgGameOver;
PImage imgEnergy;
PImage imgYouWin;
float ground;
float currentGround;







void setup() {
  size (500,1000);
  ground = height - 20;
  currentGround = ground;
  imgGameOver = loadImage("gameOver.jpg");
  imgEnemy = loadImage("Enemy.png");
  imgChar = loadImage("Char.png");
  imgLevel = loadImage("Level.png");
  imgPlan = loadImage("plan.png");
  imgEnergy = loadImage("Energy.png");
  imgYouWin = loadImage ("YouWin.PNG");
  player = new Char(20,995,0,0,.3,.3);

}


void draw() {
  imageMode(CORNER);
  image(imgLevel,0,0,width,height);
  imageMode(CENTER);
  if (collided( player.x, player.y, 30, 40, 40, 920, 70, 30))
  {
    currentGround = 920;
  }
  //1 Platforms
  else if (collided( player.x, player.y, 30, 40, 150,880,70,30))
  {
    currentGround = 880;
  }
  //2
  else if (collided( player.x, player.y, 30, 40, 210,885,70,30))
  {
    currentGround = 885;
  }
  //3
  else if (collided( player.x, player.y, 30, 40, 400,885,70,30))
  {
    currentGround = 885;
  }
  //4
  else if (collided( player.x, player.y, 30, 40, 400,750,70,30))
  {
    currentGround = 750;
  }
  //5
  else if (collided( player.x, player.y, 30, 40, 400,750,70,30))
  {
    currentGround = 750;
  }
  //6
  else if (collided( player.x, player.y, 30, 40, 300,700,70,30))
  {
    currentGround = 700;
  }
  //7
  else if (collided( player.x, player.y, 30, 40, 150,650,70,30))
  {
    currentGround = 650;
  }
  //8
  else if (collided( player.x, player.y, 30, 40, 40,550,70,30))
  {
    currentGround = 550;
  }
  //9
  else if (collided( player.x, player.y, 30, 40, 150,450,70,30))
  {
    currentGround = 450;
  }
  //10
  else if (collided( player.x, player.y, 30, 40, 400,520,70,30))
  {
    currentGround = 520;
  }
  //11
  else if (collided( player.x, player.y, 30, 40, 490,400,70,30))
  {
    currentGround = 400;
  }
  //12
  else if (collided( player.x, player.y, 30, 40, 490,300,70,30))
  {
    currentGround = 300;
  }
  //13
  else if (collided( player.x, player.y, 30, 40, 490,200,70,30))
  {
    currentGround = 200;
  }
  //14
  else if (collided( player.x, player.y, 30, 40, 230,150,70,30))
  {
    currentGround = 150;
  }
  //15
  else if (collided( player.x, player.y, 30, 40, 40,100,70,30))
  {
    currentGround = 100;
  }
  //1 Enemy
  else if (collided( player.x, player.y, 30, 40, 300,950,70,40))
  {
    imageMode(CORNER);
    image(imgGameOver,0,0,width,height);
    
       
  }
  //2
  else if (collided( player.x, player.y, 30, 40, 300,780,70,40))
  {
    imageMode(CORNER);
    image(imgGameOver,0,0,width,height);
      
  }
  //3
  else if (collided( player.x, player.y, 30, 40, 60,680,70,40))
  {
    imageMode(CORNER);
    image(imgGameOver,0,0,width,height);   
  }
  //4
  else if (collided( player.x, player.y, 30, 40, 280,500,70,40))
  {
    imageMode(CORNER);
    image(imgGameOver,0,0,width,height);   
  }
  //5
  else if (collided( player.x, player.y, 30, 40, 400,300,70,40))
  {
    imageMode(CORNER);
    image(imgGameOver,0,0,width,height);   
  }
  //6
  else if (collided( player.x, player.y, 30, 40, 350,170,70,40))
  {
    imageMode(CORNER);
    image(imgGameOver,0,0,width,height);   
  }
  //7
  else if (collided( player.x, player.y, 30, 40, 130,120,70,40))
  {
    imageMode(CORNER);
    image(imgGameOver,0,0,width,height);   
  }
  
  // 1   Engergy
  else if (collided( player.x, player.y, 30, 40, 40,70,40,20))
  {
    imageMode(CORNER);
    image(imgYouWin,0,0,width,height);   
  }

  else
  {
    //println("not on platform");
    currentGround = ground;
  }
  
    
  //1        platforms
  image(imgPlan,40,920, 70, 30);
  //2
  image(imgPlan,150,880,70,30);
  //3
  image(imgPlan,215,885,70,30);
  //4
  image(imgPlan,400,885,70,30);
  //5
  image(imgPlan,400,750,70,30);
  //6
  image(imgPlan,300,700,70,30);
  //7
  image(imgPlan,150,650,70,30);
  //8
  image(imgPlan,40,550,70,30);
  //9
  image(imgPlan,150,450,70,30);
  //10
  image(imgPlan,400,520,70,30);
  //11
  image(imgPlan,490,400,70,30);
  //12
  image(imgPlan,490,300,70,30);
  //13
  image(imgPlan,490,200,70,30);
  //14
  image(imgPlan,230,150,70,30);
  //15
  image(imgPlan,40,100,70,30);
  
  //1          Enemy
  image(imgEnemy,300,950,70,40);
  //2
  image(imgEnemy,300,780,70,40);
  //3
  image(imgEnemy,60,680,70,40);
  //4
  image(imgEnemy,280,500,70,40);
  //5
  image(imgEnemy,400,300,70,40);
  //6
  image(imgEnemy,350,170,70,40);
  //7
  image(imgEnemy,130,120,70,40);
  
  //1    Energy
  image(imgEnergy,40,70,40,20);
  

  player.move();
  player.draw();
  player.keyPressed();
  player.keyReleased(); 

}
 
 
 
class Char {
  float x;
  float y;
  float hspeed;
  float vspeed;
  float gravity;
  float djump;
    
  Char (float X, float Y, float Hspeed, float Vspeed, float Gravity, float Djump) {
    x=X;
    y=Y;
    hspeed=Hspeed;
    vspeed=Vspeed;
    gravity=Gravity;
    djump=Djump;
  }
  void draw() {
    imageMode(CENTER);
    image(imgChar,x,y,30, 40);
  }
  void move() {
    if (x > width - 20) {
      hspeed = 0;
      x = width - 20;
    }
    if (x < 10) {
      hspeed = 0;
      x = 10;
    }
    vspeed += gravity;
    x += hspeed;
    y += vspeed;
    
   djump += gravity;
   x += hspeed;
   y += djump;

    if (y > currentGround) {
      //println("on ground");
      vspeed = 0;
      djump = 0;
      y = currentGround;
    }
  }
  void keyPressed() {
    if (keyPressed == true) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          hspeed = -3;
        }
        if (keyCode == RIGHT) {
          hspeed = 3;
        }
        if (y == currentGround) {
          if  (keyCode == UP) {
           //println("jump");
            vspeed = -8;
            gravity = .3;
          }
        }
          if (y == currentGround) {
          if  (keyCode == CONTROL ) {
            djump = -12;
            gravity = .3;
          }
        }
      }
    }
  }
  void keyReleased() {
    if (keyPressed == false) {
      if (key == CODED) {
        if (keyCode == LEFT || keyCode == RIGHT) {
          hspeed = 0;
        }
      }
    }
  }
  boolean circlesCollided(float x1, float y1, float x2, float y2, float radius1, float radius2)
{
  if (dist(x1, y1, x2, y2) < (radius1 + radius2))
  {
    return true;
  }
  else
  {
    return false;
  }
}
}

 
// assumes you are drawing images with imageMode(CENTER)
boolean collided(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2)
{
  boolean collided = false;
   
  float left1 = x1 - w1 / 2;
  float right1 = x1 + w1 / 2;
  float top1 = y1 - h1 / 2;
  float bottom1 = y1 + h1 / 2;
   
  float left2 = x2 - w2 / 2;
  float right2 = x2 + w2 / 2;
  float top2 = y2 - h2 / 2;
  float bottom2 = y2 + h2 / 2;
  
  if (bottom1 > top2)
  {
    collided = true;
  }
  
  if (left2 > right1 || right2 < left1 || top2 > bottom1 || bottom2 < top1)
  {
    collided = false;
  }

  return collided;
}




