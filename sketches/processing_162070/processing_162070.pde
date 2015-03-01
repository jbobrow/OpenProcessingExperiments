
float nx = 1, ny = 1, theta_x = 0, theta_y = 12;
float Ax = 100, Ay = 100;
float x;
float p_x;
float p_y;
void setup(){
  size(400, 400);
  background(255);
  noFill();
  frameRate(100);
  x = 0;
  smooth();
}

void draw(){
  //horithon
  x += 1;
  p_x = sin(radians(nx * x) + theta_x) * Ax + height / 2;
  //vertical
  p_y = sin(radians(ny * x) + theta_y) * Ay + height / 2;
  //draw
  point(p_x, p_y);
  //update
  theta_y += 0.01;
}
void keyPressed(){
  if( key == 'q' || key == 'Q' ) {
    Ax += 2;
  }
  else if( key == 'w' || key == 'W' ){
    Ax -= 2;
  }
  else if( key == 'e' || key == 'E' ){
    nx += .01;
  }
  else if( key == 'r' || key == 'R' ){
    nx -= .01;
  } 
  else if( key == 't' || key == 'T' ){
    ny += .01;
  }
  else if( key == 'y' || key == 'Y' ){
    ny -= .01;
  }
  else if( key == 'u' || key == 'U' ){
    theta_y++;
  }
  else if( key == '9'){
    nx = 1;
    ny = 1;
    Ax = 100;
    Ay = 100;
    theta_y = 2;
    background(255);
  } 
  else if( key == '0'){
    background(255);
  }      
}


