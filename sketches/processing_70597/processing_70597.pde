
size(520, 500);
background(#FF3636);
noStroke();

for (int a =40; a<=500; a+=60) {

  for (int b =40; b<=500; b+=80) {

    ellipse(a, b, 50, 50);
  }
}//big ellipse 01

fill(#FF0505);
for (int a =47; a<=500; a+=60) {

  for (int b =47; b<=500; b+=80) {

    ellipse(a, b, 35, 35);
  }
}//big ellipse 02

fill(#CB1515);

for (int a =74; a<=500; a+=60) {

  for (int b =80; b<=500; b+=80) {

    ellipse(a, b, 20, 20);
  }
}//small ellupse 01


fill(#810707);

for (int a =58; a<=500; a+=60) {

  for (int b =90; b<=500; b+=80) {

    ellipse(a, b, 10, 10);
  }
}//small ellupse 02

fill(#3B0202);

for (int a =43; a<=500; a+=60) {

  for (int b =85; b<=500; b+=80) {

    ellipse(a, b, 5, 5);
  }
}//small ellupse 03
