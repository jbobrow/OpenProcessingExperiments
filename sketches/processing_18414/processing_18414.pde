
void setup () {
  size (250, 250);
  background (#F5A78A);
}
void draw () {
  fill(#987B86, 100);
  noStroke();
  background(#F5A78A);
  rect(-20 - (mouseX - 10), 0, 120, 50);
  fill(#C18B89, 190);
  rect(-20 - mouseX, 40, 170, 50);
  fill(#7E4E57, 160);
  rect (-20 - mouseX, 80, 100, 70);
   fill(#987B86, 160);
  rect(-20 - mouseX, 130, 160, 50);
   fill(#C18B89, 180);
  rect(-20 - mouseX, 160, 90, 100);
  
  // other side
  
  fill(#987B86, 180);
  noStroke();
  rect(100 + mouseX, 0, 150, 50);
  fill(#C18B89, 150);
  rect(150 + mouseX, 40, 100, 50);
  fill(#7E4E57, 170);
  rect (80 + mouseX, 80, 170, 70);
   fill(#987B86, 150);
  rect(140 + mouseX, 130, 110, 50);
   fill(#C18B89, 180);
  rect(70 + mouseX, 160, 230, 100);
  
  
  
  
}

