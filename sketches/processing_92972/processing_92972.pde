
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;
float i = 0;
float j = 0;
float speedsq = 5;
float state = 0;
float v = 255;

void setup() {
  size(255,255);
  textAlign(CENTER, CENTER);
  smooth();
}

void draw() {
background(0);
fill(v);
text("motion | vayo", width/2,height/2);
for(int a=0;a<255;a=a+20){
  for(int b=0; b<255;b=b+20){
    stroke(0,255,255);
    point(a,b);
  }
}
  
  // Add the current speed to the location.
  x = x + xspeed;
  y = y + yspeed;

  // Check for bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  // Display at x,y location
  noStroke();
  fill(255,0,0);
  ellipse(x,y,10,10);
  
 noStroke();
fill(150,0,255);
rect(i,j,10,10);
if (state == 0) {
i = i + speedsq;
if (i > width-10) {
i = width-10;
state = 1;
}
} else if (state == 1) {
j = j + speedsq;
if (j > height-10) {
j = height-10;
state = 2;
}
} else if (state == 2) {
i = i - speedsq;
if (i < 0) {
i = 0;
state = 3;
}
} else if (state == 3) {
j = j - speedsq;
if (j < 0) {
j = 0;
state = 0;
}
}

if(mousePressed){
  v=0;
  strokeWeight(1);
  stroke(255);
  noFill();
  rectMode(CENTER);
  rect(x,y,11,11);
  rect(i,j,11,11);
  for(int m=10;m<255;m=m+20){
    
      stroke(255);
      line(m,0,m,255);
    }
    for(int n=10;n<255;n=n+20){
      line(0,n,255,n);
  }
  rectMode(CENTER);
    noStroke();
  fill(0);
  rect(width/2+2,height/2-7,120,20);
  fill(255);
text("pathavi | substratum", width/2+1,height/2-8);

} else {
  v=255;
}
  
}



