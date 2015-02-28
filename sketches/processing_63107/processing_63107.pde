
size(500,500);

background(0, 84, 166);
stroke(255);
smooth();
noFill();




for ( int y=10; y <450; y+=10){
  for( int x=10; x<450; x+=10){
  rect( x, y, 50,50);
}
}

for ( int y=0; y <450; y+=40){
  for( int x=0; x<450; x+=40){
  rect( x, y, 500,500);
  stroke(0);
  strokeWeight(2);
}
}


for ( int y=80; y <100; y+=10){
  for( int x=80; x<100; x+=10){
  rect( x, y, 10,10);
  fill(255);
}
}






for ( int y=-100; y <200; y+=10){
  for( int x=-100; x<200; x+=10){
  rect( x, y, 10,10);
  fill(0, 174, 239);
}
}


for ( int y=100; y <200; y+=10){
  for( int x=100; x<200; x+=10){
  rect( x, y, 10,10);
  fill(255,120);
}
}



for ( int y=100; y <300; y+=10){
  for( int x=100; x<300; x+=10){
  rect( x, y, 10,10);
  fill(255,120);
}
}


for ( int y=250; y <400; y+=10){
  for( int x=250; x<400; x+=10){
  rect( x, y, 10,10);
  fill(0, 174, 239,200);
}
}



for ( int y=350; y <500; y+=10){
  for( int x=350; x<500; x+=10){
  rect( x, y, 10,10);
  fill(255,100);
}
}

