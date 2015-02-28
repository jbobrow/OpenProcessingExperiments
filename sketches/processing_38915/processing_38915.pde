
int x_position = 1;
int x_speed = 15;

void setup(){
size(600,300);
}

void draw(){
 background(255, 166, 11);
 x_position=x_position+x_speed;
 stroke (0, 0, 0, 0);
 fill(243, 240, 235);
 ellipse(x_position,150,70,70);
//if the ball gets the right side 
if(x_position>600){
  //then goes left
   x_speed=-15;
}
//if the ball gets the left side
 if(x_position<=0){
   //then goes right
   x_speed=15;
}

}
