
int xPos;
int yPos;
int xSpeed;
int ySpeed;
int numCircle=50;
//do we need floats? float [] circleX= new float [numCircles]; // an array of floats called circle x, which means those index numbers will go from 0-49
//float[] circleY=new float [numCircles]

void setup () {
  size (500, 500);
  smooth(); // use smooth so that your circles are anti-aliased, i.e. not pixely
  noStroke(); // let's leave the stroke off. Comment this out to see it with stroke
  colorMode(RGB, 256); // optional: declare color mode (RGB, HSV, etc.) and the range

  for (int i = 0; i < numCircle; i++) {

    void draw() {
      background(255, 25, 0);
      fill(255, 105, 180, 200);

      if (xPos[i] > width || xPos[i]<0) {
        xSpeed=(xSpeed*-1);
        x=x+speed;
      }
      if (yPos[i] > height || yPos[i]<0) {
        ySpeed=(ySpeed*-1);
        y=y+speed;

        for (int i = 0; i < numCircle; i++) {
          circleX[i]=random(width)
            circleY[i]=random(height)
              ellipse(circleX[i], circleY[i], i+20, i+20);

          //are we drawing 50 circles all horizontally? or randomly?
        }
      }
