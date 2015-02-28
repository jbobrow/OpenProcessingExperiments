
size(400,400);
background(0); 

stroke(0,205,205);
for(int i=5; i<=400; i+=10){
  for(int j=15; j<=400; j+=30){
    line(i,j,j,i);
  }
}

noStroke();
fill(84,139,84,150); 
for(int k=25; k<=375; k+=20){
  for(int l=40; l<=360; l+=50){
    ellipse(k,l,30,30);
  }
}

