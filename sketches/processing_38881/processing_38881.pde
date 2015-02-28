
int x_position = 100;
int x_speed = 5;
int y_position = 10;
int y_speed = 10;

void setup(){
size(300,700);
}
void draw(){
 background(0);
 x_position=x_position+3+x_speed;
 y_position=y_position+1+y_speed;
 fill(255);
 ellipse(x_position,y_position,45,45);

 if(x_position>300){
   x_speed=-5;
 }
 if(x_position<=0){
   x_speed=10;
 }
 if(y_position>700){
 y_speed = -10;
}

 if(y_position <= 0){
 y_speed = 10;
 }
}

 
 
 
 

