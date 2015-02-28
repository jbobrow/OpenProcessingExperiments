
//Gabby Garuz
//Creative Computing - Section F for Fun 
//9-17-12
int circle_x;
int circle_y; //where is the circle? x and y position
int circle_diameter = 50; //how wide and tall the circle is.
boolean overCircle = false; //if this is true, the mouse should be inside the circle.
 
//anything in setup runs once. It "sets up" the sketch.
void setup() {
  size(500, 500);
    background (0,0,0); 
  circle_x = width/2;
  circle_y = height/2; //put the circle in the middle of the screen. You really can put it anywhere though.
};
 
//anything in draw runs continuously.
void draw() {

 
  //  println( dist(circle_x, circle_y, mouseX, mouseY) );
  // uncomment the line above to see the actual distance your mouse is from the center of the circle
  if ( dist(circle_x, circle_y, mouseX, mouseY) < circle_diameter/2 ) {
    //if the distance from the mouse to the center of the circle < [is less than] the radius [half diameter] of that circle
    //then the mouse is inside of the circle so
    fill(236,0,0); 
//change the fill
    overCircle = true; //change overCircle to true. We can use overCircle in other parts of the sketch to do cool stuff
  } else {
    //the distance from the center of the circle to the mouse is more than the radius of the circle
    //so the mouse is outside of the circle
    overCircle=false;
    fill(255,255,255); 
      ellipse( mouseX, mouseY, 150, 150); //this is the super cool circle thing.
  };//with an if else statement, you can only pick one. So the mouse is either over the circle or not, it can't be both
 
  if ((mousePressed == true) && (overCircle == true)) {
    //mousePressed is a Boolean as well. It can only be true or false, similar to overCircle.
    //if the mouse is pressed AND overCircle is true
    //then change the fill
    
    //target thing
    noStroke();
        fill (236, 0, 0);
ellipse (250, 250, 600, 600);
        fill (255, 255, 255);
ellipse (250, 250, 500, 500);
    fill (236, 0, 0);
ellipse (250, 250, 400, 400);
        fill (255,255,255);
ellipse (250,250,300,300);
        fill (236, 0, 0);
ellipse (250,250,200,200);
        fill (255,255,255);
ellipse (250,250,100,100);


  overCircle = true;
    
  };
  //draw a circle!
  ellipse(circle_x, circle_y, circle_diameter, circle_diameter);
 
  if (overCircle == false) {
    //only draw line if mouse isn't over circle
      ellipse(circle_x, circle_y, circle_diameter, circle_diameter);
  };
};


