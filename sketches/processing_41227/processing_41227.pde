
size(800,800);
smooth();
background(0);


for( int y=100; y<=height+100; y+=10){
  for (int x=0; x<=width; x+=30){
    rect (x, y,  x/10.0, 16- y/10.0);
  }
}

for( int y=20; y<=height+100; y+=10){
  for (int x=300; x<=width; x+=30){
    if( (x%30) ==0){
      fill(0,255,0,160);
      rect(x, y, x/30.0, 50-y/10);
    }
  }
}

for( int y=0; y<=height+100; y+=10){
  for (int x=300; x<=width; x+=30){
    if( (x%10) ==0){
      fill(255, 0, 0,160);
      rect(x, y, x/50.0, 10-y/20);
    }
  }
}




