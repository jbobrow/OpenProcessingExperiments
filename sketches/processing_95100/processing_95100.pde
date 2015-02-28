
void setup(){
size(200,200);
background(255);
noStroke();
colorMode(RGB, 100);
for (int i = 0; i < 200; i++) {
  for (int j = 0; j < 200; j++) {
    stroke(i*i/150, j*j/150, 75);
    point(i, j);
  }
}

int i;
stroke(1);
for (i=-350;i<200;i+=4){
fill(206, 232,223);
strokeWeight (1);
stroke (218, 240, 232);
ellipse(i+100,i*i/120+100,5,5);
ellipse(-i+100,-i*i/120+100,5,5);
ellipse(i*i/120+100,i+100,5,5);
ellipse(-i*i/120+100,-i+100,5,5);
 }
}
