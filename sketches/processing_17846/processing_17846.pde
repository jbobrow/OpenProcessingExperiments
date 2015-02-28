
float nxScale;
float nyScale;
float n=0;
float t;
int w = 800;
int h = 300;

void setup(){
  size(800, 300);
  smooth();
}

void draw(){
  background(25);
  noFill();
  for(float j=0; j<h; j+=4){
    beginShape(POLYGON);
    for(float i=0; i<w; i+=4){
      nxScale = w/2;
      nyScale = h/2;
      n = noise(i/nxScale, j/nyScale, t/nxScale)*255;
      stroke(n, 200);      
      curveVertex(i, j+n);
    }
    endShape();
  }
  float mx = map(mouseX, 0, w, 0.5, 4);

  t+=mx;

  stroke(30, 155, 200);
  rectMode(CENTER);
  rect(mouseX, 5, 5, 5);
}




