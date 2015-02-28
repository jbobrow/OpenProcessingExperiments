
//Reforço4

int x;

size(200, 200);
background(50);

for (x=-100;x<200;x=x+10) {
  noStroke();
  fill(0);
  ellipse(x+100,x*x/100+100,5,5);
    if (x<70 && x>0) {
      fill (235,235,235,3*x);
      ellipse(x+65,65,45,45);
  }
}
