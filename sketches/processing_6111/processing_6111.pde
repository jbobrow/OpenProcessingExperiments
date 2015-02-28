
float x;
float y;
float speed = 1.0;
int directionX = 1; 
int directionY = -1; 

class Donut { //class
  float x;
  float y;
  float speed = 1.0;
  float mid = 30;



  //constructor
  Donut(float Xpos, float Ypos){
    x = Xpos;
    y = Ypos;
  }

  void display(int val1, int val2, int val3){ // says what to draw in draw()
    int v1 = val1;
    int v2 = val2;
    int v3 = val3;
    tint(v1,v2,v3);
    smooth();
    image(base2, x,y);
    imageMode(CENTER);
  }

  void follow(){ //function to change XY values to MouseXY
    x = mouseX;
    y = mouseY;
  }
  
  void small(float sm){ //function to make d1 smaller
    scale(sm);
  }

  void move(){ //makes d2 move based on mouse clicks and distance btwn d1 and d2

    x = x + random(-1,1) * speed; 
    y = y + random(-1,1) * speed; 
    x = constrain(x,0,width); 
    y = constrain(y,0,height); 
    if ((mousePressed = true) && (dist(x,y, mouseX, mouseY)) <200){ 
      speed = speed +0.25; 
    }
    else if (dist(x,y, mouseX, mouseY) > 175){
      speed = speed - (speed + 0.15);
    }

  } 



}//end class




