
int boxWidth = 300;
int boxHeight = 300;
int boxDepth = 300;



int x_position=0;
int x_speed=+2;
int y_position=100;
int y_speed=+2;
int z_position=100;
int z_speed=+2;


void setup(){
  size(600,600,P3D);
}


void draw(){
  
  background(0);
  camera(width/2.0+mouseX, height/4.0+mouseY,0, 0, 0, 0, 0, 1, 0);
  pointLight(255,255,255,35,40,36);
  
 x_position=x_position+5+x_speed;
  y_position=y_position+5+y_speed;
  z_position=z_position+5+z_speed;
 
  stroke(0,0,255);
  noFill();
  
  box(300,300,300);
 
 
 translate(x_position,y_position,z_position);
  if(x_position>=boxWidth/2){
    x_speed=-20;
  }
  if(y_position>=boxHeight/2){
    y_speed=-20;
  }
  if(z_position>=boxDepth/2){
    z_speed=-20;
  }
  if(x_position<=-boxWidth/2){
    x_speed=+2;
  }
  if(y_position<=-boxHeight/2){
    y_speed=+2;
  }
   if(z_position<=-boxDepth/2){
    z_speed=+2;
  }

  
  
  
  
   fill(255);
  stroke(255,0,0);
  sphere(10);

}


