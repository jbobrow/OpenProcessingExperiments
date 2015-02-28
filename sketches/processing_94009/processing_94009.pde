
/*pjs @preload="Med-Ship Layered.png, Med-Ship Layered Downblast.png, Med-Ship Layered Front-Blast.png, Med-Ship Layered Upblast.png, Med-Ship Layered UpBooster.png, Med-Ship Layered DownBooster.png, Med-Ship Layered Backup Blast.png, Med-Ship Layered Backdown Blast.png, Asteroid.png, Space.png, Planet.png, explosion.png, Fade to Black nebula by ChrisCold.png";*/

float timer=0.0;

PImage boom;

class Flight{
  PImage image;
  PImage normalImage;
  PImage leftImage;
  PImage rightImage;
  PImage upImage;
  PImage downImage;
  PImage downleftImage;
  PImage upleftImage;
  PImage downrightImage;
  PImage uprightImage;
  PVector direction;
  PVector position;
  PVector velocity;
  boolean destroyed;
  float speed;
  float w;
  
    boolean collide(Flight other){
      //if(destroyed=false){
      float d=dist(position.x, position.y, other.position.x, other.position.y);
      float maxWidth= 40;
      if(d<maxWidth){
        return true;
    }     
    return false;
}

    
}

class Rock{
  PImage image;
  PVector direction;
  PVector position;
  PVector velocity;
  float speed; 
}

class Goal{
  PImage image;
  PVector position;
  PVector velocity;
}
  
Flight Ast1;
Flight Ast2;
Flight Ast3;
Flight Ast4;
Flight Ast5;
Flight Ast6;
Flight Ast7;
Flight Ast8;
Flight Ast9;
Flight Ast10;
Flight Ast11;

Flight Explosion;

Flight planet;

Flight Medship;
float left=0;
float right=0;
float up=0;
float down=0;

PFont font;

PImage space;
PImage back;
PImage neb;

void setup(){
  space=loadImage("stars.png");
  back=loadImage("Space.png");
  neb=loadImage("Fade to Black nebula by ChrisCold.png");
  //imageMode(CENTER);
  size(1250,500);
  background(neb);
  font=loadFont("TwCenMT-Bold-72.vlw");
  Explosion=new Flight();
  Explosion.image=loadImage("explosion.png");
  Medship=new Flight();
  Medship.image=loadImage("Med-Ship Layered.png");
  Medship.leftImage=loadImage("Med-Ship Layered Front-Blast.png");
  Medship.normalImage=loadImage("Med-Ship Layered.png");
  Medship.rightImage=loadImage("Med-Ship Layered Booster.png");
  Medship.upImage=loadImage("Med-Ship Layered Upblast.png");
  Medship.downImage=loadImage("Med-Ship Layered Downblast.png");
  Medship.upleftImage=loadImage("Med-Ship Layered UpBooster.png");
  Medship.uprightImage=loadImage("Med-Ship Layered Backup Blast.png");
  Medship.downleftImage=loadImage("Med-Ship Layered Backdown blast.png");
  Medship.downrightImage=loadImage("Med-Ship Layered DownBooster.png");
  Medship.direction= new PVector(0,1);
  Medship.velocity= new PVector(1,0);
  Medship.position=new PVector(0,0);
  Medship.speed=2;
  Ast1=new Flight();
  Ast1.image=loadImage("Asteroid.png");
  Ast1.position=new PVector(1200, 0);
  Ast1.velocity=new PVector(-5,0);
  Ast1.direction=new PVector(-1,0);
  Ast1.speed=5;
  Ast2=new Flight();
  Ast2.image=loadImage("Asteroid.png");
  Ast2.position=new PVector(1000, 200);
  Ast2.velocity=new PVector(-6,0);
  Ast2.direction=new PVector(-1,0);
  Ast2.speed=6;
  Ast3=new Flight();
  Ast3.image=loadImage("Asteroid.png");
  Ast3.position=new PVector(1000,100);
  Ast3.direction=new PVector(-1,0);
  Ast3.velocity=new PVector(-7,0);
  Ast3.speed=7;
  Ast4=new Flight();
  Ast4.image=loadImage("Asteroid.png");
  Ast4.position=new PVector(1000,0);
  Ast4.velocity=new PVector(-8,0);
  Ast4.direction=new PVector(-1,0);
  Ast4.speed=8;
  Ast5=new Flight();
  Ast5.image=loadImage("Asteroid.png");
  Ast5.position=new PVector(1000,50);
  Ast5.velocity=new PVector(-7,0);
  Ast5.direction=new PVector(-1,0);
  Ast5.speed=7;
  Ast6=new Flight();
  Ast6.position=new PVector(1000, 25);
  Ast6.velocity= new PVector(-8,0);
  Ast6.direction= new PVector(-1,0);
  Ast6.speed=8;
  Ast7=new Flight();
  Ast7.position=new PVector(1000,175);
  Ast7.velocity= new PVector(-8,0);
  Ast7.direction= new PVector(-1,0);
  Ast7.speed=8;
  Ast8=new Flight();
  Ast8.position= new PVector(1000,100);
  Ast8.velocity= new PVector(-10,0);
  Ast8.direction=new PVector(-1,0);
  Ast8.speed=10;
  Ast9=new Flight();
  Ast9.position=new PVector(1000,100);
  Ast9.velocity=new PVector(-13,0);
  Ast9.direction=new PVector(-1,0);
  Ast9.speed=13;
  Ast10=new Flight();
  Ast10.image=loadImage("Asteroid.png");
  Ast10.position=new PVector(1000,250);
  Ast10.velocity=new PVector(-13,0);
  Ast10.direction=new PVector(-1,0);
  Ast10.speed=13;
  Ast11=new Flight();
  Ast11.image=loadImage("Asteroid.png");
  Ast11.position=new PVector(1000,-50);
  Ast11.velocity=new PVector(-13,0);
  Ast11.direction= new PVector(-1,0);
  Ast11.speed=13;
 
  Ast6.image=loadImage("Asteroid.png");
  Ast7.image=loadImage("Asteroid.png");
  Ast8.image=loadImage("Asteroid.png");
  Ast9.image=loadImage("Asteroid.png");
  planet=new Flight();
  planet.image=loadImage("Planet.png");
  planet.position= new PVector(700,300);
  
}

void draw(){
  background(neb);
  timer+= 0.0167;
  
  Medship.velocity.x=(Medship.speed*(left+right));
  Medship.velocity.y=(Medship.speed*(up+down));
  Medship.position.add(Medship.velocity);
  
  Ast1.position.add(Ast1.velocity);
  image(Ast1.image,Ast1.position.x, Ast1.position.y);
  
  if(timer>=2.0){
    Ast2.position.add(Ast2.velocity);
    image(Ast2.image,Ast2.position.x,Ast2.position.y);}
  if(timer>=3.0){
    Ast3.position.add(Ast3.velocity);
    image(Ast3.image,Ast3.position.x,Ast3.position.y);}
   if(timer>=5.0){
    Ast4.position.add(Ast4.velocity);
    image(Ast4.image,Ast4.position.x,Ast4.position.y);}
   if(timer>=7.0){
    Ast5.position.add(Ast5.velocity);
    image(Ast5.image,Ast5.position.x,Ast5.position.y);}
   if(timer>=9.0){
    Ast6.position.add(Ast6.velocity);
    image(Ast6.image,Ast6.position.x,Ast6.position.y);
    Ast7.position.add(Ast7.velocity);
    image(Ast7.image,Ast7.position.x,Ast7.position.y);} 
   if(timer>=12.0){
     Ast8.position.add(Ast8.velocity);
     image(Ast8.image,Ast8.position.x,Ast8.position.y);}
   if(timer>=14.0){
     Ast9.position.add(Ast9.velocity);
     image(Ast9.image,Ast9.position.x,Ast9.position.y);
     Ast10.position.add(Ast10.velocity);
     image(Ast10.image,Ast10.position.x,Ast10.position.y);
     Ast11.position.add(Ast11.velocity);
     image(Ast11.image,Ast11.position.x,Ast11.position.y);}
  
  Medship.image = Medship.normalImage;
  if (left != 0) {
    Medship.image = Medship.leftImage; }
  if (right != 0) {
    Medship.image = Medship.rightImage; }
  if (up!=0){
    Medship.image=Medship.upImage;}
  if(down!=0){
    Medship.image=Medship.downImage;}
  if(down!=0&&left;!=0){
    Medship.image=Medship.downleftImage;}
  if(down!=0&&right;!=0){
    Medship.image=Medship.downrightImage;}
  if(up!=0&&right;!=0){
    Medship.image=Medship.upleftImage;}
  if(up!=0&&left;!=0){
    Medship.image=Medship.uprightImage;}  
    
  pushMatrix();
  translate(Medship.position.x, Medship.position.y);
  image(Medship.image,0,0);
  popMatrix();
  
  if(timer>=16.0){
  image(planet.image,750,175);
  textSize(72);
  fill(0,255,0);
  text("SUCCESS", 450,250);}
  

  boolean collided=Medship.collide(Ast1);
  if(collided==true){ 
    Medship.destroyed=true;
}
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);
     }
   
       
     collided=Medship.collide(Ast2);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
     
    collided=Medship.collide(Ast3);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
    
    collided=Medship.collide(Ast4);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
    
    collided=Medship.collide(Ast5);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
     
     collided=Medship.collide(Ast6);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
    
    collided=Medship.collide(Ast7);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
    
    collided=Medship.collide(Ast8);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
    
    collided=Medship.collide(Ast9);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
    
    collided=Medship.collide(Ast10);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
    
    collided=Medship.collide(Ast11);
   if(collided==true){ 
    Medship.destroyed=true;
    }   
    if(Medship.destroyed==true){
    image(Explosion.image, Medship.position.x + 180, 120+Medship.position.y, 200, 200);
    Medship.speed=0;;
    textSize(72);
    fill(255,0,0);
    text("FAILURE", 450,250);}
   

}






void keyPressed(){
  
  if(key=='w'){
    up=-1; 
  }
  if(key=='s'){
    down=1;}
  if(key=='a'){
    left=-1; }
  if(key=='d'){
    right=1;}
  if(key=='='){
    Medship.speed+=1;}
    
  if(key=='-'){
    Medship.speed-=1;}
}    

void keyReleased(){
  if(key=='w'){
    up=0;}
  if(key=='s'){
    down=0;}
  if(key=='a'){
    left=0;}
  if(key=='d'){
    right=0;}
}




 
  




