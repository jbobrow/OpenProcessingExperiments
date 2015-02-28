
//Brennda
    //Fundo
size(200, 200);
background(#B97DC1);
noStroke ();
for ( int b=255; b>0; b=b-1) {
  fill(15,140,b); 
  rect(0, 255-b, 200, 1);
}
stroke(0);
     //Quadrados
noStroke();
for(int i=1; i<200; i=i+2){
fill(i*i, 0, i*20);
rect(i*10, 80, 10, 10);
rect(i*10, 120, 10, 10);
rect(80, i*10, 10, 10);
rect(120, i*10, 10, 10);
}
