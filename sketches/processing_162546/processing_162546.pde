
size(700, 500);
background(255);
smooth();
fill(255, 20);
float scaleVal=18.0;
float angleInc=PI/28.0;
float angle=0.0;
for (int offset=-10; offset<width+10; offset+=5) {
  for (int y=0; y<=height; y+=2) {
    float x=offset+(sin(angle)*scaleVal);
    noStroke();
    fill(150,30,90,100);
    ellipse(x,y,5,5);
    strokeWeight(2);
    stroke(255);
    point(x,y);
    angle+=angleInc;
  }
  angle +=PI/4*3;
}



