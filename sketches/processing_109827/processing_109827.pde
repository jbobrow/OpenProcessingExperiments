
size(800, 800);

noStroke();
//stroke(#FFFFFF);
rectMode(CENTER);
for (int i=1200; i>0; i=i-20) {
//println(i);
  if (i%30==0) {
    pushMatrix();
    translate(width/2, height/2);
    fill(#FFFFFF, 60);
    rotate(PI/4);
    rect(0, 0, i, i);
    popMatrix();
  } 
  else {
    fill(#FA7E30, 60);
    rect(width/2, height/2, i, i);
  }
}



