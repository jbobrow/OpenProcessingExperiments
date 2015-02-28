
/*Title: Spinning 
 Description:Create an animation using the cos() and sin() functions as generators for motion.
 Created: September 26, 2012
 by: Min Fan
 Email:mfan1028@gmail.com
 */

//Declare the global variables 
float angle = 0.0;
//Set the initial movement speed 
float scalar = 2;
//Set the accelerated movement speed 
float speed = 0.05;
//Set the size of arc
float radius=50;

//Declare the setup method 
void setup() {
  //Set the size of canvas 
  size(400, 400);
  //Set the background color to white
  background(255);
  //Turn on the smooth function
  smooth();
  //Set the stroke to white color
  stroke(255, 0, 0, 1);
}

//Declare the draw method to draw spinning arcs
void draw() {
  frameRate(120); 
  //Set x1 and y1 the positions for arc
  float x1 = 220 + cos(angle) * scalar;
  float y1 = 120 + sin(angle) * scalar;
  //For loop to draw arcs with random sizes and random radians
  for (int i=0; i<=width; i+=radius/2) {
    for (int j=0; j<=height; j+=radius/2) {
      //Set the random size of arc
      float size = (random(radius*3.5));
      //Fill blue color 
      fill(0, 138, 255, 1);
      //Draw arc at position x1,yi with size of (random(radius*3.5)) and radians of random(PI*2)
      arc(x1, y1, size, size, random(PI*2), random(PI*2));
    }
  }
  //Set the stroke to white 
  stroke(255, 100);
  //Draw line with mouse from position x1 y1
  line(mouseX, mouseY, x1, y1);

  //Draw the 2nd spinning arc at position x2 and y2
  float x2 =200 + cos(angle) * scalar;
  float y2 =280 + sin(angle) * scalar;
  for (int i=0; i<=width; i+=radius/2) {
    for (int j=0; j<=height; j+=radius/2) {
      float size = (random(radius*2));
      fill(255, 6, 70, 1);
      arc(x2, y2, size, size, random(PI*2), random(PI*2));
    }
  }
  stroke(255, 100);
  //Draw line with mouse movement from position x2 y2
  line(mouseX, mouseY, x2, y2);

  //Draw the 3rd and 4th spinning arcs at position x3 and y3
  float x3 = 150  + cos(angle) * scalar;
  float y3 = 200 + sin(angle) * scalar;
  arc(x3, y3, 300, 300, 0, PI*2);
  arc(x3, y3, 450, 450, 0, TWO_PI);
  //Draw line with mouse movement from position x3 y3
  line(mouseX, mouseY, x3, y3);

  //Draw the 5th and 6th spinning arcs at position x4 and y4
  float x4= 200 + cos(angle) * scalar;
  float y4 =120+ sin(angle) * scalar;
  arc(x4, y4, 20, 20, 0, PI*2);
  arc(x4, y4, 50, 50, 0, TWO_PI);
  //Draw line with mouse movement from position x4 y4
  line(mouseX, mouseY, x4, y4);

  //Draw the 7th and 8th spinning arcs at position x5 and y5
  float x5 =240+cos(angle) * scalar;
  float y5 = 200 + sin(angle) * scalar;
  arc(x5, y5, 50, 50, 0, PI*2);
  arc(x5, y5, 100, 100, 0, TWO_PI);
  //Draw line with mouse movement from position x5 y5
  line(mouseX, mouseY, x5, y5); 

  //Draw the 9th and 10th spinning arcs at position x6 and y6
  float x6=180+cos(angle) * scalar;
  float y6 =240+ sin(angle) * scalar;
  arc(x6, y6, 30, 30, 0, PI*2);
  arc(x6, y6, 150, 150, 0, TWO_PI);
  //Draw line with mouse movement from position x6 y6
  line(mouseX, mouseY, x6, y6);

  //Movement of the animation
  angle += speed; 
  //Update the speed of the animation
  scalar += speed;
}



