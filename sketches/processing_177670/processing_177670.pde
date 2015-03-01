
void setup () {
  size(600, 600);
  smooth();
}
 
void draw () {
  background(#57385c);
  fill(#ffedbc);
  stroke(#A75265);
  int num = (int) map (mouseY, 0, height, 100, 5000);
  int numRadius = (int) map(mouseX, 0, width, 0, 50);
  
  int i = 0;
  while (i < num) {
    float a = TWO_PI / num * i;
    float radiusAngle  = map (i, 0, num, 0, numRadius *TWO_PI);
    float radius = 150 + sin(radiusAngle) * 90;
    float x = width/2 + cos(a) * radius ;
    float y = height/2 + sin(a) * radius ;
     
    ellipse(x, y, 6, 6);
    i = i + 1;
  }
}
