
ball myball1;
ball myball2;
ball myball3;
ball myball4;
ball myball5;
ball myball6;
ball myball7;
ball myball8;
ball myball9;
ball myball10;

PFont j;
PShape monkey;

void setup () {
  size (600,600);
monkey= loadShape ("monkey.svg"); 
 
  myball1 = new ball (color(#2917FC),50,150,4,45,45);
  myball2 = new ball (color(#FF36FC),25,400,3,60,60);
  myball3= new ball (color (#9535E5),10, 75, 4, 50, 50);
  myball4= new ball (color (#35E554), 5, 350, 4, 45, 45);
  myball5= new ball (color (#FC7526), 0, 150, 3, 35, 35);
  myball6= new ball (color (#2917FC), 20, 425, 5, 35, 35);
  myball7= new ball (color (#FF36FC), 30, 200, 4, 35, 35);
  myball8= new ball (color (#FC7526), 50, 275, 5, 35, 35);
  myball9= new ball (color (#9535E5), 0, 500, 4, 35, 35);
  myball10= new ball (color (#35E554), 0, 560, 5, 35, 35);
  
  j= createFont ("Dialog", 30);
  textFont (j);
  textAlign (CENTER);
}

void draw () {
  noStroke();
  background (#FFFB7E);
  myball1.drive();
  myball1.display ();
  myball2.drive();
  myball2.display ();
  myball3.drive();
  myball3.display ();
  myball4.drive();
  myball4.display ();
  myball5.drive();
  myball5.display ();
  myball6.drive();
  myball6.display ();
  myball7.drive();
  myball7.display ();
  myball8.drive();
  myball8.display ();
  myball9.drive();
  myball9.display ();
  myball10.drive();
  myball10.display ();
  
fill (#3472B2);
text ("CLICK", 300, 250);

if (mousePressed) {
  background (#FFFB7E);
  shape (monkey, 75, 200, 400, 400);
  text ("hello", 240, 250); }

}
    
  
//class name (Can name classes whatever you want)
class ball {
  //set global factors without values 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float xsize;
  float ysize;
  
  //constructor
  //temp is a placeholder 
  //advantage to not give values, when you intitate class you can change values
   ball (color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempXsize, float tempYsize){
     c= tempC;
     xpos = tempYpos;
     ypos = tempYpos;
     xspeed = tempXspeed;
     xsize= tempXsize;
     ysize= tempYsize;
     
   }
   //write any functions the object may need 
   void display () {
     rectMode (CENTER);
     fill (c);
     rect (xpos, ypos, xsize, ysize);
    
   }
   
   void drive () {
     xpos = xpos + xspeed;
     if (xpos > height) 
       xpos= 3; 
}

}






