
void setup()   // setup function runs only once
{
size(250, 250);  // specifying the size of the pde
background(255); // background turned white
smooth();
//noLoop();      // No Loop turned OFF
}

void draw()
{
stroke(random(255), random(255), random(255)); // random colored stokes
strokeWeight(random(1, 10));                   // random stroke weight ranging between 1 and 10
noFill();                 // put a no fill function to only highlight the curve
float x1 = random(width); // specify random values
float x2 = random(width);
float x3 = random(width);
float x4 = random(width);

float y1 = random(height);
float y2 = random(height);
float y3 = random(height);
float y4 = random(height);

bezier(x1, y1, x2, y2, x3, y3, x4, y4);    // calling the bezier
}
