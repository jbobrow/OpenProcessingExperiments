
size(500, 500);
background(255);

for (int i=0; i<510; i=i+60) {
  for (int j=0; j<510; j=j+60) {

    strokeWeight(2);
    fill(26, 98, 211);
    rect(i+10, j, 10, 20);

    strokeWeight(3);
    fill(26, 98, 211);
    rect(i, j, 30, 15);

    strokeWeight(1);
    fill(0);
    rect(i, j, 12, 12);
  }
}



