
size(500,500);


smooth();
noStroke();

for ( int y= 0; y<500; y +=20){
  for(int x=0; x<500; x +=20){
    fill( (x+y) * 0.2 );
    rect(x, y, 20, 20);
  }
}

int x= 0;
for (int i= 10; i<= 255; i +=10){
  fill(116, 193, 206, i);
  rect(x, 0 , 20, 500);
  x+=20;
}



