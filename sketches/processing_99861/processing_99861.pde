
//Timer myTimer();
PImage myImage1;
PImage myImage2;
PImage myImage3;
PImage myImage4;

Bullet[] bullets= new Bullet[6];
Life[] life= new Life[3];
Target[] target= new Target[100];

void setup(){
  size(800, 800);
  myImage1=loadImage("background.jpg");
 myImage2=loadImage("bullet.png");
  myImage3=loadImage("crosshair.png");
  myImage4=loadImage("target.png");
  
  for(int i=0; i<bullets.length; i++){
    bullets[i]= new Bullet(myImage2);
  }
 
  for(int i=0; i< life.length; i++){
   life[i]= new Life();
 }
  for(int i=0; i<target.length; i++){
    target[i]= new Target(myImage4);
   }
}

void draw(){
  image(myImage1, 0, 0, 800, 800);
  for(int i=0; i<bullets.length; i++){
    bullets[i].display();
  }
   
    for(int i=0; i<life.length; i++){
    life[i].display();
   }
   
   for(int i=0; i<target.length; i++){
    target[i].display();
    
   }
    noCursor();
  image(myImage3, mouseX, mouseY, 50, 50);
    
}


     
     
  
  
    
  


class Bullet{
float xpos;
int ypos;
PImage myImage2;
 
  Bullet(PImage _myImage2){
    
    xpos=random(545,700);
    ypos=570;
    
    myImage2= _myImage2;
  }
    
    void display(){
      image(myImage2, xpos, ypos, 70, 70);
    }
  }
    
class Life{
  float xpos;
  int ypos;
  int w;
  int h;
  
 Life(){
   xpos= random(545,700);
   ypos=650;
   w=50;
   h=50;
 }
  
  
  void display(){
    stroke(121, 2, 2);
    fill(255,0,0);
    rect(xpos, ypos, w, h);
  }

}
class Target{
float xpos;
float ypos;
PImage myImage4;
 
  Target(PImage _myImage4){
    
    xpos=random(0,700);
    ypos=random(0,470);
    
    myImage4= _myImage4;
  }
    
    void display(){
      image(myImage4, xpos, ypos, 80, 80);
    }
  }
    



