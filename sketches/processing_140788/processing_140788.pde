
//by Stase Paxton
//Int.Art OSU -- Project 2
//March 20, 2014



//declare one class
//arrays (mulitple of a class)

Lines l_1;                       //object 1
Lines l_2;                       //object 2
Lines l_3;                       //object 3
Squares s_1;
Squares s_2;
Squares s_3;
Squares s_4;

void setup(){
  size(400,400);
  frameRate(20);
  
  background(150);

  
  
//objects + positions
  //l_1 = new Lines( 100, 100, 150, 375);
  //l_2 = new Lines( 200, 200, 150, 125);
 // l_3 = new Lines( 300, 300, 150, 255);
  s_1 = new Squares(random(45,55), random(400), 15);
  s_2 = new Squares(random(145,155), random(400), 15);
  s_3 = new Squares(random(245,255), random(400), 15);
  s_4 = new Squares(random(345,355), random(400), 15);
}//end setup

void draw(){
 /* if (keyPressed){             //background change
    fill(0);
    rect(0,0,400,400);
  }
*/ 
 /* l_1.display();
  l_1.move();
  l_2.display();
  l_2.move();
  l_3.display();
  l_3.move();
 */ 
  if(keyPressed){
    s_1.display();
    s_1.walk();
    s_2.display();
    s_2.walk();
    s_3.display();
    s_3.walk();
    s_4.display();
    s_4.walk();
  }else{
  s_1.display();
  s_1.move();
  s_2.display();
  s_2.move();
  s_3.display();
  s_3.move();
  s_4.display();
  s_4.move();
  }
}//end draw

//any other voids
//declare class

class Lines{

//declare global variables

float x1, x2, y1, y2;
 


//constructor
Lines(float _x1, float _x2, float _y1, float _y2) {
 x1 = _x1;
 x2 = _x2;
 y1 = _y1;
 y2 = _y2;
} //end constructor


//functions
void display() {
  strokeWeight(2);
  stroke(0);
  line(x1, y1, x2, y2);
  line(x1 - 5, y1-75, x2 - 5, y2 - 150);
  line(x1 + 5, y1 -100, x2 + 5, y2 - 120);
  
}//end display

void move(){
  y1++;
  y2++;
  if(y1 == height){
    y1 = 0;
  }//end if
  if(y2 == height){
    y2 = 0;
  }
}//end move


}//end class declaration
class Squares{

//variables
float r, t, s;


//constructor
Squares( float _r, float _t, float _s){
  r = _r;
  t = _t;
  s = _s;

}//end constructor


//functions
void display(){
  noStroke();
  fill(random(100,200), 0, 0, 50);
  rectMode(CENTER);
  rect(r - 4, t-4, s, s);
  rect(r-10, t-25, s, s);
  rect(r-40, t-35, s, s);
  rect(r+45, t-28, s, s);
  rect(r+20, t+20, s, s);
  rect(r+10, t+43, s, s);
  rect(r+45, t-10, s, s);
  rect(r-20, t+27, s, s);
  rect(r-16, t-16, s, s);
  rect(r+22, t-5, s, s);
  rect(r-30, t+30, s, s);
  
}//end display

void move(){
  if(t == height){
    t = 0;
  }//end if
  t++;
}//end move

void walk(){
   int direction = int(random(4));
    if (direction == 0) {
      r = r + 10;
    } else if (direction == 1) {
      r = r - 10;
    } else if (direction == 2) {
      t = t + 10;
    } else {
      t = t - 10;
    }     
      
}//end walk


}//end class
