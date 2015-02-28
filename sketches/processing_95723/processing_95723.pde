
float dt = 0.2;
float angle = 0.001;
float g = 9.8;
float x;
float y;
float l =140; //length of the rope
float at;     //tangent acceleration
float rotacc; //rotary acceleration
float rotvel = 0.04; //rotary velocity

boolean spotted = false;
boolean grabbed = false;

void setup(){
  size(300, 300);
  
}


void draw(){
  
  background(255);
  
  if(!grabbed){
  at = g * sin(angle);

  rotacc = at / l;
  rotacc -= rotvel * 0.01;
  rotvel += rotacc * dt;
  angle += rotvel *dt;
  }else{
    angle = PVector.angleBetween(new PVector(0, -1), new PVector(-width/2 + mouseX, -height/2 + mouseY));
    if(-width/2 + mouseX<0)
    angle *=-1;
    rotvel = 0;
  }
  y = -l * cos(angle);
  
  x = l * sin(angle);;
  
  translate(width / 2 , height / 2);
  line(0,0,x,y);
  if((spotted = PVector.dist(new PVector(-width/2 + mouseX, -height/2 + mouseY), new PVector(x, y)) < 10) || grabbed)
      fill(0,0,255);
      else fill(255);
  ellipse(x, y, 20 , 20);
}

void mousePressed(){
  grabbed = spotted;
}

void mouseReleased(){
  grabbed = false;
}
