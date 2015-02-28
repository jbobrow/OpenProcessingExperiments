
//void setup () {
size (600, 600);
//}

  translate(width / 2.0, height / 2.0);

for (int i=-40; i<100; i++) {

  for (int j=-40; j<100; j++) {
    pushMatrix();
    translate(i*20, j*20);
    rotate(radians(i+j*3));
    rectMode(CENTER);
    rect(0, 0, 10, 10);
    popMatrix();  
}
}



