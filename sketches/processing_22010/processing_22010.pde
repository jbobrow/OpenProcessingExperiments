
float speed1 =2;
float speed2 =3;
float speed3 =2.5;


float x1 = 100;
float y1 = 100;

float x2 = 300;
float y2= 300;

float x3 = 200;
float y3 = 50;


void setup () {
  size (400, 400); 
  smooth();
  frameRate (20);
}



void draw () {


  noStroke();
  fill (255);
  rect (0, 0, width, height);


  move1 (y1, speed1); // call function with two arguments to calculate position
  move2 (y2, speed2); // call function with two arguments to calculate position
  move3 (y3, speed3);  // call function with two arguments to calculate position



  thing (x1, move1(y1, speed1), 50, color (200, 100, 30)); // call function to display shapes with several arguments
  thing (x2, move2(y2, speed2), 25, color (50, 150, 200)); // call function to display shapes with several arguments
  thing (x3, move3(y3, speed3), 75, color (50, 250, 70)); // call function to display shapes with several arguments


  stroke (0);
  line (x1, move1(y1, speed1), x3, move3(y3, speed3)); 
  line (x3, move3(y3, speed3), x2,  move2(y2, speed2));
  line (x2,  move2(y2, speed2), x1, move1(y1, speed1));
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
  fill (c);
  ellipse (x, y, r, r);
}


