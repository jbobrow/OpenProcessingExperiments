
//import processing.pdf.*;



size (600, 600);
background (255);
//beginRecord (PDF, "Circle_grid5.pdf");
smooth ();



//noStroke ();
strokeWeight (1.5);
stroke (0);
int w =40;
int h = 200;

for (int hy = 0; hy < width; hy += 22) {
  for (int yy = 0; yy <height; yy +=80) {
    fill (226, 169, 76, 155);
    ellipse (hy, yy, w, h);
    fill (126, 150, 26, 55);
    ellipse (hy, yy, w/1.5, h*2);
    fill (226, 50, 76, 100);
    ellipse (hy, yy, w/4, h-w);
  }
}
//endRecord ();



