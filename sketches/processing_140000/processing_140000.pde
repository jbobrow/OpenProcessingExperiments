
//risa hiyama
//object excersize
Plane myPlane;

void setup(){
  size(200,200);
  
  //Initialize Car object
  myPlane = new Plane();
}

void draw(){
  background(50,50,200);
  //operate car object
  myPlane.move();
  myPlane.display();
}

class Plane {//define a class below
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Plane(){ //a constructor
    c = color(255);
    xpos = width/2;
    ypos = height/2;
    xspeed = 1;
  }
  
  void display(){//Function
    fill(c);
    noStroke();
    triangle(xpos+4, ypos, xpos-3, ypos+15, xpos-3, ypos-15);
    triangle(xpos-10, ypos, xpos-18, ypos+5, xpos-18, ypos-5);
    ellipse(xpos,ypos,30,10);
  }
  
  void move(){
    xpos = xpos + xspeed;
    if (xpos >width){
      xpos=0;
    }
  }
}

    
    



  
  
  


