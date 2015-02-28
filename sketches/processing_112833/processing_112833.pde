
int a = 150;
int b = 210;
int c =380;
int e=257;
int radius=110;

void setup() {
  size( 600, 600);
  smooth();
}

void draw() {
  background(random(250, 254), 220, 210);

  noStroke();


  //backgorund random

  if (mousePressed) {


    for (int x = 0; x<width; x +=10) {

      for (int y = 0; y<height; y+=20) {
        fill (random(200), random(210), 140);//set a random color
        noStroke();
        rect (x, y, 20, 20);
        rect (x, y, 10, 10);
      }
    }
  }



  // RECTANGLE
  if ((mouseX >= a) && (mouseX <= a+100) &&
    (mouseY >= b) && (mouseY <= b+120)) {
    fill (125, 174, 179);
  } 
  else {
    fill(125, 174, 179);
    rect(a, b, 100, 100);
  }
  if ((mouseX >= a) && (mouseX <= a+100) &&
    (mouseY >= b) && (mouseY <= b+120)) {
    fill(196, random(100, 138), 31);
    ellipse(a+30, b+50, 50, 50);
    
      

    
  }
  //ELLIPSE

  float d = dist(mouseX, mouseY, c, e);
  if (d<=radius) {
    fill(207, 251, 252 );
  } 
  else {
    fill(252, 23, 138);
  }
  if (keyPressed) {
    noFill();
    strokeWeight(90);
    stroke(0);
  }
  ellipse(c, e, radius, radius);
} 



