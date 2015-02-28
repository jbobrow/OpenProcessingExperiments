
size(500,500);
translate(250,250);
smooth();
noStroke();
background(255);
 float i;
for (i=0;i<200;i++){
  rotate(0.2);
 fill(random(95),random(449),random(425));
ellipse(0,i,20,20);
triangle(i,80,80,80,80,80);
}
