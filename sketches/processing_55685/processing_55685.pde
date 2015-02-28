



size(450,450);
translate(250,250);

for (float i=0;i<200;i++){
rotate(0.2);
smooth();

line(i,0,10,40);
  noFill();
  stroke(random(25),random(345),random(405));
  strokeWeight(1);
  bezier(50, 75, 25, 25, 125, 25, 100, 75);
    bezier(75, 50, 25, 25, 25, 125, 75,100);
     strokeWeight(4);
bezier(475, 350, 125, 125, 125, 325, 275,400);
bezier(i, 350, 125, 125, i, 325,i,400);
 strokeWeight(2);
bezier(i, 50, 25, 25, i, 25,i,100);
 strokeWeight(1);
bezier(i, 150, 125, 125, i, 125,i,200);
}
