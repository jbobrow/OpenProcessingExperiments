
float speed1 =2;
float speed2 =2.2;
float speed3 =2.3;

float x1 = 100;
float y1 = 100;

float x2 = 300;
float y2= 300;

float x3 = 200;
float y3 = 50;
float theta = 0;

void setup () {
size (400, 400);
smooth();
 frameRate(55);


}

void draw () {


noStroke();
fill (0);
rectMode (CENTER);
rect (width/2, height/2, width, height);

move1 (y1, speed1); // call function with two arguments to calculate position
move2 (y2, speed2); // call function with two arguments to calculate position
move3 (y3, speed3);  // call function with two arguments to calculate position
thing (x1, move1(y1, speed1), 50, color (random(250),random(250), 30)); // call function to display shapes with several arguments
thing (x2, move2(y2, speed2), 25, color (random(250),random(250), 200)); // call function to display shapes with several arguments
thing (x3, move3(y3, speed3), 75, color (random(250), random(250), 70)); // call function to display shapes with several arguments

//draw lines between things
stroke(255);
strokeWeight (3);
noFill();
bezier(x1, y1, 50+x1, 70+y1, 50+x2,70+y2, x2, y2);
bezier(x2, y2, 50+x2, 70+y2, 50+x3,70+y3, x3, y3);
bezier(x3, y3, 50+x3, 70+y3, 50+x2,70+y1, x1, y1);



int s = second(); // call the second value
fill(0);


theta += .25; 

}

// this function calculates position and returns a float for the y value
float move1 (float y, float s) {

y1 = y1+speed1; //increment speed
if ((y1 > height) || (y1<0)) {
speed1 = speed1*-1;
} //change direction

float ynewest= y1;
return ynewest;
//return value
}

// this function calculates position and returns a float for the y value
float move2 (float y, float s) {

y2 = y2+speed2; //increment speed
if ((y2 > height) || (y2<0)) {
speed2 = speed2*-1;
}//change direction

float ynewest= y2;
return ynewest;
//return value
}

// this function calculates position and returns a float for the y value
float move3 (float y, float s) {

y3 = y3+speed3; //increment speed
if ((y3 > height) || (y3<0)) {
speed3 = speed3*-1;
}//change direction

float ynewest= y3;
return ynewest;
//return value
}

// function accepts arguments and draws shapes
void thing (float x, float y, float r, color c) {
float xc = r*cos(theta); //add random values to jitter
float yc = r*sin (theta); //add random values to jitter
fill (c);
ellipse (x, y, r, r);
ellipse (x+xc, y+yc, 20, 20);
}               
                                
