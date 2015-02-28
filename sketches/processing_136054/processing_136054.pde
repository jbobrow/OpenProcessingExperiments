
//Bot bot;//make a new instance of Bot
Animation animation1;
PImage img;
PImage img2;
PVector gravity= new PVector(0,.4);
//PVector wind=new PVector(-.2,0);
PVector fanup= new PVector(0,-.8);
PImage gameoverImage;
boolean gameover=false;
int score =0;
int index=0;

void setup(){
  size(800,300);
//  bot=new Bot();
  frameRate(24);
  
  
 

   animation1 = new Animation("bird", 8);
  img = loadImage("brick.jpg");
  gameoverImage = loadImage("gameover.jpg");
  
}

void draw(){
  background(255);
  image(img, 0,-50);
  image(img, 0, 150);
  animation1.applyForce(gravity);
  animation1.update();
  animation1.checkEdges();
  animation1.display();
  
  textAlign(CENTER);
  text(score,(width/2),230);
  

  
  
  
   if (mousePressed) {
    animation1.applyForce(fanup);
}

 if (gameover==true) {
   image(gameoverImage,0,0);
    text(score,(width/2),230);
 }
 
   if (millis()>=index+1000 && gameover==false){
    score++;
    index=millis();
  }
  
}

void mousePressed(){
  if (gameover==true) {
  gameover=false;
  animation1 = new Animation("bird", 8);
  score =0;
   index=millis();
  }  
  }
  
  



class Animation{
  PVector location;
  PVector gravity;
  PVector speed;
  PVector accel;
  float mass;
  PImage[] images;
  int imageCount;
  int frame;
  
  
  Animation(String imagePrefix, int count) {
    
    location = new PVector(random(width),110);
    speed = new PVector(random(-2,2), random(-2,1));
    accel=new PVector(0,0);
    mass=5;
      imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 0) + ".gif";
      images[i] = loadImage(filename);
    }
  }



//class Gameover{
//  PImage[] images;
//  
//  
//   Gameover(String imagePrefix, int count) {
//    location = new PVector(0,0);
//    images[2] = loadImage("gameover.jpg");
//    }
//}

  
  void display(){
     frame = (frame+1) % imageCount;
    
    float angle = atan2(speed.y,speed.x);
pushMatrix(); //save original matrix
    rectMode(CENTER);
    translate(location.x,location.y);
    rotate(angle); //rotate 45
    image(images[frame], 0, 0);
popMatrix(); //reset the screen 
    
    
  }
  
  void update(){
    speed.add(accel);
    location.add(speed);
    accel.mult(0);//dice us new accel each frame
  }
  
  void checkEdges(){
    if (location.x>width|| location.x<0){
      speed.x*=-1;
    }
    if(location.y>140){
      location.y=140;
       speed.y=0;
       gameover=true;
       
        
    }
    
    if(location.y<10){
      location.y=10;
      speed.y*=0;
      gameover=true;

    }
    
    
    
  }
  
   void applyForce(PVector force){
    PVector f=force.get();
    f.div(mass);
    accel.add(f);
   // accel.add(force);
 }

  }




