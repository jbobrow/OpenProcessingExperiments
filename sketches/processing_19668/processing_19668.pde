
size(250, 250);
background(#031634);
smooth();

noFill();
strokeWeight(10);


stroke(255, 150);
for(int y = 0; y < 280; y += 40) {
  for(int x = 0; x < 280; x += 40) {
    ellipse(x, y, 20, 20);}
}

stroke(#E8DDCB, 150);
for(int y = 10; y < 280; y += 40) {
  for(int x = 10; x < 280; x += 40) {
    ellipse(x, y, 20, 20);}
}


stroke(#036564, 150);
for(int y = 20; y < 280; y += 40) {
  for(int x = 20; x < 280; x += 40) {
    ellipse(x, y, 20, 20);}
}

stroke(#033649, 150);
for(int y = 30; y < 280; y += 40) {
  for(int x = 30; x < 280; x += 40) {
    ellipse(x, y, 20, 20);}
}

stroke(#036564, 50); //green rectangles
rectMode(CENTER);
for(int w = 480; w > 0; w -= 80) {
  for(int h = 480; h > 0; h -= 80) {
    rect(250, 250, w, h);}
}

stroke(255);
strokeWeight(0.25);
//overlapping circles with reduced opacity
fill(255, 60);
ellipse(250, 250, 150, 150); //starting from the bottom right corner
fill(255, 60);
ellipse(250, 250, 250, 250);
fill(255, 60);
ellipse(250, 250, 350, 350);
fill(255, 60);
ellipse(250, 250, 450, 450);
fill(255, 60);
ellipse(250, 250, 550, 550);






