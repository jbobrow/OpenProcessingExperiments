
void setup() {
  size (829, 500);
}
void draw () {
  background(500*float(mouseX)/width, 300-300*float(mouseX)/width, 300/12);

  smooth();
  noStroke();

//RHOMBOID ROTATION * 
for (int i = 0; i < 30; i++) {
  for (int j = 0; j < 30; j++) {
    pushMatrix();
    translate(92 * i, 105 * j  );
    rotate(TWO_PI/3);
    fill(155, 155, 155);
    draw_rohmboid(22, -39);
    rotate(PI/1.5);
    fill(90, 90, 90);
    draw_rohmboid(-67, 41);
    popMatrix();
  }
}

//Rhomboid Repetition
//LINE 1
for (int i = 0; i < 30; i++) {
  for (int j = 0; j < 30; j++) {
    fill(190, 190, 190);
    draw_rohmboid(i * 92, j * 105 );
    //fill(
  }
}
}
//LINE 2
// RHOMBOID PARAMETERS
void draw_rohmboid(float _x, float _y) {
  quad(_x-46, _y, _x, _y-26, _x + 46, _y, _x, _y+26);
}


