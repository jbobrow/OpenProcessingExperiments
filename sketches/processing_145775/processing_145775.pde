
void setup() {
  size(500, 500);
  background(255);
}
float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;


void draw() {
  pathR=centerR+R*sin(a);
  a=a+.03;

  pathG=centerG+G*sin(a1);
  a1=a1+.03;
 
  pathB=centerB+B*sin(a2);
  a2=a2+.03;
  fill(255, 25);
  noStroke();
  rect(0, 0, width, height);
  translate(250, 250);
  for (int i=0; i<9; i++) {
    rotate(millis()/1500.0);
    fill(pathR, pathG, pathB, 50);
    if (mousePressed) {
      stroke(pathR, pathG, pathB);
    } else {
      noStroke();
    }
    bezier(0, 0,  80, 5,  80, 75,  30, 150);
  }
}

    
  
