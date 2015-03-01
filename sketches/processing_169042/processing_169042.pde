
PImage guy;
PImage girl;
PImage girl2;
PImage singleguy;
PImage background;
PImage oldie;
PImage granny;
PImage scouple;
PImage oldcouple;
float count;
float timer;
float x,y,q,w,e,r;
float sdistance;




void setup(){
  size(700,400);
  background = loadImage("background.png");
  guy = loadImage("guycopy.png");
  girl = loadImage("girl.png");
  lesgirl = loadImage("girl2.png");
  singleguy = loadImage("guy2.png");
  oldie =  loadImage("old.png");
  scouple = loadImage("couple.png");
  granny = loadImage("grandma.png");
 oldcouple = loadImage("oldcouple.png");
 
 
  x_speed =5;
  y_speed = 5; 
  guy1 = new Guy(100, 100, x_speed,y_speed);
  
  
  xx_speed = random(4,7);
  yy_speed = 6;
  girl1 = new Girl(random(width), random(height), xx_speed, yy_speed);
  
  xxxx_speed = random(3);
  yyyy_speed = 3;
  girl2 = new Girl2 (300, 200, xxxx_speed, yyyy_speed);
  
  xxx_speed = 2;
  yyy_speed = random(2,3);
  single1 =new Singleg(random(width), random(height), xxx_speed, yyy_speed);
}


void draw() {
  //fill(255);
  //rect(0,0,width,height);
  
  background.resize(700,400);
  image(background, 0,0);
   count++;

 
  
  guy1.move();
  guy1.draw();
  
  girl1.move();
  girl1.draw();
  
  girl2.move();
  girl2.draw();
  
  single1.move();
  single1.draw();
   
   
 
  
  
  
}

class Guy {
  
  float x,y;
  float x_speed, y_speed;
  float timer;
  boolean loved;
  Guy (float Class_X, float Class_Y, float X_speed, float Y_speed){
  x=Class_X; 
  y=Class_Y;
  x_speed=X_speed;
  y_speed=Y_speed;}
  
  void draw(){
    if (loved ==false){
  imageMode(CORNER);
image(guy, x,y);}
     if(girl1.dead ==true){
   loved = true;}
   if(loved==true){
     image(scouple,x,y);
     timer++;
     if(timer>200){
       scouple.resize(1,1);
       image(oldcouple,x,y);}
     }
  }
  
  void move(){
  if (x>width-50 ||x<0)
  { x_speed =-x_speed;
  }
  if(y<5) {
    y_speed +=1;}
    if(y>height-75){
    y_speed-=1;}
    x+=x_speed;
    y+=y_speed;
  }
  
}

class Girl{
  
  float e,r;
  float xx_speed, yy_speed;
  boolean dead;
  
  Girl (float ClassX, float ClassY, float Xspeed, float Yspeed){
    e = ClassX;
    r = ClassY;
    xx_speed = Xspeed;
    yy_speed = Yspeed;}
    
    void draw(){
      if(dead == false){
      imageMode(CORNER);
      image(girl, e,r);}
    if(e+15 > guy1.x && e-30 <guy1.x){
    if (r+30>guy1.y && r-50<guy1.y){dead=true;
    guy1.loved=true;
  }}
    }
      
      void move(){
  if (e>width-50 ||e<0)
  { xx_speed =-xx_speed;
  }
  if(r<5) {
    yy_speed +=1;}
    if(r>height-75){
    yy_speed-=1;}
    e+=xx_speed;
    r+=yy_speed;
  }
  
}

class Girl2{
  
  float a,s;
  float xxxx_speed, yyyy_speed;
  Girl2 (float ClassX, float ClassY, float Xspeed, float Yspeed){
    a = ClassX;
    s = ClassY;
    xxxx_speed = Xspeed;
    yyyy_speed = Yspeed;}
    
    void draw(){
      imageMode(CORNER);
      image(lesgirl, a,s);
    if(count>300){
    lesgirl.resize(1,1);
    image(granny, a,s);
  xxxx_speed=0;
  yyyy_speed=0;}
    }
      
      void move(){
  if (a>width-50 ||a<50)
  { xxxx_speed =-xxxx_speed;
  }
  if(s<50) {
    yyyy_speed +=1;}
    if(s>height-100){
    yyyy_speed-=1;}
    a+=xxxx_speed;
    s+=yyyy_speed;
  }
  
}

class Singleg {
  float q,w;
  float xxx_speed, yyy_speed;
  Singleg (float ClassXX, float ClassYY, float XXspeed, float YYspeed){
    q = ClassXX;
    w = ClassYY;
    xxx_speed = XXspeed;
    yyy_speed = YYspeed;}
    
    void draw(){
      //imageMode(CORNER);
      image(singleguy, q,w);

if(count>300){
  singleguy.resize(1,1);
xxx_speed=0; yyy_speed=0;
image(oldie, q,w);}  
  }
      
      void move(){
  if (q>width-50 ||q<0)
  { xxx_speed =-xxx_speed;
  }
  if(w<5) {
    yyy_speed +=1;}
    if(w>height-100){
    yyy_speed-=1;}
    q+=xxx_speed;
    w+=yyy_speed;
  }
  
}



