
void setup(){
  size(854,480);
    noLoop();  // draw() will not loop




}
float x = 0;

void draw(){
  background (0);
  fill(255, 0, 0);
beginShape ();
vertex (72.28,63.44);
vertex (91.19,73.62);
vertex (105.01,64.89);
vertex (114.11,75.44);
vertex (122.48,64.89);
vertex (133.39,71.07);
vertex (141.75,67.44);
vertex (147.21,71.07);
vertex (172.31,54);
vertex (193.09,79.44);
vertex (203.23,71.07);
vertex (210.5,75.8);
vertex (224.32,66.71);
vertex (238.82,46.32);
vertex (248.69,74.35);
vertex (263.24,64.89);
vertex (275.97,65.62);
vertex (295.98,63.8);
vertex (307.26,63.8);
vertex (283.35,97.63);
vertex (339.99,97.63);
vertex (339.99,127.46);
vertex (283.25,127.46);
vertex (364,266.04);
vertex (10.31,266.04);
vertex (91.46,125.57);
vertex (34.74,125.57);
vertex (34.83,97.67);
vertex (91.19,97.63);
endShape (CLOSE);
stroke(141,198,63);
 strokeWeight(10);
 line(161.25,203.29,214.73,203.29);
 x = x + .1;
  if (x > height) {
    x = 0;
  }
  line(x, 0, x, width); 
}

void mousePressed() {
   noLoop();  // Holding down the mouse stops looping
}

void mouseReleased() {
  loop();  // Releasing the mouse activates looping draw()
}







