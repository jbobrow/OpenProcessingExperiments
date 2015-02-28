
//My title of this artistics call 'The Distraction on the bottom'
//My intention/artistics
//1. To draw the randomness or different colors
//2. The size of the objects depends of the location of the objects
//the biggest at the bottom.

//Global Variables
float x= 0;
float y = 0;
float counter = 0;
//Color pallete 5 different colours
color[] palette =
{
  #4157CE, #EF33F8, #BEEB9F, #79BDBF, #00A388
};

//create setup code block
void setup() {
  size(1280, 720);
  background(palette[0]);
  noLoop();
}

//create draw code block
void draw() {
  //Setup while loops
  while (counter < 500) {
    //set for stroke color
    float r = random(1, 5);
    //set stroke thikness randomly
    strokeWeight(int(random(1, 10)));
    //set random palette color
    stroke(palette[int(r)]);
    noFill();
    x=random(width);
    y=random(height);

    //draw ellipse
    ellipse(x, y, y, y);
    strokeWeight(int(random(1, 10)));
    //rect(x, y, y, y);
    rect( x, y, y, y, 30 );
    // incresing counter with 1
    counter++;
  }
}


