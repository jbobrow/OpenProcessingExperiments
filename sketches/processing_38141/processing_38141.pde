
size(400, 600);
colorMode(RGB);
background(25, 180, 180);

//curved lines in bcakground
for (int countY=0; countY<=width; countY+=10) {
  stroke(180);
  strokeWeight(2);
  line(100+countY, height, 200, 200-countY);

//series of changing ellipses
  for (int countX=0; countX<width; countX+=30) {
    noStroke();
    fill(width, 0, 0);
    ellipse(400-countX, height/4*3, 10, 200-countX+50);
    fill(width, 150, 0);
    ellipse(0+countX, height/4, 10, 200-countX+50);
    for (int countZ=20; countZ>=5; countZ-=2) {
      fill(width, 200, 0);
    }
  }
}


