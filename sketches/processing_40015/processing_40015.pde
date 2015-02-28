
float x_position=random(400);
int x_speed=3;

float y_position=random(400);
int y_speed=50;

void setup(){
  size(400,400);
}

void draw(){
  move();
  
  bounce();
  
  display();
}

void move(){
  x_position+=x_speed;
}

void bounce(){
  if((x_position>=width)||(x_position<=0)){
    x_speed=x_speed*-1;
  }
}

void display(){
  background(0);
  rect(x_position,150,80,50);
  ellipse(x_position+17,200,20,20);
  ellipse(x_position+60,200,20,20);
}
