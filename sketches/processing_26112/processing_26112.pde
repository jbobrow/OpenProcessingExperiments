
// Jade Tindal 2011

// DECLARE VARIABLES

int x = 0; 
int speed = 1;
Blackdot dot1;
Blackdot dot2;

//INITIAL SETTINGS

void setup (){
size(500,500);
smooth();
dot1 = new Blackdot();
dot2 = new Blackdot();
}

//REPEAT

void draw (){
 background (244,55,30);
 x = x+speed;
 move();
 bounce();
 display();
 
 dot1.showDot();
 dot1.moveDot();
  
 dot2.showDot();
 dot2.moveDot();
}
 
 void move(){
 x = x + speed;
 }

void bounce (){
 if ((x>width) ||(x<0)){
  speed = speed *-1; 
}
}

void display(){
   stroke (0);
fill(30,166,247);
ellipse(x,70,130,90);
 stroke (0);
fill(175);
ellipse(x,100,100,100);
stroke (0);
fill(0);
ellipse(x-18,90,10,20);
ellipse(x+18,90,10,20);
ellipse(x,120,25,25);
}


//EVENT HANDLERS

void mousePressed (){
  if (speed ==0){
 speed = 6;
  }
  else {
 speed = 0; 
}
}


//CUSTOM FUNCIONS





//CLASSES

class Blackdot {
float xPos;
float yPos;
float speed;

Blackdot (){
 xPos = random (20,width-20);
yPos = random (20, height-20);
speed = random (1,5);
}

void showDot(){
fill (0);
ellipse (xPos,yPos,20,20);
}

void moveDot (){
 xPos += speed;
if (xPos > width){
 xPos = 0;
} 
}

}

