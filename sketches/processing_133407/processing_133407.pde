
size(600, 600);
background(0, 60,100);

//small pink cirlces
smooth();
for (int y = 0; y <= height; y += 40) { //row of circles across top
  for (int x = 0; x <= width; x += 40) {//row of circles going down
  fill(255, 140, 255); //pink
  ellipse(x, y, 20, 20); //line of code
  }
}

//white cirlces
smooth();
noStroke(); //took away the outline of the white circles
for (int y = 10; y <= height; y += 40) { //row of circles across top
  for (int x = 10; x <= width; x += 40) { //row of circles going down
    fill(255, 140); //white and a little transparent
    ellipse(x, y, 20, 20);
  }
}
//tiny green circles
smooth();
stroke(0); //puts the stroke back and in black
for (int y = 10; y <= height; y += 40) { //across
  for (int x = 10; x <= width; x += 40) { //down
    fill(108, 209, 140); //green
    ellipse(x, y, 5, 5);
  }
}

// big yellow rings
smooth();
stroke(255, 212, 100); //yellow rings
for (int y = 10; y <= height; y += 40) {
  for (int x = 10; x <= width; x += 40) {
    noFill(); //makes them open on the inside
    ellipse(x, y, 100, 100);
  }
}



