
size(400,400);
background(255, 204, 0);
smooth();

noStroke();
fill(235);
for (int i=10 ; i<100; i+=20){
  rect(10+i,10+i,100+i,100+i);
}


stroke(235);
noFill();
for (int a=100; a>0 ;a-=10) {
   ellipse(250,50,a,a);

   
}

stroke(235);
noFill();
for (int a=300; a>0 ;a-=20) {
   ellipse(360,150,a,a);

   
}
noStroke();
fill(155);
for (int i=10 ; i<100; i+=20){
  rect(190+i,190+i,100+i,300);
}
stroke(180);
noFill();
for (int a=150; a>0 ;a-=10) {
   ellipse(200,200,a,a);
}




