
void setup() {
  frameRate(20);
  size(700,700);
  //Initialize custom made decorative background
gamebg = new BG();
  //Initialize actual Processing background. This enables the player to leave a Frog imprint whenever they reach the end. 
background(32,139,18);
//Initialize Cars
car1 = new Car(0,375,-7); 
car2 = new Car(255,420,6);
car3 = new Car(200,465,-7); 
car4 = new Car(350,510,6);
car5 = new Car(500,555,-6); 
car6 = new Car(350,375,-7); 
car7 = new Car(650,420,6);
car8 = new Car(350,465,-7); 
car9 = new Car(125,510,6);
car10 = new Car(75,555, -6); 
//Initialize logs
log1 = new Log(75, 65, -4);
log2 = new Log(475, 65, -4);
log3 = new Log(350, 110, 6);
log4 = new Log(650, 110, 6);
log5 = new Log(350, 155, -4);
log6 = new Log(650, 155, -4);
log7 = new Log(350, 200, 6);
log8 = new Log(500, 200, 6);
log9 = new Log(350, 245, -4);
log10 = new Log(200, 245, -4);
log11 = new Log(0, 290, 6);
log12 = new Log(255, 290, 6);

//Initialize Gators
gator1 = new Gator(175, 80, -15);
gator2 = new Gator(525, 80, -12);
gator3 = new Gator(425, 125, 11);
gator4 = new Gator(500, 125, 13);
gator5 = new Gator(250, 170, -12);
gator6 = new Gator(550, 170, -15);
gator7 = new Gator(150, 215, 13);
gator8 = new Gator(50, 215, 11);
gator9 = new Gator(475, 260, -17);
gator10 = new Gator(300, 260, -15);
gator11 = new Gator(50, 305, 12);
gator12 = new Gator(370, 305, 13);


//Initialize Frog
Frogger = new Frog(350,620);
}

void draw() {
gamebg.showBG();


 
  //Logs
  log1.move();
  log1.display();
  log2.move();
  log2.display();
  log3.move();
  log3.display();
  log4.move();
  log4.display();
  log5.move();
  log5.display();
  log6.move();
  log6.display();
  log7.move();
  log7.display();
  log8.move();
  log8.display();
  log9.move();
  log9.display();
  log10.move();
  log10.display();
  log1.move();
  log1.display();
  log2.move();
  log2.display();
  log3.move();
  log3.display();
  log4.move();
  log4.display();
  log5.move();
  log5.display();
  log6.move();
  log6.display();
  log7.move();
  log7.display();
  log8.move();
  log8.display();
  log9.move();
  log9.display();
  log10.move();
  log10.display();
  log11.move();
  log11.display();
  log12.move();
  log12.display();
  //Frogger rides logs going left to the left
   if (log1.ride(Frogger)) {
  Frogger.rideleft(); }
  if (log2.ride(Frogger)) {
  Frogger.rideleft();}
if (log5.ride(Frogger)) {
  Frogger.rideleft();}
if (log6.ride(Frogger)) {
  Frogger.rideleft();}
if (log9.ride(Frogger)) {
  Frogger.rideleft();}
if (log10.ride(Frogger)) {
  Frogger.rideleft();}
  //Frogger rides logs going right to the right
  if (log3.ride(Frogger)) {
  Frogger.rideright(); }
  if (log4.ride(Frogger)) {
  Frogger.rideright();}
if (log7.ride(Frogger)) {
  Frogger.rideright();}
if (log8.ride(Frogger)) {
  Frogger.rideright();}
if (log11.ride(Frogger)) {
  Frogger.rideright();}
if (log12.ride(Frogger)) {
  Frogger.rideright();}
  
   //Frog
  Frogger.show();
  
  //Gators
gator1.move();
gator1.display();
gator2.move();
gator2.display();
gator3.move();
gator3.display();
gator4.move();
gator4.display();
gator5.move();
gator5.display();
gator6.move();
gator6.display();
gator7.move();
gator7.display();
gator8.move();
gator8.display();
gator9.move();
gator9.display();
gator10.move();
gator10.display();
gator11.move();
gator11.display();
gator12.move();
gator12.display();
gator12.move();

//They kill Frogger
if (gator1.intersect(Frogger)) {
    Frogger.die();
}if (gator2.intersect(Frogger)) {
    Frogger.die();
}if (gator3.intersect(Frogger)) {
    Frogger.die();
}if (gator4.intersect(Frogger)) {
    Frogger.die();
}if (gator5.intersect(Frogger)) {
    Frogger.die();
}if (gator6.intersect(Frogger)) {
    Frogger.die();
}if (gator7.intersect(Frogger)) {
    Frogger.die();
}
if (gator8.intersect(Frogger)) {
    Frogger.die();
}if (gator9.intersect(Frogger)) {
    Frogger.die();
}if (gator10.intersect(Frogger)) {
    Frogger.die();
}
if (gator11.intersect(Frogger)) {
    Frogger.die();
}if (gator12.intersect(Frogger)) {
    Frogger.die();
}

  
  //Cars
car1.move();
car1.display();
car2.move();
car2.display();
car3.move();
car3.display();
car4.move();
car4.display();
car5.move();
car5.display();
car6.move();
car6.display();
car7.move();
car7.display();
car8.move();
car8.display();
car9.move();
car9.display();
car10.move();
car10.display();

//If Frogger gets hit by a car, he dies and is replaced by his clone brother at the start.
if (car1.intersect(Frogger)) {
    Frogger.die();
}if (car2.intersect(Frogger)) {
    Frogger.die();
}if (car3.intersect(Frogger)) {
    Frogger.die();
}if (car4.intersect(Frogger)) {
    Frogger.die();
}if (car5.intersect(Frogger)) {
    Frogger.die();
}if (car6.intersect(Frogger)) {
    Frogger.die();
}if (car7.intersect(Frogger)) {
    Frogger.die();
}
if (car8.intersect(Frogger)) {
    Frogger.die();
}if (car9.intersect(Frogger)) {
    Frogger.die();
}if (car10.intersect(Frogger)) {
    Frogger.die();
}


}


BG gamebg;
Car car1;
Car car2;
Car car3;
Car car4;
Car car5;
Car car6;
Car car7;
Car car8;
Car car9;
Car car10;
Log log1;
Log log2;
Log log3;
Log log4;
Log log5;
Log log6;
Log log7;
Log log8;
Log log9;
Log log10;
Log log11;
Log log12;
Log log13;
Log log14;
Frog Frogger;
Gator gator1;
Gator gator2;
Gator gator3;
Gator gator4;
Gator gator5;
Gator gator6;
Gator gator7;
Gator gator8;
Gator gator9;
Gator gator10;
Gator gator11;
Gator gator12;
Gator gator13;
Gator gator14;
Gator gator15;
class BG {
  

  

  void showBG(){
  rectMode(CORNER);
  smooth();

//Start
 fill(50);
 rect(0,600,700,200);
 
 //Halfway point
 fill(50);
 rect(0,325,700,48);
 
 //Lilypads
  noFill();
 ellipse(80,35,55,55);
 ellipse(215,35,55,55);
 ellipse(350,35,55,55);
 ellipse(485,35,55,55); 
 ellipse(620,35,55,55);
   
  //Lilypad backgrounds
  noStroke();
  fill(18,85,3);
  rect(0,0,52,75);
  rect(106,0,82,75);
  rect(241,0,82,75);
  rect(376,0,82,75);
  rect(511,0,82,75);
  rect(646,0,82,75);   
  rect(0,0,700,5);
 
 //water
 fill(0,0,120);
 rect(0, 60, 700, 264);

  //Road
  //stroke(0);
  fill(145);
  rect(0,373,700,226);
  
 
  
  

  }

  

}
class Car { 
  //Car variables
  float xpos;
  float ypos;
  float xspeed;
  float c = random(0,500);
  float cr;
  Car(float tempXpos, float tempYpos, float tempXspeed) {
    c = random(57,255);
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
//Shows the car
  void display() {
    rectMode(CORNER);
    cr = 15;
    noStroke();
    fill(c,23,45);
    rect(xpos,ypos,cr*3,cr*2);
    fill(random(255),random(255),124);
    ellipse(xpos+23,ypos+15,9,9);
    fill(250);
    ellipse(xpos+9,ypos-3,9,9);
    ellipse(xpos+9,ypos+33,9,9);
    ellipse(xpos+36,ypos-3,9,9);
    ellipse(xpos+36,ypos+33,9,9);
    
  }
//Moves the car
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = 700;
    }
  }
  //Kills the frog if they intersect
  boolean intersect(Frog a) {
    float distance = dist(xpos,ypos,a.x_,a.y_);
    if (distance < cr + a.r -5 ) {
      return true;
    } else {
      return false;
    }
    
  }
  

}


class Frog {
  
  int x_,y_,r;
  

 Frog(int frogxpos, int frogypos) {
       //Frog Variables  
       
       x_ = frogxpos;
       y_ = frogypos;

 }
  

    void show() {
         r = 15;
        smooth();
      fill(51,165,27);
      stroke(0);
      strokeWeight(2);
      rect(x_-10,y_+4,8,8); //Leg #1
      rect(x_+10,y_+4,8,8); //Leg #2
      ellipse(x_,y_,r*2,r*2);//Body
      fill(0);
      rect(x_+6,y_-17,8,8); //Eye #1
      rect(x_-13,y_-17,8,8); //Eye #2
      strokeWeight(2);
      fill(51,165,27);
      rect(x_-18,y_+4,8,8); //leg
       if (y_ < 50) {
      x_ = 350; 
      y_ = 620;}
    
    }

//Commands to make the Frog move

  void Down(){ 
    y_= y_+45;} 
    
  void Up(){ 
    y_= y_-45;} 
    
  void Left(){ 
    x_= x_-45;} 
    
  void Right(){ 
    x_= x_+45;}
    
  
     //When the frog dies.  
  void die(){ 
    x_= 350;
    y_= 620; } 
    
    //When the frog jumps on a log going right
    void rideright() {
      x_ = x_ + 16; }
      
    void rideleft() {
      x_ = x_ - 8; }
     
}  

void keyPressed(){ 
  if(key==CODED){ 
    if(keyCode==DOWN){ 
    Frogger.Down(); } 
    else if(keyCode==UP){ 
    Frogger.Up();} 
    else if(keyCode==LEFT){ 
    Frogger.Left();} 
    else if(keyCode==RIGHT){ 
    Frogger.Right();} 
  }} 


    
    
    
class Gator {
  float xpos, ypos, mr, xspeed;
  
  Gator(float tempXpos, float tempYpos, float tempXspeed) {
    
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  //Shows the gators
  void display() {
  mr = 7;
  fill (17,115,12);
  rect(xpos,ypos,mr*5,mr*2.7);
  fill(250);
  ellipse(xpos-7,ypos+1, 5,5);
  strokeWeight(3);
  line(xpos-14,ypos+5, xpos -5, ypos -10);
  }
  //Moves the gators
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = 700;
    }
  }
  
    boolean intersect(Frog a) {
    float distance = dist(xpos,ypos,a.x_,a.y_);
    if (distance < mr + a.r -5 ) {
      return true;
    } else {
      return false;
    }
    
  }
}

class Log { 
  float xpos;
  float ypos;
  float xspeed;
 float lr; 
  Log(float tempXpos, float tempYpos, float tempXspeed) { 
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
//Shows the log
  void display() {
    lr = 15;
    stroke(0);
    fill(162,101,8);
    rect(xpos,ypos,lr*3,lr*2);
    fill(0);

    
  }
//Moves the log
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = 700;
    }
  }
    boolean ride(Frog a) {
    float distance = dist(xpos+15,ypos+15,a.x_,a.y_);
    if (distance < lr + a.r  ) {
      return true;
    } else {
      return false;
    }
    
  }
}


