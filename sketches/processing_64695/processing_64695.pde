

  size (500,500);

background(0);
noFill();
stroke(255);

float n = 0;
while(n < 100) {


  ellipse(width/2,height/2, 100*n ,100+n);
  n = n+2;
}


