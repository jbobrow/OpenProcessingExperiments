
int fancy=3;
size(300*fancy,200*fancy);
background(162,193,186);
strokeWeight(10);
stroke(7,16,79);
strokeWeight (100); 
line(90*fancy,40*fancy,90*fancy,165*fancy);

//arc(550, 250, 800, 500, 670, HALF_PI);
noFill();
stroke(219,37,134);
arc(200*fancy, 74*fancy, 75*fancy, 80*fancy, HALF_PI, PI);
stroke(165,32,9);
arc(200*fancy, 75*fancy, 75*fancy, 80*fancy, PI, PI+QUARTER_PI);
stroke(253,247,0);
arc(200*fancy, 76*fancy, 75*fancy, 80*fancy, PI+QUARTER_PI, TWO_PI);
stroke(122,36,219,75);
ellipse(119*fancy, 46*fancy*fancy, 55*fancy, 55*fancy);
stroke(5,255,149,65);
ellipse(119*fancy, 80*fancy, 55*fancy, 55*fancy);
