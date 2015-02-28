
ball [] ballCollection = new ball[800]; //  declare class , instance

void setup(){
  size (600,600);
  smooth ();
  for (int i = 0; i < ballCollection.length; i++){
    ballCollection[i] = new ball(random(0,width), random(200,height)); // initialize
  }
}

void draw(){
  background (0);
  for (int i = 0; i < ballCollection.length; i++){
  ballCollection[i].run(); //call funtionality
  }
}




class ball {
  //global variables
  float x = 0;
  float y = 0;
  float xSpeed = 4;
  float ySpeed = 4;
  float xRad = 20; 
  float yRad = 20; 



  //constructor -- what it needs to display
  ball(float _x, float _y) {
    x = _x;
    y = _y;
  }

  //functions - what it will do

  void run() {//runs the below functions
    display (); 
    move();
    bounce();
    gravity();
  }

  void gravity() { //adds a very small increase to speed
    ySpeed += 0.2;
  }

  void bounce() { //if with parameters creating the edges
   if (x > width){
      xSpeed = xSpeed * -1;
    }else if(x < 0){
      xSpeed = xSpeed * -1;
    }if(y > height){
      ySpeed = ySpeed * -1;
    }else if (y < 0){
      ySpeed = ySpeed * -1;}
  }

  void move() { // adds speed to both the x and the y
    x += xSpeed; 
    y += ySpeed;
  }

  void display () { //displays the ellipse
    ellipse (x, y, xRad, yRad);
  }
}



