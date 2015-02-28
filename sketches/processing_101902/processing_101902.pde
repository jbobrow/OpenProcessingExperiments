
void setup() {
  size(1000, 1000);
  fill(#ff0000);
  frameRate(30);
  stroke(5);
}
 
void draw() {
  float[][] points = new float[160][2];
  int numberOfPoints = 3;
  float radius = width / 2 - 10;
  float radian = 0;
  
  translate(width/2, height/2); 
  background(255);
  numberOfPoints = floor(70 * mouseX / width) + 3;
  text(numberOfPoints, -width/2 + 15, -height /2 + 30); 
  for (int i = 0; i < numberOfPoints; i++) {
    radian = i * PI * 2 / numberOfPoints;
    points[i][0] = radius * sin(radian);
    points[i][1] = radius * cos(radian); 
  }

  for (int i = 0; i < (numberOfPoints - 1); i++) {
    for (int j = i + 1; j < numberOfPoints; j++) {
      line(points[i][0], points[i][1], points[j][0], points[j][1]);
    }
  }
//  println(frameCount);

}


