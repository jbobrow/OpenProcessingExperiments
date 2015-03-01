
Neu [] boles;
PImage fons;
void setup(){
  size(400,225);
  fons = loadImage("fons.jpg");
  //CONFIGUREM L'ARRAY
  boles = new Neu[50];
  for(int i=0; i<50; i++)
  {
     
    boles[i] = new Neu();
    boles[i].posY = random(-height,height*3);
    boles[i].posX = random(-width,width*2);
  }
}
void draw(){
  background(0);
  image(fons, 0, 0);
   for(int i=0; i<boles.length; i++)
  {
    
    boles[i].dibuixar(); 
    boles[i].movX(); 
    boles[i].movY(); 
}
  } 

class Neu{
  float posX, posY;
  
  Neu(){
    posX = 150;
    posY = 100;
  }
  
  void dibuixar(){
    noStroke();
    ellipse(posX - 5, posY-10, 10, 10);
  }
  float movX(){
      posX = posX +random(-5,5);    
      if (posX <0) posX = 0;   
      if (posX >width) posX = width;
      return posX;
    }
    float movY() {
      posY = posY + random(3,6);
      if (posY <0) posY = 0; 
      if (posY >height) posY = 0;
      return posY;
    }

}
  


