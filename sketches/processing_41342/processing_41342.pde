
float x_position = random(55);
int x_speed = 15;

float y_position = random(15);
int y_speed = 3;

void setup(){
size(400,400);
}

void draw() {

background(247,70,0);
 //move
 move();
 
 //bounce
 bounce();
 
 //display
 display();
}

void move(){
 x_position += x_speed;
 y_position += y_speed;
}

void bounce() {
 if((x_position >= width)||(x_position <= 0)){
 x_speed = x_speed * -1;
 }
  if((y_position >= height)||(y_position <= 0)){
 y_speed = y_speed * -1;
 }
}

void display(){
 rect(x_position,20,40,20);
 rect(x_position+2,18,6,3);
 rect(x_position+2,38,6,3);
 rect(x_position+30,18,6,3);
 rect(x_position+30,38,6,3);

 rect(20,y_position,20,40);
 rect(18,y_position+2,3,6);
 rect(38,y_position+2,3,6);
 rect(18,y_position+30,3,6);
 rect(38,y_position+30,3,6);

 rect(x_position+8,y_position+30,55,30);
 rect(x_position+12,y_position+28,16,5);
 rect(x_position+12,y_position+56,16,5);
 rect(x_position+42,y_position+28,16,5);
 rect(x_position+42,y_position+56,16,5);
}

