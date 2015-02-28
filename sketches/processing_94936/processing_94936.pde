
/*Snow Man*/
int i;

void setup (){
  size (500, 500);
  background (150, 182, 191);
  frameRate (1);
  stroke (7);
}

void draw (){
 if (random(0,1) <0.5){
  fill (255);
  rect (0, 360, 500, 500);
  fill (255);
  ellipse (250, 350, 90, 90);
  ellipse (250, 290, 70, 70);
  ellipse (250, 250, 50, 50);
  fill (3,3,3);
  ellipse (240, 250, 5, 5); // left eye
  ellipse (260, 250, 5, 5); // right eye
  fill (245, 67, 67);
  ellipse (250, 280, 7, 7); //red buttons
  ellipse (250, 300, 7, 7);
  ellipse (250, 320, 7, 7);
  fill (129, 93, 46);
  line (220, 290, 200, 320); //arms
  line (280, 290, 300, 320);
  fill (245, 120, 57);
  triangle ( 245, 255, 250, 265, 255, 255); // nose
  fill (255);
 } else {
  fill (255);
  rect (0, 360, 500, 500);
  fill (255);
  ellipse (250, 350, 90, 90);
  ellipse (250, 290, 70, 70);
  ellipse (250, 250, 50, 50);
  fill (3,3,3);
  ellipse (240, 250, 5, 5); // left eye
  ellipse (260, 250, 5, 5); // right eye
  fill (3, 3, 3);
  ellipse (250, 280, 7, 7); // black buttons
  ellipse (250, 300, 7, 7);
  ellipse (250, 320, 7, 7);
  fill (129, 93, 46);
  line (220, 290, 200, 320); //arms
  line (280, 290, 300, 320);
  fill (245, 120, 57);
  triangle (245, 255, 250, 265, 255, 255); //nose
  fill (255);
 }
 for (i = 0; i < 10; i++) {
   ellipse(random(1, 500), random(1, 390), random(5, 5), random (5, 5));
 }
}

