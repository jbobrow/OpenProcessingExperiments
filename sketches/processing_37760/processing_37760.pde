
size(500, 300);
background(100);
colorMode(RGB, 500);
smooth();

//background circle patterns.
for (int x=0; x<width; x+=50) {
  for (int y=10; y<width; y+=25 ) {
    noFill();
    stroke(255);
    ellipse(x, height/2, y, y);
  }
}


//ring of red circles translated then multiplied across the screen.
for (int x=0; x<width+10; x+=20) {
  for (int i=0; i<360; i+=45) {
    pushMatrix();

    translate(x, height/2);
    rotate(radians(i));

    fill(width, i, i);
    ellipse(16, 0, 10, 10);

    popMatrix();
  }
}

//gray layered circles.

for (int y=10; y<=height; y=y+25){
  for(int x=10; x<=50; x=x+1){
    fill(100);
    noStroke();
    ellipse (350,y,x,x);
  }
}


