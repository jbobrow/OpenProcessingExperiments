

  size (500,500);
colorMode(HSB);
background(random(255),random(255),random(255));
noFill();
stroke(255,100);

float n = 0;
while(n < 50) {
  println(n);
  

  //subtracting the height of the circle makes an interesting shape
  

  ellipse(width/2,height/2, 100+n*2 ,100+2*n);
  n = n+2;
}


