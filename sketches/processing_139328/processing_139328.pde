
/*
based in Daniel Shiffman Walker example + Collisions & OOP
Ohio State University, ART3001, SP14
Florence Gouvrit www.gouvrit.org
EX. 1/5 - This example is about objects (same class) as dumb agents 
(Dumb agents don't check on others or on the environment to do their thing)
*/

Walker w1;

void setup(){
  size(800,600);
  background(220);
  //create walker object
  w1 = new Walker();
  frameRate(20);
  }

void draw(){
  w1.walk();
  w1.display();
}

class Walker {

  float x;
  float y;
int s;

  //constructor
  Walker() {
    x = width/2;
    y = height/2;
    s = 3;
  }


  void display() {
    noStroke();
    fill(random(200), 50);
    ellipse(x, y, s, s);
  }

  void walk() {
    int option = int(random(4));
    if (option == 0) {
      //x = x + s;
      x++;
    } else if (option == 1) {
      x--;
    } else if (option == 2) {
      y++;
    } else {
      y--;
    }      

  
  
  x = constrain(x,0,width);
  y = constrain(y,0,height);  
    }
  
}
  



