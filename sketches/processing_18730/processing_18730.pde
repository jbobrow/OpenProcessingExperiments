
void setup () {
  size (250, 250);
  background (69,187,255);
}
void draw () {
  fill(69,187,255,30);
  stroke(0);
  background(125,240,254);
  
  // left side
  rect(-20 - (mouseX - 10), 0, 120, 45);
  fill(0,108,255,70);
  rect(-20 - mouseX, 40, 170, 50);
  fill(0,210,255,100);
  rect (-20 - mouseX, 80, 100, 65);
   fill(69,140,240,70);
  rect(-20 - mouseX, 130, 160, 70);
   fill(0,255,252,70);
  rect(-20 - mouseX, 160, 90, 100);
   
  // right side
  fill(0,108,255,70);
  stroke(0);
  rect(100 + mouseX, 0, 150, 50);
 fill(0,255,252,70);
  rect(150 + mouseX, 40, 100, 45);
  fill(0,108,255,70);
  rect (90 + mouseX, 80, 170, 73);
   fill(0,210,255,70);
  rect(130 + mouseX, 130, 110, 60);
   fill(69,140,240,70);
  rect(100 + mouseX, 180, 230, 100); 
}


