
size (500,500);
background(240);
 
 //linea
strokeWeight(1);
stroke(0,220,255);
for(int i= 10; i<500; i=i+10){
  for(int j= 10; j<500; j=j+10) {
    line(i,j,i,j+1);
  }
}

//esfera
 
strokeWeight(0.2);
stroke(0,0,200);
for ( int c = 20; c < 500; c = c + 20) {
  for(int d = 20; d < 500; d = d + 20) {
    ellipse(c, d, 20, 20);
  }
  
}
