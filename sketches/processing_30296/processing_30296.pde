

size(300,200);
background(255);
noStroke();
colorMode(HSB, 100);
for (int i = 0; i < 100; i++) {
     stroke(i, 100);
    //point(i);
    ellipse(150,200,300-i,300-i);
}
