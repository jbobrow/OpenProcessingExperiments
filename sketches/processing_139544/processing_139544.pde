
/**
 Yingying Yang
 Creative Computing Section B
 Wk 5 Assignment 2 - Static Composition (Nested loop)
 */

size(500, 500);
int k = 0;
while (k <= 0) {
  int i = 0;
  int j = 500;
  while (i <= 250) {

    noStroke(); 
    fill(i, 125, 125, i);
    ellipse(i, i, i, 50);
    ellipse(i, i, 50, i);
    i += 10;
  }

  while (j >= 250) {
    noStroke(); 
    int c = int(map(j, 250, 500, 250, 0));
    fill(c, 125, 125, c);
    ellipse(j, j, c, 50);
    ellipse(j, j, 50, c);
    j -= 10;
  }
  k += 1;
}


