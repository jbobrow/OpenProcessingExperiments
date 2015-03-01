
/*
Here's the repetition / variation code 
that we wrote together in class
*/

size(400,400); //set canvas size

//cirlce position + size variables
int circleW;  //declare an integer 'w' for width
circleW = 40;  //assign 'w' the value of 40
int circleH = 40;  //declare 'h' and assign 40
int startX = 0; //x-position
int startY = circleW/2; //y-position

//color
colorMode( HSB ); //set color mode to HSB
float h, s, b, a; //variables for h,s,b and a. use a float because we're going to randomly assign values
h = 150; //default hue value
s = 255; //default saturation value
b = 255; //default brightness value
a = 125; //default alpha value

noStroke(); //don't draw circle outlines

for( int i = startX; i <= width ; i = i + circleW/2){ //outer loop
  for( int j = startY; j <= height; j = j + circleH/2 ){ //inner loop
    
    //generate color values
    h = random(145,155);
    a = random(100,200);

    //10% of circles should be black
    //step 1: generate a random number between 0 and 10
    float tenPercent = random(10);

    //step 2: check if the number is less than 1, i.e. 10% of the time
    if( tenPercent <= 1 ){
      //step 3: if it is, set the fill = black
      fill(0,0,0);
    }
    else{
      //step 4: if it isn't, use the blue color
      fill( h, s, b, a ); //set the fill
    }
    ellipse( i, j, circleW, circleH ); //draw the circle
  } //end inner loop
}//end outer loop




