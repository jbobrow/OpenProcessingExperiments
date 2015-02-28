
// variables for position of one rectangle
float x =200;
float y = 200;

// variables for position of one rectangle
float x1=100;
float y1 = 100;
float k = 70;
float k2 = 70;
// variables for speed of rectangles
float speed = 3;
float speed1 = 5;

void setup () {
size (700, 700);
}

void draw () {

//make a "white" background
background (150,150,0);

//color the rectangle
fill (random(255),25,56);
noStroke () ;
//rectMode (CENTER);

ellipse(x, y, k, k2);
rect (x1, y1, k, k2);


//move the rectangles by adding speed
y = y+speed;
y1=y1+speed1;

//keep the rectangles from leaving the screen
if ((y>height) || (y1>height) ||(y<-5) || (y1<-25) ) {

speed1 = speed1 *-1;
speed = speed *-1;
k = k+50;
x=random(700);
x1=random(700);
k2 = k2+50;

}

}
                
                
