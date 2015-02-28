
/*
based in Daniel Shiffman Walkers. + Object Arrays + collisions
Ohio State University, ART3001, SP14
Florence Gouvrit www.gouvrit.org
EX. 5/5 - This example is about objects Arrays + Collisions
*/

Walker[] w = new Walker [10];  //declare 1 array of walkers

void setup(){
  size(800,600);
  background(220);
  frameRate(20);
    
//CREATE OBJECTS
 for (int i = 0; i < w.length; i ++ ) {    // Initialize each walker with for loop.
    w[i] = new Walker(); 
  }//--end loop: ini
}//--end setup()

void draw(){
  for (int i = 0; i < w.length; i++ ) { // Run each object with a for loop.
    w[i].walk();
    w[i].display();
  
  
    for (int j = 0; j < w.length; j++ ) {     // check each object with a for loop.
       if ( (  w[i].intersect(w[j]) )  ) {     //pass w[j] to the intersect function * 
            w[i].inter(); 
          //println("collide");            // if boolean "intersect" == true --> run inter()
           } else {
           w[i].no_inter();
           }//--end if       
    }//--end loop2
  
  
  } //--end loop1
    
  if (keyPressed)         //Press R to restart
  if (key == 'r' || key == 'R') {
  setup();
} //--end keyPressed


}//--end draw()

class Walker {

  float x, y;
  int s;
  color c = color(100, 50);  //no more random. It only gets dark ifspots overlap

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
  }//--end display

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
    }//--end Walk
    
 //INTERSECT & NOT INTERSECT FUNCTIONS: CHANGE COLOR 
    void inter() { 
    c = color(255,0,0);   //red 50% transparency
    fill(c);
    text("x", x, y);
  }
    void no_inter() {      //back to grey
    c = color(50, 10);
    }
  
  //CHECK OTHER WALKERS FUNCTION
 boolean intersect(Walker w0) {   // Use Object as arguments in functions 
  float d = dist(x,y,w0.x,w0.y);  //distance between my X,Y and the walker that was passed X,Y *
 if ((d > 0) && (d < s*5)) {                   //multiplying s*3 just to increase possibility
    return true;
  } else {
    return false;
    }
  }//--end boolean

 
  
  
}//--end Class
  



