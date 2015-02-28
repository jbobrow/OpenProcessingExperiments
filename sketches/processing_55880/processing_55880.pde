
float vy, vx, x, y, frictionY, frictionX, gravity, ellipseX, ellipseY, x2, y2, vx2, vy2, angle, t;

void setup() {
  size(800, 600);
   background(150, 125, 100);
   t=200;
  vy = 0;
  vx = 2;
  vx2 = 2;
  vy2 = 0;
  x = 5;
  y = 20;
  frictionY = -.6;
  frictionX = .998;
  gravity = .1;
  x2 = 0;
  y2 = 0;
  angle =0;
  smooth();
}


void draw() {
  
 
  vy += gravity;
  vx *= frictionX;
  x += vx;
  y += vy;
  x2 += vx2;
  y2 += vy2;
  if (y > height) {
    y = height-20;
    vy *= frictionY;
  }

  fill(255);
  noStroke();
  x = cos(radians(angle)) * 20 +width/2;
  y = sin(radians(angle)) * 200 +height/2;
  ellipse(angle, y, 5, 5);
  angle ++;
  
  if (angle > width) {
   ellipse(x, angle, 5, 5);
  // angle -=30; 
   stroke(0);
   fill(140, 68, 230);
  }

  fill(230, 120, 100, 50);
  stroke(77, 36, 11);
  ellipse (ellipseX-20, ellipseY-20, 30, 30);
  ellipseX = cos(radians(x2)) * 200 + width/2;
  ellipseY = sin(radians(y2)) * 200 + height/2;


  if (dist(angle, y, ellipseX, ellipseY) < 10) {
    fill(255);
    textSize(20);
    text("Won! You are good!", 10, 20);
  }

  println(int(millis()/1000));

  if (int(millis()/1000) > 13) {  //turns black in 50 sec
    background(0, 0, 0);
    fill(255);
     textSize(30);
    text("the end", 300, 200);
  }
}
void mouseReleased () {
  vy2 -= 2;
  vx2 -= .05;
}




