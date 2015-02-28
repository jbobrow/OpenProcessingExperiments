
/*
Midterm project
-Graham Strang
-Universal gravitation simulation
-Connecting 3 points in space with gravitational force.
-Uses vectors, if statements, mouse input, key input, acceleration,
 distance tracking, and mapping.
-Canniballized code from the PVector tutorial
 processing.org/learning/pvector
*/

Mover mover;

void setup() {
  size(800,800);
  smooth();
  background(255);
  mover = new Mover();
  
}
 
void draw() {
  noStroke();
  fill(0,100);
  rect(0,0,width,height);
  fill(255);
  text("Universal Gravitation Sim." ,25, 25);
  text("'G' key toggles gravity" , 50, 50);
  text("'R' key resets. Press any key to restart after reset.", 75, 75);
 
  mover.update();
  mover.checkEdges();
  mover.display(); 
}

class Mover {
  PVector location1;
  PVector location2;
  PVector location3;
  PVector location4;
  PVector velocity1;
  PVector velocity2;
  PVector velocity3;
  PVector velocity4;
  PVector acceleration1;
  PVector acceleration2;
  PVector acceleration3;
  PVector acceleration4;
  PVector acceleration5;
  PVector acceleration6;
 
  Mover() {
    location1 = new PVector(width/2, height/2); //my own setting
    location2 = new PVector((width/2)-30,(height/2)-30);
    location3 = new PVector((width/2)-100,(height/2) + 100);
    velocity1 = new PVector(0,0); //my own setting
    velocity2 = new PVector(-2.5,2.5);
    velocity3 = new PVector(3,3);
    
    //object gravities 
    acceleration1 = new PVector(0,0); //#1 to 2
    acceleration2 = new PVector(0,0); //#2 to 1
    acceleration3 = new PVector(0,0); //#3 to 1
    acceleration4 = new PVector(0,0); //#1 to 3
    acceleration5 = new PVector(0,0); //#2 to 3
    acceleration6 = new PVector(0,0); //#3 to 2
  
  }
 
  void update() {
    
    velocity1.add(acceleration1);
    velocity2.add(acceleration2);
    velocity3.add(acceleration3);
    velocity1.add(acceleration4);
    velocity2.add(acceleration5);
    velocity3.add(acceleration6);
    location1.add(velocity1);
    location2.add(velocity2);
    location3.add(velocity3);
  
    //Gravitational attraction for object 1 to 2
    float gravityA = dist(location1.x, location1.y, location2.x, location2.y);
    map(gravityA,0, width*2, 0, .01); 
    PVector dir1 = PVector.sub(location1, location2);
    dir1.normalize();
    dir1.mult(-.002/gravityA);
    acceleration1 = dir1;   
   //object 2 to 1
    float gravityB = dist(location2.x, location2.y, location1.x, location1.y);
    map(gravityB,0, width*2, 0, 6);
    PVector dir2 = PVector.sub(location2, location1);
    dir2.normalize();
    dir2.mult(-9/gravityB);
    acceleration2 = dir2;
    
    //object 3 to 1
    float gravityC = dist(location3.x, location3.y, location1.x, location1.y);
    map(gravityC,0, width*2, 0, 6);
    PVector dir3 = PVector.sub(location3, location1);
    dir3.normalize();
    dir3.mult(-13/gravityC);
    acceleration3 = dir3;
    //object 1 to 3
    float gravityD = dist(location1.x, location1.y, location3.x, location3.y);
    map(gravityD,0, width*2, 0, .01);
    PVector dir4 = PVector.sub(location1, location3);
    dir4.normalize();
    dir4.mult(-.007/gravityD);
    acceleration4 = dir4;
    
    //object 2 to 3
    float gravityE = dist(location2.x, location2.y, location3.x, location3.y);
    map(gravityE,0, width, 0, 2);
    PVector dir5 = PVector.sub(location2, location3);
    dir5.normalize();
    dir5.mult(-1/gravityE);
    acceleration5 = dir5;
    //object 3 to 2
    float gravityF = dist(location3.x, location3.y, location2.x, location2.y);
    map(gravityF,0, width, 0, .5);
    PVector dir6 = PVector.sub(location3, location2);
    dir6.normalize();
    dir6.mult(-.5/gravityF);
    acceleration6 = dir6;
   
    //Allows gravity to be turned off and on
    if(key == 'g' || key == 'G'){
      acceleration1.x = 0;
      acceleration2.x = 0;
      acceleration3.x = 0;
      acceleration4.x = 0;
      acceleration5.x = 0;
      acceleration6.x = 0;
      acceleration1.y = 0;
      acceleration2.y = 0;
      acceleration3.y = 0;
      acceleration4.y = 0;
      acceleration5.y = 0;
      acceleration6.y = 0;
    }
    else if(key == 'r' || key == 'R'){
      acceleration1.x = dir1.x;
      acceleration2.x = dir2.x;
      acceleration3.x = dir3.x;
      acceleration4.x = dir4.x;
      acceleration5.x = dir5.x;
      acceleration6.x = dir6.x;
      acceleration1.y = dir1.y;
      acceleration2.y = dir2.y;
      acceleration3.y = dir3.y;
      acceleration4.y = dir4.y;
      acceleration5.y = dir5.y;
      acceleration6.y = dir6.y;
      location1.x = width/2;
      location2.x = (width/2) - 30;
      location3.x = (width/2) - 100;
      location1.y = height/2;
      location2.y = (height/2) - 30;
      location3.y = (height/2) + 100;
      velocity1.x = 0;
      velocity2.x = -2.5;
      velocity3.x = 3;
      velocity1.y = 0;
      velocity2.y = 2.5;
      velocity3.y = 3;
    }
  }
 
  void display() {
    noStroke();
    fill(255,0,0);
    ellipse(location1.x,location1.y,50,50);
    fill(0,255,0);
    ellipse(location2.x, location2.y, 10, 10);
    fill(0,0,255);
    ellipse(location3.x, location3.y, 20, 20);
   
  }
 
  void checkEdges() {  
    
    //This lets you move and throw the star and the two bodies. 
    // Original code taken from previous excercises and programs in class.
    dist(location1.x, location1.y, mouseX, mouseY);
    dist(location2.x, location2.y, mouseX, mouseY);
    dist(location3.x, location3.y, mouseX, mouseY);
    
    //object #1
    if(dist(location1.x, location1.y, mouseX, mouseY) < 16){
      if (mousePressed == true) {
        location1.x = mouseX;
        location1.y = mouseY;
        velocity1.x = mouseX - pmouseX;
        velocity1.y = mouseY - pmouseY;
      }
    }
    //object #2
    if(dist(location2.x, location2.y, mouseX, mouseY) < 16){
      if (mousePressed == true) {
        location2.x = mouseX;
        location2.y = mouseY;
        velocity2.x = mouseX - pmouseX;
        velocity2.y = mouseY - pmouseY;
      }
    }
    //object #3
    if(dist(location3.x, location3.y, mouseX, mouseY) < 32){
      if (mousePressed == true) {
        location3.x = mouseX;
        location3.y = mouseY;
        velocity3.x = mouseX - pmouseX;
        velocity3.y = mouseY - pmouseY;
      }
    }
  }
}

