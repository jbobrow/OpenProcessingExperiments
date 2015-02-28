
Lines lines1,lines2,lines3,lines4,lines5,lines6;

void setup(){
  size(500,600);
  background(161, 95, 196);
  smooth();
  lines1= new Lines (30, 20, 85, 75);
  lines2= new Lines (60, 20, 100, 0);
  lines3= new Lines (90, 100, 200,0);
  lines4= new Lines (400,10,200,10);
  lines5= new Lines (400,20,450,100);  
  lines6= new Lines (450,10,500,100);
}
void draw(){
  lines1.display();
  lines1.move();
  lines2.display();
  lines2.move();
  lines3.display();
  lines3.move();
  lines4.display();
  lines4.move();
  lines5.display();
  lines5.move();
  lines6.display();
  lines6.move();
}
    
    class Lines { 
    float x,y,vy,vx,diameter,acceleration,friction,gravity; //declare variables

  
  //create constructor
 Lines (float xpos, float ypos, float dia, float acceleration) {
    x = xpos; //set variables 
    y = ypos;
    diameter= dia;
    acceleration = 2;
    vy=.6;
    vx=.998;
    friction= -.50;
    gravity = .20;
 
  }
  
  void display (){ //method )( simple display method)    //run display method
 line(x,y,diameter,diameter);
  }
  
  void move(){
    x+= acceleration; //moves x direction
    y++; //moves y direction
    vy+= gravity;
    vx+= friction;
      if (y >height){
     y=height;
     vy *= friction;

      }
  }
    }


