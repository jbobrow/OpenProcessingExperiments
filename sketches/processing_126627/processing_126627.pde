

Walker w;
Walker d;

void setup(){
  size (600, 500);
  w = new Walker();// Walker Object
  d = new Walker();
  background(255);
}

void draw(){
  w.step();
  w.display();
  d.step();
  d.display();
}

// Class
class Walker{
  int x;
  int y;
  
  Walker(){ // Constructor
    x = width/2;
    y = height/2;
}

void display(){ // Method
    stroke(0);
    point(x,y);
    ellipse(x,y,20,20);
}

void step(){ // Method
    //int choice = int(random(4));
    int stepx = int(random(3))-1; // yeilds -1,0,1
    int stepy = int(random(3))-1;
    // Random walk
        x += stepx;
        y += stepy;
    }
    
}





