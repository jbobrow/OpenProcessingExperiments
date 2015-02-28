
Enemy[] enemies;

void setup(){
  smooth();
    size(1000, 1100);
    enemies = new Enemy[1000];
    for(int i = 0; i< enemies.length; i++){
      enemies[i] = new Enemy(random(width), random(height), random(-1000,50),random(5000,50));
    }
}


void draw(){
  //background (255,255,255);
  for(int i=0; i < enemies.length; i++){
  enemies[i].move();
  enemies[i].displayE();
  }
  
  
  
  
  
  
  
  
}
  
  class Enemy{
    float x,y,speedX,speedY;
    //constructor
    Enemy(float _x, float _y,float width, float height){
      x=_x;
      y=_y;
      speedX=15;
      speedY=15;
    }
    //methods
    void move(){
      x+=speedX;
      y+=speedY;
    }
    void displayE(){
      float ellsize = mouseX-y;
      fill (250,150,0, 10);
      ellipse (x,y, ellsize, ellsize);
      if (x > 1000){
       x = 0;
      }
      if (y > 1100){
        y = 0;
      }
    }
  }


