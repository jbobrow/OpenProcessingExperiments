
PVector [] rain ;

void setup() {
  size(300, 200);
  smooth();
  noStroke();
  rain = new PVector[5];
  for (int i =0 ;i<rain.length;i++) {
    rain[i]= new PVector(50+50*i, -50+15*i);
  }
}
void draw() {
  //background(0);
  fill(0, 20);
  rect(0, 0, width, height);
  for (int i =0 ;i<rain.length;i++) {
    rain[i].y+=2;
    rain[i].x+=1;
    fill(#00B1E0);
    ellipse(rain[i].x, rain[i].y, 7, 7);
    if (rain[i].y>height) {
      rain[i].y=0;
    }
    if (rain[i].x>width) {
      rain[i].x=0;
    }
  }
}



