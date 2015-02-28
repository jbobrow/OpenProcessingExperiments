
size(250,250);
background(#1960F5);
smooth();
 
for(int bob=200;bob>0;bob=bob-12){
  stroke(bob+30,bob+159,209);
noFill();
bezier(285,2,19,30,185,bob,0,bob);
}
for(int bob=200;bob>0;bob=bob-12){
  stroke(bob+67,11,bob+50);
noFill();
bezier(220,30,150,89,99,bob,bob,0);
}
for(int bob=300;bob>0;bob=bob-12){
  stroke(10,bob+30,198);
noFill();
bezier(bob,30,200,89,0,bob,38,900);
}
save("patterning_dynamic.png");
