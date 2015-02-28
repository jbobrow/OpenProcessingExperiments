
float d=165,f=0;  //Initialises the variables
color Green = color(#2DED1D);

void setup()
{size(400,600,P3D); //p3d sets up a 3D environment
}

void draw()
{background(0); //black background
stroke(#40E813); //green lines
strokeWeight(3); //lineweight of 3

  
float e=cos(PI*(f+=.45)/d); //variable slowly follows the cos curve to create a pulse like effect (The decimal number defines the speed - smaller number = slower pulse speed)
//+= is add assign : a += b is equivalent to a = a + b.
translate(200, 300,  -d/1.1-d*e  ); //the third number/formula is the z coordinate (in and out of page)
fill(Green);
sphere(d); //Sphere size - refers to variable
} 





//Breathing Sphere by nick bennett, licensed under Creative Commons Attribution-Share Alike 3.0 license.
//Work: http://openprocessing.org/visuals/?visualID=3541
//License: http://creativecommons.org/licenses/by-sa/3.0/

