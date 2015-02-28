
/*
based in Daniel Shiffman Walker. + Collisions + Arrays.
Ohio State University, ART3001, SP14
Florence Gouvrit www.gouvrit.org
EX. 4/5 - This example is about creating objects Arrays. Collisions added in next example 5/5
*/

//Walker w1;                   //here you would declare only 1 walker
Walker[] w = new Walker [10];  //instead we declare 1 array of 10 walkers

void setup(){
  size(800,600);
  background(220);
  frameRate(20);
    
//CREATE OBJECTS
//  w1 = new Walker();               //here ou would initialize only 1 walker
 for (int i = 0; i < w.length; i ++ ) {    // instead, we initialize each walker with a for loop.
    w[i] = new Walker(); 
  }//--end loop: ini
}//--end setup()

void draw(){
  for (int i = 0; i < w.length; i++ ) { // simple functions run through a for loop.
  w[i].walk();
  w[i].display();
  }//--end loop: functions
  
  
  if (keyPressed)         //Press R to restart
  if (key == 'r' || key == 'R') {
  setup();
} //--end keyPressed


}//--end draw()

class Walker {

  float x;
  float y;
  int s;

  //constructor
  Walker() {
    x = random(width);
    y = random(height);
    s = 5;
  }


  void display() {
    noStroke();
    fill(random(200), 50);
    ellipse(x, y, s, s);
  }

  void walk() {
    int option = int(random(4));
    if (option == 0) {
      x = x + s;
    } else if (option == 1) {
      x = x - s;
    } else if (option == 2) {
      y = y + s;
    } else {
      y = y - s;
    }      
     
  
  
  x = constrain(x,0,width);
  y = constrain(y,0,height);  
    }
  
}
  



