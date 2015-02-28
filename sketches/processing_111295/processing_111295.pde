
size(600, 600);
//background(254,224,214);light pink
background(220, 212, 210);
smooth();
noFill();
colorMode(RGB);


for (int i=0; i<600; i=i+10) {
  for (int j=0; j<600; j=j+15) {
    float a = map(j, 0, width, 0, 100);
    float b = map(i, 0, width, 0, 100);
    //stroke(153, 200, 200);blue


    //neon yellow lines
    stroke(217, 222, 47);

    ellipse(width/2, width/2, i, j);
    stroke(118, 105, 121);
    ellipse(width/2-100, width/2+100, i, j);
    stroke(193, 176, 168);
    ellipse(width/2+100, width/2+100, i, j);

    //pink center over lay circle
    //fill(247, 182, 214,5);
    strokeWeight(0.01);
    stroke(247, 182, 214);
    ellipse(width/2, width/2, i, j);
  }
}



