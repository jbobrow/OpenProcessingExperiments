
void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB, 100, 200, 100);
  background(50, 5, 100);
}


int colorSlider;   //changes the saturation from each base level
int counter;      // divides the x axis 

void draw() {
}

void mousePressed() {
  colorSlider = 5;   // base saturation level
  background(50, 5, 100);     //resets the background



  for (float base = height/4; base < height; base +=50) {        //draw an amount of base lines for the composition

    counter = floor(random(5, 15));        //controls the amount of level changes per base
    float space;
    float segment = width/counter;
    colorSlider +=35;


    for (space = 0; space <= width; space += segment ) {  //regulates the composition along the x axis
      float rise = random(75);                 // determine heights for the peaks
      float riseAgain = random(75);
      noStroke();
      fill(8, colorSlider, 100);           // changes the saturation per base

      //the shadow peaks
      fill(0, 50, 0); 
      quad(space-5, base+50, space-8, base - rise-8, space + segment+1, base - riseAgain-5, space + segment+1, base+50);
      //actual peaks
      fill(8, colorSlider, 100);
      quad(space, base+50, space, base - rise, space + segment, base - riseAgain, space + segment, base+50);

      //creates a line that "fly" through the peaks
      int lineGenerator = floor(random(3));
      if (lineGenerator == 2) {
        stroke(55, 200, 100);
        strokeWeight(4);
        line(space-7, base, space + segment, base);
      }
    }
  }
}


