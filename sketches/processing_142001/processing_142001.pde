
//Arthur Siebesian HW/9 
//March 27, 2014
//Dumb/Intelligent Arrays
//Wasn't 100% positive on these, tried reworking on some of the clas examples, but still pretty difficult concept for me :(


Box b1; //declare
Box b2;
Box b3;
Box b4;
Box b5;
Box b6;
Box b7;
Box b8;
Box b9;
Box b10;
Box b11;
Box b12;
Box b13;
Box b14;
Box b15;
Box b16;
Box b17;

void setup(){
size (800,600);
background (150);

//create(walker(object
b1 = new Box(); //initialize(((Create(New(object)
b2 = new Box();
b3 = new Box();
b4 = new Box();
b5 = new Box();
b6 = new Box();
b7 = new Box();
b8 = new Box();
b9 = new Box();
b10 = new Box();
b11 = new Box();
b12 = new Box();
b13 = new Box();
b14 = new Box();
b15 = new Box();
b16 = new Box();
b17 = new Box();
}
void draw(){
b1.Box(); //call(functions
b1.display();
b2.Box();
b2.display();
b3.Box();
b3.display();
b4.Box();
b4.display();
b5.Box();
b5.display();
b6.Box();
b6.display();
b7.Box();
b7.display();
b8.Box();
b8.display();
b9.Box();
b9.display();
b10.Box();
b10.display();
b11.Box();
b11.display();
b12.Box();
b12.display();
b13.Box();
b13.display();
b14.Box();
b14.display();
b15.Box();
b15.display();
b16.Box();
b16.display();
b17.Box();
b17.display();
}

class Box {
  
  float x;
  float y;
  int s; //size
  
  Box() {
    x = width/2;
    y = height/2;  
    s = 20 ; //size
  }
  
  void display() {
    stroke(0);
    fill(255,0,0);
    ellipse(x, y, s, s);
    stroke(255);
    fill(0);
    triangle(x,y,s,s,23,100);
    
  }
  void Box(){
    int option = int(random(4));
    if(option==0){
    x++;
  }else if (option == 1){
    x--;
   
  }else if (option == 2) {
    y++;
  }else{
    y--;
  }
  }
}

