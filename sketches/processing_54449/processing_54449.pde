
size(500,500);
translate(250,250);
smooth();
strokeWeight(5);
stroke(2);
background(0);
 float i;
for (i=0;i<200;i++){
  rotate(0.2);
  stroke(255);
  line(i,0,100,400);
  fill(255,0,0);
  ellipse(i,0,50,80);
}

