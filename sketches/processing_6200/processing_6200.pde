
float x;
float y;
float speed = 1.0;
int directionX = 1; 
int directionY = -1; 
float radius = 108;

class Donut { //class
  float x;
  float y;
  float speed = 1.0;
  float mid = 30;



  //constructor
  Donut(float Xpos, float Ypos){
    x = Xpos;
    y = Ypos;
  }//end constructor

  void display(){ // says what to draw in draw()
    smooth();
    if ((mousePressed == true) && (dist(x,y, mouseX, mouseY) < 40)) { 
    tint(#fff49a);
    image(d2, x,y);
    }
    else {
      tint(#fff49a);
      image(d1,x,y);
    }
  }//end display

  
  //void small(float sm){ //function to make d1 smaller
   // scale(sm);
 // }

  void move(){ //makes d2 move based on mouse clicks and distance btwn d1 and d2

    x = x + random(-2,2) * speed; 
    y = y + random(-1,1) * speed; 
    x = constrain(x,0,width-radius); 
    y = constrain(y,0,height-radius); 
    if (dist(x,y, mouseX, mouseY) < 170){ //200
      speed = speed +0.05; 
    }
    else if (dist(x,y, mouseX, mouseY) > 155){ //175
      speed = speed - (speed + 0.02);
    }

  }//end move



}//end class




