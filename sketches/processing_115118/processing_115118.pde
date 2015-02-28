
int numCircles = 100;
float gradientColor = 0;

void setup() {
  size(700, 700);
  frameRate(30);
}

void draw() {
 background(200);
  // if(numCircles > 0) {
  //  noStroke();
  //  gradientColor = map(numCircles, 0, 100, 0, 255);
  //  fill(gradientColor);
  //  ellipse(width/2, height/2, numCircles*7, numCircles*7);
  //  numCircles-=4;
  // }
  


//  numCircles = 100;
//  while ( numCircles > 0 ) {
//    noStroke();
//    gradientColor = map(numCircles, 0, 100, 0, 255);
//    fill(gradientColor);
//    ellipse(width/2, height/2, numCircles*7, numCircles*7);
//    numCircles-=5;
//  }

  for(int i = 100; i > 0; i-- ) {
    noStroke();
    gradientColor = map(i, 0, 100, 0, 255);
    fill(gradientColor);
    ellipse(width/2, height/2, i*7, i*7);
  }
  noStroke();
  fill(0);
  for(int i = 0; i < 70; i++ ) {
    for(int j = 0; j < 70; j++ ) {
      ellipse(i*10+5, j*10+5, 10, 10);
    }
  }

}
