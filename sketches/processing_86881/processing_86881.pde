
//general variables
float padding;
float distance;
float ball1_x;
float ball2_x;
float ball3_x;
float ball_y;
float ball_size;
PFont font;

//sin movement variable
float radian;
//static speed
float xspeed;


void setup(){
size (500, 450);
background(0);

padding=30;
distance=width-padding*2;
ball1_x=0;
ball2_x=padding;
ball3_x=padding;
ball_y=0;
ball_size=20;
font=loadFont("SansSerif-48.vlw");
textFont(font, 18);
stroke(255);
//sin 
radian=0;
//static speed
xspeed=3;

}


void draw(){
background(0);
//sin movement code 
//start at the center(0)
radian+=0.01;
ball1_x=width/2+distance*sin(radian)/2;
ball_y=50;
ellipse(ball1_x, ball_y, ball_size, ball_size);
//sin captions
line(padding, ball_y+5, padding, ball_y+15);
line(padding+distance/2, ball_y+5, padding+distance/2, ball_y+15);
line(padding+distance, ball_y+5, padding+distance, ball_y+15);
text("sin wave:", padding-20, ball_y-25);
text("-distance/2", padding-20, ball_y+38);
text("0", padding+distance/2-5, ball_y+38);
text("distance/2", padding-70+distance, ball_y+38);

//Lerp or linear interpolation
//we normally use ball_x+=(distance-ball_x)*0.02;
//but Processing provide a function for us to do the same thing!
//http://processing.org/reference/lerp_.html
//lerp(value1, value2, amt)
ball2_x=lerp(ball2_x, distance+padding, 0.02);
ball_y=200;
ellipse(ball2_x, ball_y, ball_size, ball_size);
//Lerp captions
line(padding, ball_y+5, padding, ball_y+15);
line(padding+distance, ball_y+5, padding+distance, ball_y+15);
text("Lerp or linear interpolation:", padding-20, ball_y-25);
text("0", padding-5, ball_y+38);
text("distance", padding-50+distance, ball_y+38);

//static speed
//add xspeed each frame till it hits the destination (distance+padding)
ball3_x+=xspeed;
if(ball3_x>padding+distance){
ball3_x=padding+distance;
}
ball_y=350;
ellipse(ball3_x, ball_y, ball_size, ball_size);
//static speed caption
line(padding, ball_y+5, padding, ball_y+15);
line(padding+distance, ball_y+5, padding+distance, ball_y+15);
text("Static speed:", padding-20, ball_y-25);
text("0", padding-5, ball_y+38);
text("distance", padding-50+distance, ball_y+38);
text("click to reset", padding-48+distance/2, ball_y+88);
}

void mouseReleased(){
ball2_x=padding;
ball3_x=padding;
}


