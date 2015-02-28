
void setup () {
  size (500, 600 );
}
void draw () {
if(mouseX<height-300)
background (50, 207, 255);
else
background(0,0,128);
  fill (184, 115, 51); 
  rect (150, 75, 250, 375);
  noStroke ();
  fill (30);
  rect (0, 520, 500, 80);
  fill (220, 222, 230);
  rect (270, 415, 75, 35);
  ellipse (307.5, 415, 75, 70);
  stroke (1);
  line (307.5, 450, 307.5, 380);
  noStroke ();
  fill (50, 200, 50);
  rect (0, 450, 500, 50);
  fill (150);
  stroke (2);
  quad (262, 520, 282, 450, 332, 450, 352, 520);
  rect (0, 490, 500, 30);
  noStroke ();
  fill (92, 51, 23);
  rect (30, 420, 15, 60);
  rect (100, 410, 15, 60);
  rect (450, 410, 15, 60);
  fill (33, 94, 33);
  ellipse(37, 420, 55, 55);
  ellipse(107, 410, 55, 55);
  ellipse(457, 410, 55, 55);
  if(mouseX<height-300)
fill (255, 240, 10);
else
fill (250,250,210);
  ellipse (70, 70, 70, 70);
  for (int i = 20; i<500; i = i+70) {
    fill(255);
    rect (i, 570, 45, 10);
  }
  for (int i= 115; i<350; i = i+95) {
    stroke(1);
    fill (184, 115, 51);
    rect ( 220, i, 110, 40);
  }
  fill (230, 232, 250, 210);
  for (int i=85; i<350;i = i+95) {
    rect ( 220, i, 110, 30);
  }
  for (int i=105; i<350; i = i +95) {
    rect (165, i, 35, 35);
    rect (345, i, 35, 35);
    rect (180, 390, 35, 35);
  }
}
