
size(500, 500);
background(0,200);
noStroke();
 smooth();
translate(width/2, height/2);
for (int i=0;i<=360;i+=5){
  rotate(radians(15));
fill(255,20);
bezier(0,0, 20, 190, 30, 70, 290, 190);



 
}



