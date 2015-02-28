
//andrea gershuny
//assignment 08b: array search

float [][]arrayOfGrays;
float randomGray;
int cols = 8;
int rows = 8;

void setup() {
  size(600, 600);

 
  arrayOfGrays = new float[cols][rows];

  // 2D list assignment code taken from processing.org/learning/2darray/
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      randomGray = random(0, 255); 
      arrayOfGrays[i][j] = randomGray;
    }
  }
}

void draw() {
  background(255);
  smooth();
  int circleWidth = (width-50)/10;

  for (int j = 0; j<cols; j++) {
    for (int i=0; i<rows; i++) {
      noFill(); 
      stroke(0, 0, 0, ((arrayOfGrays[i][j])% 255));
      strokeWeight ( map( (arrayOfGrays[i][j])% 255, 0, 255, circleWidth, 0));
      int margin = 75;
      ellipse(margin+(circleWidth+10)*i, margin+(circleWidth+10)*j, 100, 100);
      arrayOfGrays[i][j]+=1;
    }
  }
}
