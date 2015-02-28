
class Bounce {
  float x, y;
  float diameter;
  float speed;
  
  //  an integer to represent direction:
  //  1 -> left to right
  // -1 -> right to left
  int direction = 1;
  
  int SCALE = 10;

  float s;  // size of the pulse

//Constructor
Bounce(float xpos, float ypos, float dia, float sp){
  x = xpos;
  y = ypos;
  diameter = dia;
  speed = sp;
}


void move(){
  y += (speed * direction);
  if((y > (height - diameter/2)) || (y < diameter/2)){
  direction *= -1;
 }
}

void move2(int newX, int newY) {
    x = newX;
    y = newY;
  }
  
void display(){
  ellipse(x, y, diameter, diameter);
}

void paint(){
  fill(0, 1.5);
  rect(0, 0, width, height);
  if((y > (height - diameter/2)) || (y < diameter/2)){
  fill(255);
  } else{
    fill(255);
  
  }
  }
}



