
size (300,300);
float [] barGraph= {
  70, 170, 60, 40, 150, 190, 140, 20, 210
};
background (55);
noStroke ();
for (int i =0; i< barGraph. length; i++) {
  float x1=i*30;
  float y1=height-barGraph [i];
  float x2=20;
  rect (x1, y1, x2, barGraph [i]);
}

