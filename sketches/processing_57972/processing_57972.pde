
/* is the vibration effect a result of lag or is it embedded in the code?

*/



import processing.opengl.*;
Recto[] rectos;

void setup(){
  size(1000,1000,OPENGL);
  //smooth();
  rectos = new Recto[66];
  for(int i = 0; i < rectos.length; i++){
    rectos[i] = new Recto(i,i,i);
  }
  
}

void draw(){
  background(255);
  lights();
  //directionalLight(255,255,255,1500,0,-400);
  pushMatrix();
    translate(500,0,0);
    //rotateY(map(mouseX,0,width,0,PI*2));
    //rotateX(map(mouseY,0,height,0,PI*2)); //your going to want to hold on to this
     for(int i = 0; i < rectos.length; i++){
  rectos[i].move();
  rectos[i].display();
  }

  popMatrix();


  
}

class Recto {
  float x,y,z,angle,dangle;
  Recto(float _x,float _y, float _z){
    x = _x;
    y = _y;
    z = _z;
    //angle = map(sin(dangle),-1,1,1,666); 
    //angle = map(second(),0,60,13,666);
    angle = random(13-166);
  }

  void move(){
    x = sin(radians(angle));
    y = cos(radians(angle));
    z = tan(radians(angle));
  }
  void display(){
    noStroke();
    fill(255,254,242);
   
    pushMatrix();
      translate(x,500,y);
      rotateY(z);
      rotateX(z);
      box(500);
    popMatrix();
    angle++;
    dangle++;
    
  }
}
      
    

