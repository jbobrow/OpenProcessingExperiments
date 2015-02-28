
int elements = 1000;
float x[] = new float[elements];
float y[] = new float[elements];

int numpoints = 0;
int frame = 0;
int opacity = 200;

void setup(){
  size(400,400);
  
}

void mouseDragged(){
  x[numpoints] = mouseX;
  y[numpoints] = mouseY;
  
  numpoints += 1;
}


void draw(){
  background(2,66,71);
  
  for(int i = 0; i<numpoints; i++){
    int size = (frame + i) % 30;
    fill(234,opacity);
    ellipse(x[i], y[i], size, size);
    ellipse(x[i]-1,y[i]-2,size-6,size-4);
    x[i] += random(-1,1);
    y[i] -= random(-1.1);
  }
  
  opacity -=1; 

  fill(61,44,34);
  noStroke();
  rect(0,0,30,400);
  rect(0,0,400,30);
  snow();
  fill(61,44,34);
  rect(370,0,30,400);
  rect(0,370,400,30);
  rect(185,0,30,400);
  rect(0,185,400,30);
  
}

void mousePressed() {
    numpoints = 0;
    opacity = 200;
}

void snow(){
  fill(234);
  noStroke();
  
  ellipse(70,400,100,80);
  ellipse(120,400,90,75);
  ellipse(160,400,90,90);
  ellipse(240,400,100,90);
  ellipse(285,400,100,85);
  ellipse(330,400,90,90);
}
