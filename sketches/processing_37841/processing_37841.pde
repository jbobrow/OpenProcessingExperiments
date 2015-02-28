
int x_position = 50;
int x_speed = 20;
void setup(){
size(400,400);
}

void draw(){
background(0);
x_position = x_position+x_speed;
ellipse(x_position,200,50,50);
//if the ball arrive the right side of the screen,go back to the left side
if(x_position>400){
x_speed = -20;
}
//if the ball arrive the left side of the scree, go to the right side
if(x_position <= 0){
x_speed = 20;
}
}

                
                
