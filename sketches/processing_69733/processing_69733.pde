
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//Functions and Animation
//URL -> padova.webs.com/LimaconSite.html

//This program animates a limacon, a shape defined, in polar
//coordinates, as r=acos(theta)+b. It does this by approximating
//an infinite number of circles drawn with varying radii with
//their centers on the circumference of an unseen circle. That 
//is why the ellipses have such odd coordinates and radii.

//Center and radius of the unseen circle.
int xcenter=199;
int ycenter=199;
int r=64;

//Angle of the center of the drawn circle with respect to the
//horizontal, centered on the unseen circle.
float theta;

//Corresponds to the size of the hole in the limacon.
float coefficient=0.0;

//Determines growth or shrinkage of hole.
int direction=1;

void setup()
{
  size(400, 400);
  
  smooth();
  strokeWeight(2);
  noFill();
}

void draw()
{
  background(0);
  translate(xcenter, ycenter);
  theta=PI;
  while (theta>=0)
  {
    //Gradient from (24, 0, 96) to (64, 0, 256).
    stroke(64-40*theta/PI, 0, 256-160*theta/PI, 20);
    
    //Drawing of circumference circles.
    ellipse(coefficient*r*sin(theta), coefficient*r*cos(theta), r*sqrt(2-2*cos(theta)), r*sqrt(2-2*cos(theta)));
    ellipse(-coefficient*r*sin(theta), coefficient*r*cos(theta), r*sqrt(2-2*cos(theta)), r*sqrt(2-2*cos(theta)));
    
    theta=theta-PI/128;
  }
  coefficient=coefficient+direction*.0125;
  
  //Reversal of direction.
  if (coefficient>=1.25)
  {
    direction=-1;
  }
  if (coefficient<=0)
  {
    direction=1;
  }
};
