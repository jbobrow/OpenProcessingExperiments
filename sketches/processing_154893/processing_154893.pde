


float counter, x;
color[] couleur = new color[3];

void setup() {
  size(600, 600, P2D);
  frameRate(5);

  couleur[0] = color(255, 65, 188);
  couleur[1] = color(232, 147, 47);
  couleur[2] = color(101, 255, 176);
}

void draw() {
background(255);
smooth(8);
translate(300, 300);
  counter += 0.1;

  for (float i=0; i<360; i+=0.5) {
    if (i > 180) {
      x = 180 - (i%180);
    } else {
      x = i;
    }
pushMatrix(); 
rotate(radians(i));
translate(0, 200);
rotate(radians(i+3));
scale( map(sin(radians(x*counter*sin(counter))), -1, 1, 0.5, 1), map(sin(radians(x*counter*sin(counter))), -1, 1, 0.5, 1));
noFill();
    drawFigure();
popMatrix();
  }

endDraw();

}


void drawFigure() {
noFill();
stroke(couleur[2], 100);
triangle(0,-40,-60,40,60,40);
  //canvas.ellipse(0, 0, 120, 80);
}



