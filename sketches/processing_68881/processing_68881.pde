
//initial position for the circle
float circle_x = 100;
float circle_y = 100;
//how much move the circle
float move_x = 2;
float move_y = -2;

void setup(){
size(400,200);
stroke(#D60DFF);
strokeWeight(7);
}

void draw(){
background(#AEEA73);
ellipse(circle_x, circle_y,40,40);
circle_x = circle_x + move_x;
circle_y = circle_y + move_y;

if(circle_x > width){
circle_x = width;
move_x = -move_x;
}

if(circle_y > height){
circle_y = height;
move_y = -move_y;
}

if(circle_x < 0){
circle_x = 0;
move_x = -move_x;
}

if(circle_y < 0){
circle_y = 0;
move_y = -move_y;
}

}
