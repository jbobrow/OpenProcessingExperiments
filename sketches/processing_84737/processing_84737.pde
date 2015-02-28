
size(500, 500);
background(#678381,200);
noStroke();
 smooth();
translate(width/2, height/2);
for (int i=0;i<=360;i+=1){
  rotate(radians(6));
fill(#87C1AC,100);
arc(35,35, 400, 10, 0, PI/4);
fill(#B5F2DC,180);
arc(35,35, 200, 10, 0, PI/7);
fill(255,200);
arc(35,35, 100, 10, 0, PI/7);

 
}



