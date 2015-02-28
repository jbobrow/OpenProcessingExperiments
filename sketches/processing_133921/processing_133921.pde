

size (400, 400);
background (1, 145, 179);
noStroke();

for (float x = 10; x <= 400; x+=20) {
  for (float y = 10; y <= 400; y+=20) {
    fill(x/4, y/4, x/4);
    ellipse(x, y, 20, 20);
  }
  //println("@x="+x+"y="+y); //used for debugging
}


