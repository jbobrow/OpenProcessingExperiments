
size (400, 400);
background(0);
smooth();
strokeWeight(2);
for (int i = 5; i <=600; i += 25) {
  for(int j = 10; j <= 600; j += 25){
    fill(10, 32, 125);
  rect(i+j, j, 14 - j/10.0, 14 - j/10.0);

  }
}

