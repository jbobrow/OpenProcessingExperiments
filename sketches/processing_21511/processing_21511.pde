
float x= 100;  //x location
float y=0; // y location

float speed = 0;
float speed1 = 1;

float r=40;
float s=40;

float gravity = .05;

void setup () {
size (400, 400);
smooth();

}

void draw () {
background (0);

//display the square
stroke (255);
ellipse (x,y,r,s);

y = y +speed; //add speed to y location
x= x-speed1;
speed = speed + gravity; // add gravity to speed

//if square reaches bottom, reverse speed


if ((y>height ) || (y<0)){
 
speed = speed *-.95;
}
 
if ((x>height ) || (x<0)){
 
speed1 = speed1 *-1;
}
if (y>height-10){
 s=s-20; 
}
else {
 s=40; 
}



}

