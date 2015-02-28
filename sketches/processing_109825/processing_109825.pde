
size(800, 800);


rectMode(CENTER);
for (int i=800; i>0; i=i-10) {

  if (i%20==0) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/4);
    rect(0, 0, i, i);
    popMatrix();
    fill(#FFDF29);
  }
  fill(#FFFFFF);
  rect(width/2, height/2, i, i);
}



