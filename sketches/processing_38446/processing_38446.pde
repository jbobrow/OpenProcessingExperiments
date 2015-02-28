
size(500,100);
for(int i=0; i<500; i++){
  int x = i;
  int y = int(50. * sin(PI/180.* i) );
  point(x, y+50);
  println("x = " + x + " y = " + y);
}

