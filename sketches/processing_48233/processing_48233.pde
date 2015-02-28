
import peasy.*;

PeasyCam cam;


int x_position = 400;
int y_position = 400;
int z_position = -150;

int x_direction = 4;
int y_direction = 5;
int z_direction = 6;



void setup(){
  size(800,800,P3D);
  background(0);
  cam = new PeasyCam(this, 00);
  cam.setMinimumDistance(800);
 cam.setMaximumDistance(2000);
  
}

void draw(){
  translate(400,400, -150);
rotateX(PI);
  rotateY(PI);
  drawBall();
  
  
}



void drawBall(){
  if (x_position>650) {x_direction = -1*x_direction;}
  if (x_position<150) {x_direction = -1*x_direction;}
  if (y_position>650){y_direction = -1*y_direction;}
  if (y_position<150){y_direction = -1*y_direction;}
  if (z_position>650){z_direction = -1*z_direction;}
  if (z_position<150){z_direction = -1*z_direction;}
  background(0);
  pushMatrix();
  translate(400,400, -150);
  noFill();
  stroke(255,255,255);
  box(500,500,500);
    popMatrix();
  x_position = x_position + x_direction;
  y_position = y_position + y_direction;
  z_position = z_position + z_direction;
pushMatrix();
  translate(x_position, y_position, z_position);
  stroke(255,0,0);
  sphere(20);

  popMatrix();
  
  
}



