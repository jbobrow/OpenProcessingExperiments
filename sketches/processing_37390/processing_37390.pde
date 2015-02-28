
size (300, 300);
background (140);
smooth();

for (int x = 50; x <= 250; x+=65) { //horizontal repetition
  for (int y = 50; y <=250; y+=65) { // vertical repetition
    strokeWeight(1.5);
    stroke(300-y); // change color of outline by row
    fill(40+y, 120+y, 240); //change color of fill by row
    //draw the "power" button
    ellipse(x, y, 50, 50);
    ellipse(x, y, 20, 20);
    noStroke();
    fill(40+y, 120+y, 240);
    rect(x-6, y-15, 12, 10);
    stroke(300-y);
    line(x, y, x, y-10);
  }
}


