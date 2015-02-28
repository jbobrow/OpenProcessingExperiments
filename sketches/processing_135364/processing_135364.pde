
//varibles
Usagi myUsagi;
Usagi myUsagi2;
Usagi myUsagi3;
Usagi myUsagi4;
Usagi myUsagi5;
Usagi myUsagi6;

//setup()

void setup(){
  size(500,500);
  myUsagi= new Usagi((int)width/2, (int)height/2, 1, 2);
  myUsagi2= new Usagi((int)random(width), (int)random(height), 1, 2);
  myUsagi3= new Usagi((int)width/3, (int)height/4, 1, 2);
  myUsagi4= new Usagi((int)width/6, (int)height/5, 1, 2);
   myUsagi5= new Usagi((int)width/9, (int)height/3, 1, 2);
    myUsagi6= new Usagi((int)width/2, (int)height/7, 1, 2);
  
}

//draw()
void draw(){
  background(205,33,44);
  myUsagi.display();
  myUsagi.move();
  myUsagi.bounce();
  
  myUsagi2.display();
  myUsagi2.move();
  myUsagi2.bounce();
  
  myUsagi3.display();
  myUsagi3.move();
  myUsagi3.bounce();
  
  myUsagi4.display();
  myUsagi4.move();
  myUsagi4.bounce();
  
   myUsagi5.display();
  myUsagi5.move();
  myUsagi5.bounce();
  
   myUsagi6.display();
  myUsagi6.move();
  myUsagi6.bounce();
}

//functions()



class Usagi{
 //varibles

int xPos;
int yPos;
int xSpeed;
int ySpeed;

//Constructor
Usagi(int _xPos, int _yPos, int _xSpeed, int _ySpeed){
 xPos = _xPos;
 yPos = _yPos;
 xSpeed = _xSpeed;
 ySpeed = _ySpeed; 
}
  //methods 
  void display(){
    ellipse(xPos, yPos, 50, 50);
  }
  
  void move(){
   xPos =xPos + xSpeed;
  yPos =yPos + ySpeed;
 
  }
  
  void bounce(){
   if (xPos > width || xPos < 0){
     xSpeed = xSpeed * -1;
    
  }
  
  if (yPos > height || yPos< 0){
    ySpeed = ySpeed * -1;
  }
  
}


}


