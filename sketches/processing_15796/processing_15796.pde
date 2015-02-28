
/* explosion - Kenny Li

1) There are 3 shapes ; line, squares, ellipse. There are 25 each. 
It was due to the draw function. its shows 25 in the 2nd number.
2)I don't know how many object there is if I just look at it but I
can see that the squares and the ellipses should be somewhere around
the same.
3)No lag



*/




int circlesize;


void setup() {
  size(500,500);
  noStroke();
  smooth ();
  frameRate(25);

  circlesize = 30;
}

void draw() {
  background (0);

  {
    for(int y=0; y<25; y++) {  
      fill(255,50);
      rect(random(0,width),random (0,height),circlesize,circlesize);
      fill(0,255,255,50);
      ellipse (random(0,width),random (0,height),circlesize,circlesize);
      fill(255);
      stroke (255);
      line(random(0,width),random (0,height),circlesize,circlesize);

    }
  }
}


