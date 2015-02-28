
void setup()   // setup function runs only once
{
size(320, 480);  // specifying the size of the pde
background(255); // background turned white
smooth();
frameRate(4);
noLoop();      // No Loop turned OFF
}

void draw()
{
stroke(random(255/5), random(255), random(255/5)); // random colored stokes
strokeWeight(32);                   // random stroke weight ranging between 1 and 10
noFill();                 // put a no fill function to only highlight the curve
float x1 = random(width); // specify random values
float x2 = random(width);
float x3 = random(width);
float x4 = random(width);

float y1 = random(height);
float y2 = random(height);
float y3 = random(height);
float y4 = random(height);

bezier(width/2,height/2,x3, y3,x3, y3,  mouseX, mouseY);    // calling the bezier
noLoop();  

}

void mouseMoved(){
draw();
}
