
//Xiongfei Zhang
//Gravity Simulation

void setup() {
  size(500, 500);
  smooth();
}

float yPos=25;
float g=.15;
float acceleration=0;

void draw() {
  background(0);
  makeball();
  yPos += acceleration;
  //ball drop or bounce back
  acceleration += g;
  //accelerate speed add g
  //when bounce back, -acceleration+g = slower speed
  if (yPos>475) {
    acceleration=-acceleration/1.15;
    //when hit bottom, bounce back, but drop down at lower height
    //Thanks to Mauricio
  }
}

void makeball() {
  ellipse(width/2, yPos, 50, 50);
  fill(255);
}
                
