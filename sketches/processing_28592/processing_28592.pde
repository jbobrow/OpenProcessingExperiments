
PImage level;
PImage [] robo;
PImage [] car;
Robo [] robos;



void setup(){
  size (500,500);
  robo = new PImage [3];
 
  robos = new Robo [100];
for(int i = 0; i < robos.length; i ++) {
  robos[i] = new Robo(random( 100, 400), random(100,400));
}  
  
  for(int i = 0; i< robo.length; i ++) {
  robo[i]= loadImage("robotsuit" + (i+1) + ".png");  
  }
  
  
  
  level= loadImage("mariolevel.jpeg");

  
}



void draw(){

 image(level, 0,0, 500, 500);
 for(int i = 0; i< robos.length; i++){ 
  robos[i].update();  
  }
 
} 
class Robo {
    float x;
    float y;
    float velX;
    float velY;
    float destinY;
    float destinX;
    int counter;
    int frame;
    int speedFrame;
    boolean roboPic;
 

  Robo (float xpos, float ypos) {
   x = xpos;
   y = ypos;
   speedFrame = int (random(2,25));
   destinX= x;
   destinY= y;
   
 
  }
  void update() {
     if(frame > 1) frame= 0;
     pushMatrix();
     translate(x, y);
  
    if(counter%100 ==0){
    destinX =int(random(-100, 600));
    }
    if(counter%60 ==0){
    destinY =int(random(-100, 600));
    }
    x += (destinX-x)*0.01;
    y += (destinY-y)*0.01;
    if(counter%speedFrame==0) {
    frame++;
    }
    
  
    image(robo[frame], -50, -50, 100, 100);
  
    popMatrix();
    counter++;
  }  
}

   
   
   
   



