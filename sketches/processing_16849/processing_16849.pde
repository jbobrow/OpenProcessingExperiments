
//
//
//
//
//1
void whale(int whaleX, int whaleY, int whaleSize, int eyeSize, int distance ) {
  noStroke();
  smooth();
  //mom
  fill(255,230,230);
  arc(whaleX,whaleY,whaleSize, whaleSize, PI, TWO_PI-PI/2);
  arc(whaleX,whaleY, whaleSize, whaleSize, TWO_PI-PI/2, TWO_PI);
  //ggori
  arc(distance, whaleY, whaleSize/2, whaleSize/3, PI, TWO_PI-PI/2);

  //eye1
  fill(100,100,100);
  ellipse (whaleX-30,whaleY-7,eyeSize,eyeSize);
  //eye2 
  fill(100,100,100);
  ellipse (whaleX-5,whaleY-7,eyeSize,eyeSize);
}


