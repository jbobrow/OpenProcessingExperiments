
//ben norskov
//creative computing — Button code
//9-11-12
int circle_x;
int circle_y; //where is the circle? x and y position
int circle_diameter = 200; //how wide and tall the circle is.
boolean overCircle = false; //if this is true, the mouse should be inside the circle.
PImage bg;
int y;

PImage img;
float offset = 0;
float easing = 0.05;

//anything in setup runs once. It "sets up" the sketch.
void setup() {
  size(800, 600);
  circle_x = width/2;
  circle_y = height/2; //put the circle in the middle of the screen. You really can put it anywhere though.
  bg = loadImage("Brownies7.gif");
  img = loadImage("Brownies7.gif");
  
};
 
//anything in draw runs continuously.
void draw() {
  background(200);  //clear the background. Take this out to draw on top of your previous drawings
 
  //  println( dist(circle_x, circle_y, mouseX, mouseY) );
  // uncomment the line above to see the actual distance your mouse is from the center of the circle
    circle_x = 100;
  circle_y = 500;
  if ( dist(circle_x, circle_y, mouseX, mouseY) < circle_diameter/2 ) {
    //if the distance from the mouse to the center of the circle < [is less than] the radius [half diameter] of that circle
    //then the mouse is inside of the circle so
    //change the fill
    background(bg);
    overCircle = true; //change overCircle to true. We can use overCircle in other parts of the sketch to do cool stuff
  } else {
    //the distance from the center of the circle to the mouse is more than the radius of the circle
    //so the mouse is outside of the circle
    overCircle=false;
    noStroke();
    fill(76, 142, 41); //this is the default fill
  };//with an if else statement, you can only pick one. So the mouse is either over the circle or not, it can't be both
 
  if ((mousePressed == true) && (overCircle == true)) {
    //mousePressed is a Boolean as well. It can only be true or false, similar to overCircle.
    //if the mouse is pressed AND overCircle is true
    //then change the fill
      stroke(226, 204, 0);
  line(0, y, width, y);
  
  y++;
  if (y > height) {
    y = 0; 
  }  
  
    noStroke();  
    fill(255, 0, 0);
    
  image(img, 0, 0);  // Display at full opacity
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 126);  // Display at half opacity
  image(img, offset, 0);
  };
  //draw a circle!
  tint(255, 126);
  ellipse(circle_x, circle_y, circle_diameter/2, circle_diameter/2);
 
  if (overCircle == false) {
    //only draw line if mouse isn't over circle
    
  };
};


