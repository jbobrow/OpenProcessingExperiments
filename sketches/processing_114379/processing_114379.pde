
//BOUNDARIES: Circle & Square
//VIIRJ.COM, 2013

int c1 = 150;
int c2 = 210;
int d1 =380;
int d2 = 257;
  
void setup() {
  size( 600, 600);
  smooth();
  strokeWeight(20);
}

void draw() {
  background(255);


// LEFT square: disappears when mouse over
  if ((mouseX >= c1) && (mouseX <= c1+100) &&
    (mouseY >= c2) && (mouseY <= c2+120)) {
    strokeWeight(20);
    fill(random(2), random(255), random(255));
  } else {
    rect(c1, c2, 100, 100);
    stroke(245);
  }

//RIGHT circle: disappears when mouse over

  float x = dist(mouseX, mouseY, d1, d2);
  if (x<=110) {
    fill(random(255), random(2), random(255));
  } else {
    ellipse(d1, d2, 110, 110);
    fill(255);
  }
}




