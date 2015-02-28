
Ocells[] ocells = new Ocells[20];
Grog[] grog = new Grog[20];

PImage foto;

void setup(){
  size (1000, 800);
  foto=loadImage("http://spottydotty.co.nz/wp-content/uploads/2012/12/angry-birds-sqare-1024x1024.jpg");
  for (int i = 0; i < ocells.length;i++){
    ocells[i] = new Ocells(0, random(height), random (1,4));
  }
  for (int i = 0; i < grog.length;i++){
    grog[i] = new Grog(0, random(height), random (1,4));
  }
}
void draw(){
  image(foto,0,0);
  for (int i = 0; i < ocells.length;i++){
   ocells[i].vermell();
   ocells[i].moure();
  }
  for (int i = 0; i < grog.length;i++){
   grog[i].grog();
   grog[i].moure();
  }
 }
class Grog {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  Grog(){
    xPos = width/2;
    yPos = height/2;
    xSpeed = 10;
    ySpeed = 10;
  }
  Grog(float x, float y, float vel){
    xPos = x;
    yPos = y;
    xSpeed = vel;
    ySpeed = vel;
  }
  void grog(){
    //triangle grog
    stroke(0);
    strokeWeight(3);
    fill(#FFFF00);
    triangle(xPos-40,yPos,xPos-10,yPos-70,xPos+40,yPos);
    
    //ulls
    fill(255);
    strokeWeight(1);
    ellipse(xPos-5,yPos-30,15,15);
    ellipse(xPos+12,yPos-30,15,15);
      //punt negre
      fill(0);
      ellipse(xPos-5,yPos-30,2,2);
      ellipse(xPos+10,yPos-30,2,2);
   //celles
   stroke(#B45F04);
   strokeWeight(6);
   line(xPos-12,yPos-40,xPos+2,yPos-35);
   line(xPos+4,yPos-35,xPos+16,yPos-40);
   
   //nas
   fill(#FFBF00);
   stroke(0);
   strokeWeight(1);
   triangle(xPos,yPos-30,xPos-5,yPos-20,xPos+20,yPos-20);
   triangle(xPos,yPos-15,xPos-5,yPos-20,xPos+10,yPos-20);
   
    //cua
   strokeWeight(6);
   line(xPos-30,yPos-30,xPos-40,yPos-30);
   line(xPos-30,yPos-30,xPos-40,yPos-40);
   line(xPos-30,yPos-30,xPos-40,yPos-20);
   
   //cabell
   line(xPos-10,yPos-70,xPos-20,yPos-80);
   line(xPos-10,yPos-70,xPos-17,yPos-70);
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
  }
}
class Ocells {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  Ocells(){
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
    ySpeed = 1;
  }
  Ocells(float x, float y, float vel){
    xPos = x;
    yPos = y;
    xSpeed = vel;
    ySpeed = vel;
  }
  void vermell(){
    //rodona vermella
    fill(255,0,0);
    stroke(0);
    strokeWeight(1);
    ellipse (xPos -10, yPos -10, 60, 60);
    
    //ulls
    fill(255);
    ellipse (xPos -10, yPos-20, 20, 20);
    ellipse (xPos+10, yPos-20, 20, 20);
      //negres
      fill(0);
      ellipse (xPos -10, yPos-20, 3, 3);
      ellipse (xPos+10, yPos-20, 3, 3);
      
    //rodona beix
    fill(#F5DA81);
    noStroke();
    ellipse (xPos-5, yPos+7, 35, 22);
    
    //celles
    stroke(0);
    strokeWeight(5);
    line(xPos,yPos-23,xPos-15,yPos-30);
    line(xPos,yPos-23,xPos+15,yPos-30);
    
    //nas
    fill(#FFBF00);
    strokeWeight(1);
    triangle (xPos,yPos-15 , xPos-10,yPos-2, xPos+20,yPos-2);
    triangle (xPos,yPos+6 , xPos-10,yPos-2, xPos+12,yPos-2);
    //cua
    stroke(0);
    strokeWeight(5);
    line(xPos-45,yPos-10,xPos-40,yPos-10);
    line(xPos-45,yPos,xPos-40,yPos-10);
    
    //cresta
    stroke(255,0,0);
    strokeWeight(5);
    line(xPos-20,yPos-42,xPos-10,yPos-40);
    line(xPos-20,yPos-50,xPos-10,yPos-40);
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
    yPos = (yPos + ySpeed)%height;
  }
}


