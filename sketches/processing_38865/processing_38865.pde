
int x_position = 100;
int x_speed = 50;

void setup(){
size(800,400);
}
 
void draw(){
 background(0);
 x_position = x_position+x_speed;
 ellipse(x_position,200,100,100);

 //if the ball arrive the right side of the screen,go back to the left side
 if(x_position>800){
 x_speed = -50;
}

 //if the ball arrive the left side of the screen, go to the right side
 if(x_position <= 0){
 x_speed = 50;
 }
 
  x_position = x_position+x_speed;
 ellipse(x_position,200,50,50);

 //if the ball arrive the left side of the screen, go to the right side
 if(x_position>800){
 x_speed = -100;
}

 //if the ball arrive the left side of the screen, go to the right side
 if(x_position <= 0){
 x_speed = 100;
 }
}
