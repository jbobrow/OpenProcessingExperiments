
float int px=12;
void setup () {
  size(600, 600);
}
void draw() {
px ++ ;
  if (mouseY<200) {
    background (10, 6, 6);
  }
  else {  
    background(255, 252, 252);
  }
  ellipse (px 40, 40, 60, 60);
}

