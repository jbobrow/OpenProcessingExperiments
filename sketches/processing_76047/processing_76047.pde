
int radius = 60;
float x = 110;
float speed = 3;
int direction = 1;

void setup (){
  size (500, 200);
  ellipseMode(RADIUS);
}


void draw (){
  background(0);
  noStroke();
  
  x += speed * direction;
  
  if ((x>width - radius) || (x<radius)){
    direction = -direction;

}

if (direction ==1){
arc (x, height/2, radius, radius, 0.52, 5.76);
fill(255,255,0);
}else{

  arc (x, height/2, radius, radius, 3.67, 8.9);
}

if((x<150)||(x>400)){

arc(x, height/2, radius, radius, 0.00, TWO_PI);

}
}
