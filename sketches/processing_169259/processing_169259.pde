
int diam, x_speed, y_speed;
Ball[] balls = new Ball[30];
Square[] squares = new Square[10];
Triangle[] tris = new Triangle[10];
//end ball stuff

int rwidth, rheight;
int numBalls=1;
 
 
 
void setup(){
  size(600,600);
  for(i=0;i<10;i++){
    diam = random(60);
    x_speed = random(5);
    y_speed = random(5);
    //balls[i] = new Ball(random(width),random(height),diam,x_speed,y_speed);
    tris[i] = new Triangle(random(width),random(height),diam,x_speed,y_speed);
    squares[i] = new Square(random(width),random(height),random(60),random(60),x_speed,y_speed);
  }
  for(i=0;i<30;i++){
    diam = random(60);
    x_speed = random(5);
    y_speed = random(5);
    balls[i] = new Ball(random(width),random(height),diam,x_speed,y_speed);
  }
}
 
void draw(){
  fill(255);
  rect(0,0,600,600);
  fill(0);
  
  for(i=0;i<20;i++){
    if(balls[i] != null){
      balls[i].move();
      for(it=0;it<20;it++){
       if(balls[i].collide(balls[it].x, balls[it].y)){
         fill(#E30000);
         if(abs(balls[i].x - balls[it].x) > abs(balls[i].y - balls[it].y))
         {
           balls[i].x_speed = -balls[i].x_speed;
           balls[it].x_speed = -balls[it].x_speed;
         }
         else
         {
           balls[i].y_speed = -balls[i].y_speed;
           balls[it].y_speed = -balls[it].y_speed;
         }
       } else fill(0);
      } 
      balls[i].draw();
    }
  }
  
  for(i=0;i<10;i++){
    squares[i].move();
    for(it=0;it<10;it++){
     if(squares[i].collide(squares[it].x, squares[it].y)){
       fill(#E30000);
       if(abs(squares[i].x - squares[it].x) > abs(squares[i].y - squares[it].y))
       {
         squares[i].x_speed = -squares[i].x_speed;
         squares[it].x_speed = -squares[it].x_speed;
       }
       else
       {
         squares[i].y_speed = -squares[i].y_speed;
         squares[it].y_speed = -squares[it].y_speed;
       }
     } else fill(0);
     
     
     
    } 
    for(it =0; it < 20; it++){
     if(squares[i].collide(balls[it].x, balls[it].y)){
        balls[it] = new Ball(0,0,0,0,0);
     }  
    }
    
    squares[i].draw();
  }
  
   for(i=0;i<10;i++){
     fill(0);
    tris[i].move();
      for(it=0;it<20;it++){
         if(tris[i].collide(balls[it].x, balls[it].y)){
           fill(#104BE8);
         } 
      }
    
    /*
    for(it=0;it<20;it++){
   
     
       if(tris[i].collide(balls[it].x, balls[it].y)){
         
         for(x=0;x<2;x++){
          if(numBalls < 20){
           for(j=0;j<20;j++){
             if(balls[j].diam == 0){
               balls[j] = new Ball(balls[it].x,balls[it].y, balls[it].diam, random(5),random(5));
               break;
             }
           }
          }
          break;
         }
         
       }
      
     
    }
    */
    tris[i].draw();
  }
}
 
class Ball{
  float x,y;
  int diam, x_speed, y_speed;
   
  Ball(float Class_X, float Class_Y, int Diam, int X_Speed, int Y_Speed){
    numBalls++;
    x = Class_X;
    y = Class_Y;
    diam = Diam;
    x_speed=X_Speed;
    y_speed=Y_Speed;
  }
   
  void draw(){
    ellipse(x,y,diam,diam);
  }
   
  void move(){
    if (x>width || x<0){
      x_speed = -x_speed;
    }
    if (y<0) {
      y_speed += 1;
    }
    if (y>height) {
      y_speed -=1;
    }
    x+=x_speed;
    y+=y_speed;
  }
  
  boolean collide(int x2, int y2){
     if(x2 > x && y2 > y){
       if((x2 < x+diam) && (y2 < y+diam)){
         return true;
       }
     }
     return false;
  }
}

class Triangle{
  float x,y;
  int diam, x_speed, y_speed;
   
  Triangle(float Class_X, float Class_Y, int Diam, int X_Speed, int Y_Speed){
    x = Class_X;
    y = Class_Y;
    diam = Diam;
    x_speed=X_Speed;
    y_speed=Y_Speed;
  }
   
  void draw(){
    
    triangle(x+(diam/2),y+diam,x,y,x+diam, y);
  }
   
  void move(){
    if (x>width || x<0){
      x_speed = -x_speed;
    }
    if (y<0) {
      y_speed += 1;
    }
    if (y>height) {
      y_speed -=1;
    }
    x+=x_speed;
    y+=y_speed;
  }
  
  boolean collide(int x2, int y2){
     if(x2 > x && y2 > y){
       if((x2 < x+diam) && (y2 < y+diam)){
         return true;
       }
     }
     return false;
  }
}

class Square{
  float x,y;
  int sidex, sidey, x_speed, y_speed;
   
  Square(float Class_X, float Class_Y, int SideX, int SideY, int X_Speed, int Y_Speed){
    x = Class_X;
    y = Class_Y;
    sidex = SideX;
    sidey = SideY;
    x_speed=X_Speed;
    y_speed=Y_Speed;
  }
   
  void draw(){
    rect(x,y,sidex,sidey);
  }
   
  void move(){
    if (x>width || x<0){
      x_speed = -x_speed;
    }
    if (y<0) {
      y_speed += 1;
    }
    if (y>height) {
      y_speed -=1;
    }
    x+=x_speed;
    y+=y_speed;
  }
  
  boolean collide(int x2, int y2){
     if(x2 > x && y2 > y){
       if((x2 < x+sidex) && (y2 < y+sidey)){
         return true;
       }
     }
     return false;
  }
}



