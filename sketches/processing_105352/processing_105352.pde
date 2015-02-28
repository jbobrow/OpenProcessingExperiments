
float y = 100;
float times = 1 ;

void setup() {
  size(200, 200);
}

void draw() {

  background(255);
  fill(255, 0, 0.30);
  ellipse(width/2, y, 50, 50);
  
  if (times/2 != int(times/2)) {
    y=y+1;
  }
    else {y=y-1;
}
  if(y == 175 || y == 25){
   times=times+1 ;
  }
}
