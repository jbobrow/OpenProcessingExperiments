
hand hand1;
hand hand2;
hand hand3;
hand hand4;

float a= 0.0;
float s= 0.0;


void setup () {
  size (600,600);

 
  hand1 = new hand (color(#F3FF52),10,50,4,45,45);
  hand2 = new hand (color(#F3FF52),5,500,4,45,45);
  hand3 = new hand (color (#F3FF52), 20, 100,4, 45, 45);
  hand4 = new hand (color (#F3FF52), 40, 425, 5, 45, 45);
  noStroke();
  rectMode (CENTER);
  frameRate (35);
  rect (5, 5, 30, 30);
  rect (25, 25, 30, 30);
 
}

void draw () {
  
  noStroke();
  background (#B73521);
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



if (mousePressed) {
  background (#B73521);
  fill (#E5FF52);
  
  rect (5,5, 40, 40);
  rect (550, 5, 40, 40);
  rect (5, 550, 40, 40);
  
  rect (550, 550, 40, 40);
  rect (230, 210, 130, 130);
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
  
  //constructor
  //temp is a placeholder 
  //advantage to not give values, when you intitate class you can change values
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


