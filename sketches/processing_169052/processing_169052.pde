
size(400, 400);
colorMode(HSB, 100,60,100);
noStroke();

for (int i = 0; i < width; i++) {
  if (i%3 ==0) stroke(50); 
  else stroke(255); 
  line(i, 0, i, height);
}

for(int y = 0; y < 10; y++){
  for(int x = 0; x < 10 ; x++){
    fill(10*x, 5+y*5, 99);
    ellipse(x*50, y*50, 50, 50);
  }
}

 
stroke(#339933);
noFill();
 
int drawPointX = 0;
 
while( drawPointX <= 400 ) {
  ellipse( drawPointX, 0, 40, 40 );
  ellipse( drawPointX, 50, 40, 40 );
  ellipse( drawPointX, 100, 40, 40 );
  ellipse( drawPointX, 150, 40, 40 );
  ellipse( drawPointX, 200, 40, 40 );
  ellipse( drawPointX, 250, 40, 40 );
  ellipse( drawPointX, 300, 40, 40 );
  ellipse( drawPointX, 350, 40, 40 );
  ellipse( drawPointX, 400, 40, 40 );
  drawPointX = drawPointX + 20; 
}


