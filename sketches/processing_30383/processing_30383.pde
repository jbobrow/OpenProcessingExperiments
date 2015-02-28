
size (800,600); // set up window size
background (255); // define background color
smooth(); // define the render to be smooth

int numObject = 100;

for ( int i = 0; i < numObject; i = i +1)

{
  
  float m = map(i, 0, numObject, 0, 255);
  
  fill(random(255),random(0),random(0),80);
  stroke (10);
  //strokeweight(2);
  rect(random(width),random(height),random(50,200) ,random(50,200));
  
  filter(BLUR, 1);
}
  
  
  saveFrame("t01.jpg");

