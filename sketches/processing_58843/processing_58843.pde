
Circle[] circles;

float vy,vx,frictiony,frictionx,gravity,x_pos,y_pos;

void setup(){
  size(300,300);
  smooth();
  circles = new Circle[10];
  for (int i = 0; i < circles.length; i++){
    circles[i] = new Circle(random(300),random(300),i);
  }
}
void draw() {
  background(255);
  fill(255,70);
  rect(width,height,0,0);
   stroke(.1);
  
  for (int i = 0; i < circles.length; i++){
    circles[i].move();
    //circles[i].intersect();
    circles[i].display();
    circles[i].intersect();
    circles[i].collision();
    
  }
}

class Circle{
  float x,y,vy,vx,frictiony,frictionx,gravity;
  int xspeed;
  int id;
  Circle(float _x,float _y,int _id){
    x = _x;
    y = _y;
    xspeed = 1;
    id = _id;
    vy = 0;
    vx = 2;
    _x = random(600);
    _y = random(600);
    frictiony = -.9;
    frictionx = 1;
    gravity = (random(.08,.09));
    stroke(.001);
  }

void move(){

  vy += gravity;
  vx *= frictionx;
  x += vx;
  y += vy;
  if(y > height ){
  y = height;
  vy*=frictiony;
  }
  if(y < 5){
  y = 5;
  vy*=frictiony;
  }
  if(x > 298 ){
  x = 298;
  vx*=frictiony;
  }
  if(x < 2 ){
  x = 2;
  vx*=frictiony;
  fill(random(255));
  }
}
void display(){
  ellipse(x,y,5,5);
}
void intersect(){
  for (int i = 0; i < circles.length; i++){
   line(x,y, circles[i].x, circles[i].y); 
  }
}
void collision(){
  for (int i = 0; i < circles.length; i++){
    if(id != i){
      if(dist(x,y,circles[i].x,circles[i].y) < 10)
      circles[i] = new Circle(random(300),random(300),i);
      
    }
  }
}

}

