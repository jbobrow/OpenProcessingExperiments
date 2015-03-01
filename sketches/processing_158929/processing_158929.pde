
//Interaction Challenge 1
//Problem 4 (Challenge)
float cx;//defines a variable for center x-value.
float cy;//defines a variable for center y-value.
float a = 100;//defines a variable for the side length of the
              //triangle and sets it equal to 100.
float r = 0.167*sqrt(3)*a;//defines the Inradius of the triangle.
float R = 0.333*sqrt(3)*a;//defines the Circumradius of the triangle.

void setup(){
  size(600,600); //sets screen size.
  cx = width/2;//sets the center x-value.
  cy = height/2;//sets the center y-value.
}

void draw(){
  background(255);//sets background color to white
  fill(255,255,0);//sets the fill color to yellow.
  triangle(cx-0.5*a,cy-r,cx+0.5*a,cy-r,cx,cy-R-(2*r));
  triangle(cx-0.5*a, cy-r, cx-a, cy+R, cx, cy+R);
  triangle(cx, cy+R, cx+a, cy+R, cx+0.5*a, cy-r); 
  //the above the three lines create the tree triangles.
}

