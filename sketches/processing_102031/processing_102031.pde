
/* Sebastian Shader
cmps 5J
pa3
*/

void setup()
{
  size(1440, 850);
  background(255);
  smooth();
  frameRate(30);
  colorMode(HSB, 100);
}

void draw()
{ boolean drawing = true;
  //only if the mouse is pressed and the variables mouseX and mouseY aren't at their initial values
  if(mousePressed == true && mouseX !=0 && mouseY !=0){
    // this looop creates 4 quadrilateral spears of random size, each at a random angle, for the 4 quadrants
  for(int i=0; i < 4; i ++)
    {
      // random value between 0 and pi/2
      float degree = random(HALF_PI);
      // add to 0, 1, 2, and 3 times pi/2
      degree += (i*HALF_PI);
      //random size
      float magni = random(50, 400);
      // Hue changes with mouseX, brightness changes with mouseY, constrained to the range in colorMode in setup()
      fill(constrain((random(10)+mouseX*100/width), 0, 100), 100, constrain(70+(random(10)+mouseY*25/width), 75, 100),50);
      //quadrilateral with randomized "width". The middle (3rd point) of the shape is the one multiplied by 1.2*magnitude
      float divide = random(4, 10);
      quad(mouseX, mouseY, mouseX+(magni*cos(degree)), mouseY+(magni*sin(degree)), mouseX+(magni*1.2*cos(degree+(QUARTER_PI/(divide*2)))),
      mouseY+(magni*1.2*sin(degree+(QUARTER_PI/(divide*2)))), 
      mouseX+(magni*cos(degree+(QUARTER_PI/divide))), mouseY+(magni*sin(degree+(QUARTER_PI/divide))));
    }
  }
}
//clear screen (draw it white) if a key is pressed
void keyPressed(){
  background(0, 0, 100);
}


