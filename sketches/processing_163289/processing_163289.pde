
int nom = 40;
float [] y = new float [nom];
float value =1.5;
int col = 0;

void setup() {
  size(600, 400);
  background(0);


  for (int i= 1; i < y.length; i++) {
    y[i] = random (200);
  }
}

void draw() {
  stroke(30);
  stroke(random(200), random(100), random(40));
  fill(col);



  for (int i = 0; i<y.length; i++) 
  {    
    ellipse((2*height/y.length) * i, y[i], 20, 15);
    y[i] = y[i]+5;
    if (y[i] > width) y[i]=0;
  }
}

void mouseClicked() {
  if (nom==4);
  value =25;
}


void mouseMoved() 
{
  loop();
  fill(25,255,90);
  col = col + 75;
  if (col <2) {
    col = 10;
  }

  if (mousePressed ==!true) {
    fill(0);
  } else {
    fill(155, 0, 40);
  }
}



