
/*based in Daniel Shiffman Walker example + Collisions & OOP
Ohio State University, ART3001, SP14
Florence Gouvrit www.gouvrit.org
EX. 1/5 - This example is about collisions between 2 objects (same class)
and 2 objects (different class)
*/

Walker w1;
Walker w2;
Obstacle obs1;

void setup(){
  size(800,600);
  background(250);
 // frameRate(20);
  
  //create objects
  w1 = new Walker();
  w2 = new Walker();
  obs1 = new Obstacle(0,0);  
  obs1.display_nofade(150);
  }

void draw() {
  fill(255, 0.1);
  rect(0,0,width, height);  //slowly (0.1%) erase background
  obs1.display(150, 20.0);
  
  
  w1.walk();
  w1.checkObst(obs1);
  w1.display();
  w2.walk();
  w2.checkObst(obs1);
  w2.display();
  
  if (w1.intersect(w2)) { //communication between objects
  w1.inter();
  w2.inter();
  println("match");
  } else {
  w1.no_inter();
  w2.no_inter();
}


  if (keyPressed)         //Press R to restart
  if (key == 'r' || key == 'R') {
  setup();
} //--end keyPressed
  }
  
  

class Obstacle {

  float x, y;
  float radius = 200;
  int og;
  float oc;
  
  //constructor
  Obstacle(int _og, float _oc) {
    x = random(700);
    y = random(500);
    oc = _oc;
    og = _og;
  }

  void display(int og, float oc)  {
    fill(0, og, 0, oc);
    noStroke();
    ellipse(x, y, radius*2, radius*2);
  }
  
   void display_nofade(int og)  {
    fill(0, og, 0);
    noStroke();
    ellipse(x, y, radius*2, radius*2);
  }
}

class Walker {

  float x, y;
  int s;
  color c = color(50, 10);
  
  
  //constructor
  Walker() {
    x = random(800);
    y = random(600);
    s = 10;
      }

  void display() {
    noStroke();
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
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  } //walk() end

//CHECK OBSTACLE FUNCTION
  void checkObst(Obstacle obs) {  // Use Object as arguments in functions
     float d = dist(x, y, obs.x, obs.y); //dist(x1, y1, x2, y2)
    if (d < (obs.radius + s))
    {          
      fill(255, 50);} else{
      fill(c);}
    }

  //INTERSECT & NOT INTERSECT FUNCTIONS: CHANGE COLOR 
    void inter() { 
    c = color(255,0,0,20);   //red 50% transparency
    }
    void no_inter() {    //back to grey
    c = color(50, 10);
    }
    
    
    boolean intersect(Walker w0) {   // Use Object as arguments in functions 
    float d = dist(x,y,w0.x,w0.y);   //distance between my X,Y and the walker that was passed X,Y *
    if (d < (s + w0.s)*5) {         //multiplying *5 to increase possibility
      return true;
    } else {
      return false;

    }
  }
  
} //class end



