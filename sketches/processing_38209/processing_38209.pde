
//Iv Sqhevi
//lab4 loop
// is it squares or is it circles?
background(0);
size(600, 400);
rectMode(CENTER);
for (int countx=0;countx<width/50;countx++) {
  for (int county=0;county<height/50;county++) {
    for (int circleSize=100; circleSize>5;circleSize-=5) {
      noFill();
      stroke(255, 0, 0);
      ellipse(50+(countx*50), (50+(county*50)), circleSize, circleSize);
    }
  }
}


