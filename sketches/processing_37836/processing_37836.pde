
size (300, 300);
background(140, 80, 20);
smooth();

for (int x = 50; x<=250; x+=65) { //horizontal spacing
  for (int y = 0; y <=height; y+=40) { //vertical spacing
    for (int circle = 50; circle >=0; circle-=10) { //draw orb starting with biggest circle
      stroke(255);
      strokeWeight(circle/20);  //make circle outline thicker than inner lines
      fill(200-x, 255-x, 255-y); // change color of each orb
      ellipse(x, y, 50, circle); //draw the orbs
    }
  }
}


