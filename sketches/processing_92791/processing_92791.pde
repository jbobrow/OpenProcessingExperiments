
/*pjs@ preload="Med-Ship Layered.png, Med-Ship Layered Downblast.png, Med-Ship Layered Front-Blast.png, Med-Ship Layered Upblast.png, Med-Ship Layered UpBooster.png, Med-Ship Layered DownBooster.png, Med-Ship Layered Backup Blast.png, Med-Ship Layered Backdown Blast.png";*/

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
  float speed;
}


Flight Medship;
float left=0;
float right=0;
float up=0;
float down=0;

PImage back;
void setup(){
  
  
  //imageMode(CENTER);
  size(1250,600);
  background(0,0,0);
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
}

void draw(){
  background(0,0,0);
  
  Medship.velocity.x=(Medship.speed*(left+right));
  Medship.velocity.y=(Medship.speed*(up+down));
  Medship.position.add(Medship.velocity);
  
  Medship.image = Medship.normalImage;
  if (left != 0) {
    Medship.image = Medship.leftImage; }
  if (right != 0) {
    Medship.image = Medship.rightImage; }
  if (up!=0){
    Medship.image=Medship.upImage;}
  if(down!=0){
    Medship.image=Medship.downImage;}
  if(down!=0&&left!=0){
    Medship.image=Medship.downleftImage;}
  if(down!=0&&right!=0){
    Medship.image=Medship.downrightImage;}
  if(up!=0&&right!=0){
    Medship.image=Medship.upleftImage;}
  if(up!=0&&left!=0){
    Medship.image=Medship.uprightImage;}  
    
  pushMatrix();
  translate(Medship.position.x, Medship.position.y);
  image(Medship.image,0,0);
  popMatrix();
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
  




