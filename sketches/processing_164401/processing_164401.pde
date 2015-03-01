
int num = 40;
int[] x = new int[num];
int[] y = new int[num];
 
void setup() {
  size(1000, 600);
  smooth();
  noStroke();
}
 
void draw() {
  background(0, 102, 0);
  for (int i = x.length-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0] = mouseX;  //Make the first element
  y[0] = mouseY;  //Make the first element
  for (int i = 0; i < x. length; i++) {

// POOL TABLE
fill(0);
ellipse(1, 1, 230, 230);  //Corner Pocket TL
ellipse(1, 599, 230, 230);  //Corner Pocket BL
ellipse(999, 1, 230, 230);  //Corner Pocket Tr
ellipse(999, 599, 230, 230);  //Corner Pocket Br
fill(255, 0, 0);

// POOL TEXT
textSize(70);
textAlign(CENTER);
strokeWeight(22);
text("PLAY POOL", 500, 300);   //Press

//BALL
fill(0);
ellipse(x[i], y[i], 130, 130);  //8 Ball
fill(255);
ellipse(x[i], y[i], 80, 80); 
fill(0);
textSize(80);
textAlign(CENTER);
strokeWeight(22);
text("8", x[i], y[i]+26);   //Press
  }
}

