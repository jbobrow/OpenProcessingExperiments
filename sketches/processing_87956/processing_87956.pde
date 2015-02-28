

  size(400, 400);
background(19, 55, 111);
for (int a = 70; a > 0; a -= 5) {
for (int b = 40; b > 0; b -= 2){

noFill();
fill(103, 250, 8);

rect(a *a, b*b, b*a, a*a);
}
}



