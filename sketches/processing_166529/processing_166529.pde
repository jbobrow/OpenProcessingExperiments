


//learnedaction 
PFont j;
PShape monkey;
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

//time 
hand hand1;
hand hand2;
hand hand3;
hand hand4;
float a= 0.0;
float s= 0.0;


void setup () {
size (600,600);
  createFont ("Damascus", 24);
  textAlign (CENTER);

  fill (0);
  text ("Press 'w', or 'e'", 250, 250);
  
  myball1 = new ball (color(#2917FC),50,150,4,45,45); 
  myball2 = new ball (color(#FF36FC),25,400,3,60,60);
  myball3= new ball (color (#9535E5),10, 75, 4, 50, 50);
  myball4= new ball (color (#35E554), 5, 350, 4, 45, 45);
  myball5= new ball (color (#9535E5), 0, 150, 3, 35, 35);
  myball6= new ball (color (#35E554), 5, 425, 5, 35, 35);
  myball7= new ball (color (#FF36FC), 30, 200, 4, 35, 35);
  myball8= new ball (color (#FC7526), 50, 275, 5, 35, 35);
  myball9= new ball (color (#9535E5), 0, 500, 4, 35, 35);
  myball10= new ball (color (#35E554), 0, 560, 5, 35, 35);
  
  hand1 = new hand (color(#F3FF52),10,50,4,45,45);
  hand2 = new hand (color(#F3FF52),10,500,2,45,45);
  hand3 = new hand (color (#F3FF52), 10, 100,3, 45, 45);
  hand4 = new hand (color (#F3FF52), 10, 425, 5, 45, 45);
  
}

void draw () {

  //if key 'w' or 'W' is pressed, learnedaction will play 
  if (key == 'w' || key == 'W') {
    learnedaction ();
  }
  //if key 'e' or 'E' is pressed, time will play_chapter9 will play
  else if (key == 'e' || key =='E') {
    time ();
  }
 
}


void learnedaction () {
noStroke();
background (#FFFB7E);  

monkey= loadShape ("monkey.svg"); 
 
  
  j= createFont ("Dialog", 30);
  textFont (j);
  textAlign (CENTER);
  
  
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

void time () {
  
  noStroke();
  background (#711B1B);
 
  noStroke();
  rectMode (CENTER);
  frameRate (35);
 
  fill (#4BFFE8);
  ellipse (20, 10, 50, 50);
  ellipse (30, 100, 20, 20);
  ellipse (100, 400, 30, 30);
  ellipse (300, 130, 50, 50);
  ellipse (350, 500, 20, 20);
  ellipse (20, 520, 40, 40);
  ellipse (400, 530, 30, 30);
  ellipse (500, 10, 50, 50);
  ellipse (530, 540, 20, 20);
  
  hand1.move();
  hand1.show ();
  hand2.move();
  hand2.show ();
  hand3.move ();
  hand3.show ();
  hand4.move ();
  hand4.show ();
  

a= a + .05;
s= cos (a) * 2;

translate (width/2, height/2);
scale (s);
fill (#52FF79);
rect (10, 10, 25, 25);

translate (75, 20);
fill (#FFA952);
scale (s);
rect (5, 5, 25, 25);

}

class ball {
  //set global factors without values 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float xsize;
  float ysize;
  
 
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
  
  //class name (Can name classes whatever you want)
class hand {
  //set global factors without values 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float xsize;
  float ysize;
  
  
   hand (color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempXsize, float tempYsize){
     c= tempC;
     xpos = tempYpos;
     ypos = tempYpos;
     xspeed = tempXspeed;
     xsize= tempXsize;
     ysize= tempYsize;
     
   }
   //write any functions the object may need 
   void show () {
     ellipseMode (CENTER);
     fill (c);
     ellipse (xpos, ypos, xsize, ysize);
    
   }
   
   void move () {
     xpos = xpos + xspeed;
     if (xpos > height) 
       xpos= 3; 
}

}


