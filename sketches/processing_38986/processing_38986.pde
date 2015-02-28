
void setup() {
  size(600, 600);
  mycar1 = new Car(80, 90,0 , 20,  color(255,0,0));//7...(xpos,ypos,xpos,speed
  mycar2 = new Car(30, 350, 2, 25,  color(125,125,125));//1
  mycar3 = new Car(40, 150, 4, 60,  color(0,0,255));//80
  mycar4 = new Car(50, 200, -6, 50,  color(0,255,0));//100
  newnumber  = 3;
}

Car mycar1;
Car mycar2;
Car mycar3;
Car mycar4;
int newnumber;



void draw() {
  background(150);
  stroke(255);
  rectMode(CENTER);
  

  if(mousePressed) {
    background(255);
    stroke(0);//adding a background change
    mycar1.display();
     stroke(0);// a change in stroke when pressed as well
    mycar2.display();
     stroke(0);
    mycar3.display();
    stroke(0);
    mycar4.display();
    stroke(0);
  }
  
  else {  
    mycar1.display();//loop cycle
    mycar1.drive();
    
    mycar2.display();
    mycar2.drive();
    
    mycar3.display();
    mycar3.drive();
   

    mycar4.display();
    mycar4.drive();
    
  }
}

class Car {
  int xpos;//the position of the car in the x
  int ypos;// position of car in y
  int xpos2;//second position in x, 
  int speed;//
   color carcolor;


  Car(int tempXpos, int tempYpos, int tempXpos2, int tempSpeed, color tempColor) {
    xpos = tempXpos;
    ypos = tempYpos;
    xpos2= tempXpos2;//just playing with it seeing if something changed
    speed = tempSpeed;
    carcolor= tempColor;
  }

  void display() {
    fill(carcolor);
    rect(xpos, ypos, 60, 10);
  }

  void drive() {
    xpos = xpos + speed; // it will advance from the starting position0
    if (xpos>width) {
      xpos=0;
     
    }
  }
}
  


