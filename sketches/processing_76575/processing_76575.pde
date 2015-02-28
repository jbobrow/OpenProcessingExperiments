
import peasy.*;
//CLAIM
particle [] particleLot = new particle [70]; //particle Class [] particle amount


PeasyCam Kcam;


//float Z = 700; setting for camera

void setup(){
  size(700,600,P3D);
  Kcam = new PeasyCam(this,1300); //setting start point
  smooth();
  
  //INITIALIZE
  
  for(int i =0; i< particleLot.length; i++){ //initialize elements appear in the screen different position
  //length indicate above[100] value
    particleLot[i] = new particle(random(0,width),random(0,height)); //[] elements define above[20] //random position
  }
  
}

void draw(){
  background(0); 
  
  stroke(255);
  rotateX(-.5);
  rotateY(-.5);
  fill(255,0,0);
  box(30);
  
  
  noFill();
  //box(900);
  //box(600);
  //box(400);
  //box(300);
  //box(200);
  //box(100);
  
  //Z= Z+0.5; don't have to use this already used PeasyCam
  //camera(500,400,Z,0,0,0, 0,0,1); don't have to use this already used PeasyCam
  
  //CALL Functionality [particle]
  for (int i = 0; i < particleLot.length; i++){ //particle Loop //length indicates particle Class amount [70]
  particleLot[i].run(); //display() -> after [class]void run()
  }
 
}


class particle{
  // Setting VARIABLES
 float x= 0;
 float y= 0; 
 float Xspeed = 0.5;
 float Yspeed = 0.5;
 
  //Builder
  particle(float _x, float _y){
  
    x = _x;
    y = _y;
    
  }
  
  void run(){
    display(); // void display()
    active(); // void active()
    Xcontinousline(); // void Xcontinousline()
    gravity(); //void gravity()
  }
  void gravity(){
    Yspeed += 0.2;
    Xspeed += 0.2;
    Xspeed -= 0.3;
  }
  
  void Xcontinousline(){
    if(x > width){
      Xspeed = Xspeed * -1;
    }
    if(x < 0)  {
      Xspeed = Xspeed * -1;
    }
    if (y > height) {
      Yspeed = Yspeed * -1;
    }
    if(y < 0) {
      Yspeed = Yspeed * -1;
    }
  }
     
  void active(){
  
  x += Xspeed; // call value float Xspeed
  y += Yspeed; // call value float Yspeed
  }
  
  //FUNCTIONS
  void display(){
    for (int i = 100; i < 255; i++) {
        float r = random(55);
        stroke(r*5);
        fill(Xspeed*100,Yspeed*90,Yspeed*40); //(R.G.B) random Color combination
    }
    box(x,y,Xspeed*100); // 
  }
}
   





