
/*Felix Anderson
Creative Computing
Benjamin Bacon
3/12/14*/




int q = 0;
size(600, 600);
background(300,20,50);
  
noStroke();
 
while (q <= 600) {
  int e = 0;
  while (e <= 600) {
    fill(200, 130, 50);
    ellipse(q, e, 25, 25);
    e= e+40;
  }
  q=q+45;
}



