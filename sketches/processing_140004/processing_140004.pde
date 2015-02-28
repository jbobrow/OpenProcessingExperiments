
//risa hiyama
//object excersize
Plane myPlane01;
Plane myPlane02;
Plane myPlane03;

void setup(){
  size(200,200);
  
  //Initialize Car object by calling a constructer(the actual numbers
  
  myPlane01 = new Plane(color(200),0,50,2);
  myPlane02 = new Plane(color(250),0,100,1);
  myPlane03 = new Plane(color(150),0,140,3);


}

void draw(){
  background(50,50,200);
  //operate car object
  myPlane01.move();
  myPlane01.display();
  myPlane02.move();
  myPlane02.display();
  myPlane03.move();
  myPlane03.display();
}

class Plane {//define a class below

  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Plane(color colorP, float planeXpos, float planeYpos, float planeSpeed){
    //a constructor is defined with arguments 
    c = colorP;
    xpos= planeXpos;
    ypos= planeYpos;
    xspeed= planeSpeed;
    
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


