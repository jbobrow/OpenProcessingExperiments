
float x; // current position
float y;

float px; // previous position
float py;

float vel; 
float dir; 


void setup() {
  size(600, 600);
  stroke(0);
  background(255);
  smooth();
  frameRate(60);
  x=300;
  y=300;
  
  vel = 2;  
  
}

void draw() {
  if (mouseButton == LEFT) {
    px = x;
    py = y;
    x+= cos(radians(dir))*vel;
    y+= sin(radians(dir))*vel;
    
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
    px = constrain(px, 0, width);
    py = constrain(py, 0, height);

    stroke(0);
    line(px, py, x, y);
    
    if ((x==301 && y==301)){

    
    }
    
    dir+=random(-1, 5);

//boundaries
//    if((x <125) || (x>475)){
//      x=x-1;
//      
//    }
//    if((y <125) || (y>475)){
//      y=y-1;
//    }

  }
}


