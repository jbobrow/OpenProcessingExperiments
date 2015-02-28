
size (500,500);

background (45,90,180);
strokeWeight (2);
smooth();
strokeCap (ROUND);



int x=350;
if (x>50) {
  ellipse (x+30,350,100,100);
}

if (x==350){
  line (370,220,95,60);
}

fill (60,195,170);
if (x<3000){
  ellipse (110,340, 300,300);
}

if (x>800){
  rect (300,218,50,85);
}


