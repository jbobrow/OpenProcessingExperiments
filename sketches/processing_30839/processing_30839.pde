
//Falling Object Class
class FallingObject{
  float xpos;
  float ypos;
  float yspeed;
  boolean caught;
  PImage im;
  color c;
  
  FallingObject(color objcolor, float x,float y, float speed){
      c = objcolor;
      xpos = x;
      ypos = y;
      yspeed = speed;
}
void show(){
  im = loadImage("sa_onesample48.gif");
  im.resize(15,15);
  image(im, xpos,ypos);
    stroke(0);
    fill(c);
  
  }
  
void fall(){
  ypos += yspeed;
  if(ypos > height){
    ypos = 0;
  }


}
}

  
  //Game class
Game game;
void setup(){
  size(500,500);
  game = new Game(10,12);
}

void draw(){
  background(255);
  game.start();
 
}
class Game{
   
   int score;
   int numfall;
   ArrayList fallers;
   Game(int falling, int win) { 
     numfall = falling; 
     fallers = new ArrayList(numfall);
 }

void refill(){
  for(int i=0; i < numfall; i++) {
    fallers.add(new FallingObject(color(random(255),random(255),random(255)),random(width),0,random(3)));
    
   
   }
 }
 
void start(){
  refill();
  for(int i=0; i < numfall; i++){
    ((FallingObject)fallers.get(i)).show();
    ((FallingObject)fallers.get(i)).fall();

}
  
 }
  
 void checkfallers(){
   if(fallers.size() == 0){
     refill();
    }
  }

}
              
                

