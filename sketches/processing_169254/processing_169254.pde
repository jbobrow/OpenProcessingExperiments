
int x_speed, y_speed;
PImage tsunami;
PImage ookiiChar;
PImage furuChar;
PImage tabeChar;
PImage kodomoChar;
old[] olds = new old[20];
kid kidder=new kid();
eater eaterder=new eater();

void setup(){
  tint(255);
  size(636,447);
  for(i=0;i<20;i++){
    x_speed = random(10);
    y_speed = random(10);
    olds[i] = new old(random(width),random(height),x_speed,y_speed);
  }
  kidder= new kid(310,310,10,10);
  eaterdur= new eater(300,300,10,10);
  tsunami=loadImage("Tsunami.jpg");
  ookiiChar=loadImage("ookii.png");
  furuChar=loadImage("furu.png");
  tabeChar=loadImage("tabe.png");
  kodomoChar=loadImage("kodomo.png");
}

void draw(){
  image(tsunami,0,0);
  
  for(i=0;i<17;i++){
    olds[i].move();
    olds[i].draw();
  }
  
  //image(furuChar,0,0);
  kidder.move();
  kidder.draw();
  fill(0,0,255);
  eaterdur.move();
  eaterdur.draw();
  collider(kidder,eaterdur);
}

class old{
  float x,y;
  int diam, x_speed, y_speed, age;
  
  old(float Class_X, float Class_Y, int X_Speed, int Y_Speed){
    x = Class_X;
    y = Class_Y;
    x_speed=X_Speed;
    y_speed=Y_Speed;
    age=0;
  }
  
  void draw(){
    age+=.5;
    //ellipse(x,y,diam-age,diam);
    pushMatrix();
    tint(0,age,0);
    if(age<256)
    {
      image(furuChar,x,y);
    }
    tint(255);
    popMatrix();
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
}

class kid{
  float x,y,dirX;
  int diam, x_speed, y_speed;
  boolean exist;
  
  kid(float Class_X, float Class_Y, int X_Speed, int Y_Speed){
    x = Class_X;
    y = Class_Y;

    x_speed=X_Speed;
    y_speed=Y_Speed;
    dirX=1;
    exist=true;
  }
  
  void draw(){
    if(exist)
    {
      image(kodomoChar,x,y);
    }
  }
  
  void move(){
    dirX = -dirX;
    if (x<0){
      dirX = 1;
    }
    if(x>width){
      dirX = -1;
    }
    if (y<0) {
      y_speed += 1;
    }
    if (y>height) {
      y_speed -=1;
    }
    x_speed=random(100)*dirX;
    x+=x_speed;
    y+=y_speed;
  }
  int GetX()
  {
    return x;
  }
  
  int GetY()
  {
    return y;
  }
  
  boolean getExistance()
  {
    return exist;
  }
  
  void setExistance()
  {
    exist=false;
  }
}

class eater{
  float x,y;
  int x_speed, y_speed;
  boolean bigger;
  
  eater(float Class_X, float Class_Y, int X_Speed, int Y_Speed){
    x = Class_X;
    y = Class_Y;

    x_speed=X_Speed;
    y_speed=Y_Speed;
  }
  
  void draw(){
    
    if(bigger){
      //scale(2);
      image(ookiiChar,x,y);
    }else image(tabeChar,x,y);
  }
  
  void move(){
    /*if (x>width || x<0){
      x_speed = -x_speed;
    }
    if (y<0) {
      y_speed += 1;
    }
    if (y>height) {
      y_speed -=1;
    }*/
    x=random(width);
    y=random(height);
  }
  
  int GetX()
  {
    return x;
  }
  
  int GetY()
  {
    return y;
  }
  void setBigger()
  {
    bigger=true;
  }
}

void collider(kid xb, eater yb)
  {
    
    if(yb.GetX()<=xb.GetX()&&yb.GetX()+80>=xb.GetX()+40&&xb.getExistance())
    {
      
     if(yb.GetY()<=xb.GetY()&&yb.GetY()+80>=xb.GetY()+40)
      {
        xb.setExistance();
        yb.setBigger();
      } 
    }
  }


