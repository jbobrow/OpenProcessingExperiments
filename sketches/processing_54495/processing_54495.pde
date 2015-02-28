
size(500,500);
background (250,250,250,100);
translate(250,250);
smooth();
stroke(250);
fill (random (250),random(100),random(60),random(25));
for (float i=0;i<200;i++){
  rotate (0.2);
  triangle (i+500,0,10,40,i+500,10);
  rect(i+50,60,200,200);
}


