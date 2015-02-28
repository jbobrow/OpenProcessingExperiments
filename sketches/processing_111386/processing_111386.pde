
//Code-Objects: For loops: Ellipse shape 
//VIIRJ.COM, 2013


void setup() {
  size(600, 600);
  fill(200);
  smooth();
}

void draw() {
  background(0);
  noStroke();
  float v;
  float y;
  v = mouseX+80;
  y = mouseY-200; //how much of the ellipses the mouse will effect

  for (float i=2; i<=width; i=i+30) {//changes the spacing between the ellipses
    for (int j=0; j<=height;j=j+30) {//changes the spacing between the ellipses
      float r = random(-20, 20);
      fill(20*r, y++, v*r, 210); //changes color of dots
      ellipse(i, j, 10, 10);//changes the size and location of ellipses
    }
  }
}



