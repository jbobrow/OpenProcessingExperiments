

float r; // declare variable of colour red
float g; // declare variable of colour green 
float b; // declare variable of colour blue 
float a; // declare variable of transparency 

float diam; // delare varible of the diamond
float x; // delare varible of x axis
float y; // delare varible of the y axis 

void setup() {

  size (700,700); // intialising the size of the frame 
  background(0);  // setting the background colour of the frame to black 
  smooth();      
}

void draw() {
 translate(x, y); 
 fill(100,0,100,12);
  stroke(0); //setting the stroke of the smaller stars to black 
  strokeWeight(2); //adding thickness to stroke of the smaller stars
  beginShape(); //creating the star shape 
  vertex(0, -50); // positioning the coordinates of the small star
  vertex(14, -20); // positioning the coordinates of the small star
  vertex(47, -15); // positioning the coordinates of the small star
  vertex(23, 7); // positioning the coordinates of the small star
  vertex(29, 40); // positioning the coordinates of the small star
  vertex(0, 25); // positioning the coordinates of the small star
  vertex(-29, 40); // positioning the coordinates of the small star
  vertex(-23, 7); // positioning the coordinates of the small star
  vertex(-47, -15); // positioning the coordinates of the small star
  vertex(-14, -20); // positioning the coordinates of the small star
  
 r = random(255); // setting the random function to red 
 g = random(255); // setting the random function to green
 b = random(255); // setting the random function to blue 
 a = random (255); // setting the random function to alpha
 diam = random(255);
 x=random(width);
 y=random(height);
 
 fill(r,g,b,a); // fill the following vertex with red, green, blue and alpha
  endShape(CLOSE);
  }

// Whenever a user clicks the mouse a big star will appear() 
void mousePressed() {
beginShape(); // Create shape 
  stroke(0,0,255); // setting the outline of the star as blue 
  fill(255,255,0); // Setting the big star colour to yellow 
vertex(300,10);  // Setting the big star coordinates 
vertex(380,200); // Setting the big star coordinates
vertex(580,200); // Setting the big star coordinates
vertex(400,350); // Setting the big star coordinates
vertex(530,580); // Setting the big star coordinates
vertex(300,430); // Setting the big star coordinates
vertex(70,580);  // Setting the big star coordinates
vertex(200,350); // Setting the big star coordinates
vertex(20,200);  // Setting the big star coordinates
vertex(220,200); // Setting the big star coordinates
endShape(); // Shape completed 
}

// Whenever a user presses a key the code written inside keyPressed() is executed and the screen is refreshed.
void keyPressed() {
  background(0);
  
  
}

