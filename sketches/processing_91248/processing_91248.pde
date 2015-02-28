
/* @pjs preload="carpet.png, cat.png, mouse.png, tiger.png, cockroachlive.png, cockroachdead.png"*/

PImage cat;
PImage mouse;
PImage tiger;
PImage cockroach;
PImage cockroachdead;
PImage carpet;
float time=0.0;
Sprite Cat;
Sprite Cockroachlive;
Sprite Cockroachdead;
Sprite Tiger;
Sprite Mouse;
/*float catx[]= new float[1];
float caty[]= new float[1];
float mousex[]=new float[1];
float mousey[]=new float[1];
float tigerx[]= new float[1];
float tigery[]= new float[1];
float cockroachx[]= new float[1];
float cockroachy[]=new float[1];*/




void setup(){
  size (1024,1024);
  carpet=loadImage("carpet.png");
  //background(carpet);
  Cat=new Sprite(300,300, 100, 100, 4, "cat.png");
  Tiger=new Sprite(Cat.x,300,150,150,4,"tiger.png");
  Mouse=new Sprite(600,300,80,80,random(1,5),"mouse.png");
  Cockroachlive=new Sprite(random(100,700),random(200,600),50,50,2,"cockroachlive.png");
  Cockroachdead=new Sprite(Cockroachlive.x,Cockroachlive.y, 50,50, 0, "cockroachdead.png");
        
}

void draw(){
  imageMode(CORNER);
  image(carpet, 0, 0, 1024, 1024);
  Cat.move();
  Mouse.move();
  Cockroachlive.move();
  
  
  
  Cat.draw();
  Mouse.draw();
  Cockroachlive.draw();
  if(Cockroachlive.dead==true){
    Cockroachdead.draw();}
    boolean collided=Cat.collide(Mouse);
  if(collided==true){
    Tiger.x=Cat.x;
    Tiger.y=Cat.y;
    Tiger.move();
    Tiger.draw();
  }
  
}





/*void Cat(float x, float y){
  image(cat, random(100,700),random(200,600), 30, 30);
}
  
void Mouse(float x, float y){
  image(mouse, random(200,700), random(200,600), 30, 30);
}*/

class Sprite{
  float x;
  float y;
  float speed;
  float w;
  float h;
  float time;
  boolean dead;
  PImage img;
  
  Sprite(float xx, float yy, float ww, float hh, float sspeed, String imageName){
    x=xx;
    y=yy;
    speed=sspeed;
    img=loadImage(imageName);
    w=ww;
    h=hh;
    time=0;
    dead=false;}
    
    void draw(){
      imageMode(CENTER);
      image(img,x,y,w,h);
    }
    void move(){
      time+=0.10;
      if(time==30.00){
        dead=true;}
    if(!dead){
      if(x>=width || x<=0){
        speed=-speed;}
        x+=speed;}
    }
    
    boolean collide(Sprite other){
      if(!dead){
      float d=dist(x, y, other.x, other.y);
      float maxWidth= max(w, other.w);
      if(d<maxWidth){
        return true;
      }
    }
    return false;
}
}
