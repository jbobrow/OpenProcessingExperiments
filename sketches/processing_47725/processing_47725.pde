


void backDisplay() {
  noStroke();
  fill(0, 0, 0, 60);
  rect(xr+speed2*5, 100, xr+200, 250);
  fill(0, 0, 0, 170);
  rect(xr2+speed2*10, 250, xr2+200, 250);
  fill(0, 0, 0, 100);
  rect(xr3+speed2*20, 400, xr3+200, 250);
}

void backDisplay2() {
  fill(random(230), random(200), random(200), random(30));
  ellipse(random(1100), random(750), xr/15+speed, xr/15+speed);

  fill(random(220), random(200), random(200), random(50));
  ellipse(random(1100), random(750), xr/5+speed, xr/5+speed);
}

void backDisplay3() {
  noStroke();
  fill(0, 0, 0, 10);
  rect(0, speed2*(100-xr*2), width, 100);
  fill(0, 0, 0, 20);
  rect(0, speed2*(255-xr*2), width, 300);
  fill(0, 0, 0,40);
  rect(0, speed2*(555-xr*2), width, 550);  
  
}

void move() {
  xr = xr+speed2;
  xr2 = xr2+speed2;
  xr3 = xr3+speed2;
  if (xr>height) {
    xr=0;
    xr2=0;
    xr3=0;

    fill(0,0,0,random(150));
  }
  if (xr<0) {
    xr=height;
    xr2=height;
    xr3=height;
  }
  xr = xr+speed2*15;
  xr2 = xr2+speed2*20;
  xr3 = xr3+speed2*30;  

  
  speed=speed+t/2;
  speed2=speed2+t/2;

}


