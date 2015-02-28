
size (400,400);
background(0);



strokeWeight(2);
stroke(255,0,150);
for(int i= 20; i<400; i=i+20){
  for(int j= 20; j<400; j=j+20) {
    line(i,j,i,j+5);
  }
}

stroke(255,0,0);

strokeWeight(2);
stroke(0,255,0);
for(int i= 18; i<400; i=i+20){
  for(int j= 22; j<400; j=j+20) {
    line(i,j,i+5,j);
  }
}

strokeWeight(2);
stroke(0,0,255);
for(int i= 10; i<400; i=i+20){
  for(int j= 10; j<400; j=j+20) {
    line(i,j,i,j+5);
  }
}
