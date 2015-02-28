
// Maryam Mobini |  September  25, 2012 | mma99@sfu.ca 
// Project 1 - Displaying the progress of time in a non-traditional way

/* Description - The time is displayed using series of circles, two small
 white circles representing seconds, two color circles representing minutes, 
 and one color circle and a small white circle representing the hour. Randomly 
 generated lines are also aligned with the position of the hour. Since the "hour"
 is fairly static, the lines therefore display an interesting way of showing the 
 temporal changes of the hour.  These circles pulsate and change color in an ambient 
 manner as a poetic representation of the inner workings of the clock. As time passes 
 by, the circles go through a growth rate, increasing and decreasing in size. */

/////////////////////////////////////////////


// declaring global variables

int xx;                 //declaring variable named xx of type int for controlling the growth rate of the circles
int num = 10;          // declare a variable named num of type int and assign it the value 10 for range of values used for the arrays
int count = 0;        // declare a variable named count of type int and assign it the value 0 used for redrawing the circles
float[] xArray;      // declaring the array of values for xpositon of the circls
float[] yArray;     // declaring the array of values for ypositon of the circls
int r, g, b;       // declaring RGB(color) values 

// initializes enviroment properties 
void setup() {
  size(700, 600);    // set the size of the window
  smooth();         // turns anti-aliasin on
  frameRate(30);    // setting frameRate to refressh the canvas 30 times per second
  restart();       // call the method restart()
}
// declare method restart, this method generates new RGB values randomly and sets the position values
void restart() {  //
  count = 0; // initializing the variable count by passing the value 0 which resets the growth rate of the circles
  xArray = new float[num];  // sets the variable x position by creating a new location in memory from values 0-9 
  yArray = new float[num];  // sets the variable y position by creating a new location in memory from values 0-9 
  // randomly generates rgb colors to maximum value of 255
  r = int(random(255)); 
  g = int(random(255));
  b = int(random(255));
}
// initialize drawing the circles representing hour, minute, and second
void draw() {

  fill(0, 10);  // sets the black color for the background rectangle with 10 opacity 
  noStroke();   // no outline
  rect(0, 0, width, height); //draw rectangle 

  _seconds(); //calling method seconds
  _minutes(); // calling method minutes
  _hour();   // calling method hour
}

void _seconds() {  //declare method seconds for the circles representing seconds
  xx+=1;          //incrementing circles growth rate by 1

    pushMatrix(); //Pushes the current transformation matrix onto the matrix stack
  translate(width/2, height/2);  // Translate to center of window
  if (xx>30) {     //as long as xx is greater than 30 increase the size of the circles 
    float s=map(second(), 0, 60, 0, TWO_PI)-HALF_PI; //Re-maps the range of seconds from 0-60 and passes the value to float "s"

    rotate(s+5.75); // rotate canvas according to seconds and align the position of the circles using the value 5.75 to match an actual clock face

    //sets the x & y position for the circles
    int newx =  100;   // declare a variable named newx of type int and assign it the value 100 
    int newy =  60;   // declare a variable named newy of type int and assign it the value 60


      strokeWeight(1); //Sets the width of the stroke 1
    stroke(r, g, b, 40); // sets the color of the stroke and opacity to 40

      fill(r, g, b, 40);// sets the color of the ellipse and opacity to 40
    float rad = count * s-20;  //sets the radius of the inner color circle using value of count and second
    ellipse(newx, newy, rad*0.5, rad*0.5);

    strokeWeight(0.5); //Sets the width of the stroke 0.5
    stroke(r, g, b, 40); // sets the color of the stroke and opacity to 40

      fill(100, 40); // sets the color to grey value of 100 and opacity to 40
    float rad2 = count * s-20; //sets the radius of the outer color circle using value of count and second 
    ellipse(newx*2, newy*2, rad2*0.75, rad2*0.75); //draw ellipse

    if (count > 0) {
      fill(255);
      //draws the inner circles white dots 
      ellipse(newx, newy, 5, 5); //draw ellipse
      ellipse(newx*2, newy*2, 5, 5); //draw ellipse
    }

    // increment through the array until it reaches the maximum value of the array and call method restart
    count++;
    if (count >= num) {
      restart();
    } 
    // otherwise it passes the values of newx & newy into the array
    else {
      xArray[count] = newx;
      yArray[count] = newy;
    }
    // resetting the value of xx
    xx=0;
  }
  popMatrix(); //restores the prior coordinate system
}

void _minutes() {
  pushMatrix();  //Pushes the current transformation matrix onto the matrix stack
  translate(width/2, height/2);  // Translate to center of window
  float m=map(minute(), 0, 60, 0, TWO_PI)-HALF_PI;  //Re-maps the range of minutes from 0-60 

  rotate(m+5.75);  // rotate canvas according to minutes and align the position of the circles using the value 5.75 to match an actual clock face
  int newx =  100; // declare a variable named newx of type int and assign it the value 100 
  int newy =  60;   // declare a variable named newy of type int and assign it the value 60


    strokeWeight(1);  //Sets the width of the stroke to 1
  stroke(r, g, b, 40); // sets the color of the stroke and opacity to 40

    fill(r, g, b, 40);  // sets the color of the ellipse and opacity to 40
  float rad2 = count * m-25; //sets the radius of the inner color circle using value of count and minute
  ellipse(newx, newy, rad2, rad2); //draw ellipse

  strokeWeight(0.5); //Sets the width of the stroke to 0.5
  stroke(r, g, b, 40);   // sets the color of the stroke and opacity to 40

    fill(100, 40);  // sets the color to grey value of 100 and opacity to 40
  float rad3 = count * m-25;   //sets the radius of the outer color circle using value of count and minute
  ellipse(newx*2, newy*2, rad3*1.25, rad3*1.25); //draw ellipse
  //as long as count is greater than 0 set the color of the smaller circles to white and draw
  if (count > 0) {
    fill(255); // set the color to white
    ellipse(newx, newy, 5, 5); //draw ellipse
    ellipse(newx*2, newy*2, 5, 5); //draw ellipse
  }

  // controlling the pulse rate 
  count++;


  popMatrix(); //restores the prior coordinate system
}
// initialize the method hour
void _hour() {

  pushMatrix(); //Pushes the current transformation matrix onto the matrix stack
  translate(width/2, height/2);  // Translate to center of window
  //calculating the value of the hour but increments it to the value that you can use
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;  //Re-maps the range of hour from 0-12 

  rotate(h+5.75);  // rotate canvas according to hour and align the position of the circles using the value 5.75 to match an actual clock face
  int newx =  100;  // declare a variable named newx of type int and assign it the value 100 
  int newy =  60;   // declare a variable named newy of type int and assign it the value 60
  strokeWeight(2);  //Sets the width of the stroke to 2
  stroke(r, g, b, 40);  // sets the color of the stroke and opacity to 40

    fill(r, g, b, 40);   // sets the color of the ellipse and opacity to 40
  float rad4 = count + h-50;  //sets the radius of the color circle using value of count and hour
  ellipse(newx, newy, rad4*1.5, rad4*1.5); //draw ellipse

  strokeWeight(1);  //Sets the width of the stroke to 1
  stroke(r, g, b, 40);  // sets the stroke color and opacity to 40
  // creating the initial values for the line which takes the starting position from the value of width and height 
  float new_linex = int(random(width+100)) - 50; // declare a variable named new_linex of type float and assign it a random value based on the width of the canvas
  float new_liney = int(random(height+100)) - 50; // declare a variable named new_liney of type float and assign it a random value based on the height of the canvas

  //as long as count is greater than 0 set the color of the smaller circles to white and draw cirlces and lines
  if (count > 0) {
    fill(255); //set the color of the ellipse to white
    //inner circles white
    ellipse(newx, newy, 5, 5); //draw ellipse
    ellipse(newx*2, newy*2, 5, 5); //draw ellipse
    //lines
    line(new_linex, new_liney, 5, 5); //draw line
    line(new_linex*2, new_liney*2, 10, 10); //draw line
  }
  // controlling the pulse rate 
  count++;

  popMatrix(); //restores the prior coordinate system
}



