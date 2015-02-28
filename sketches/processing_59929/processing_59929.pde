
size(500, 330);
background(0);
noFill();
//C
for (int i=20; i<400; i=i+20){
  for(int x=20; x<200; x=x+25){
    noFill();
    strokeWeight(5);
    smooth();
    stroke(i, 2*i, 3*i);
    ellipse(3*i/2, 3*x/2, 40, 40);
  }
}

