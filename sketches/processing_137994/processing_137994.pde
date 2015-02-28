
size(600, 600);

int i = 0;

while (i<=10) {

  rect(300, 53*i+25, 50, 50);

  int j = 0;
  while (j<=5) {
    ellipse(25*j+300, 50*i+40, 25, 25);
    j = j + 1;
  }

  i = i + 1;
}



