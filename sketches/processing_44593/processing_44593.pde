
float circulo = (50);
int X, Y;
int nx, ny;
int contador;

int delay = 20;
float r = random(255);
float q = random(400);


void setup() {
  size(400, 400);
  strokeWeight(3);
  smooth();
  frameRate(50);
  X = width/2;
  Y = width/2;
  nx = X;
  ny = Y;
  contador =0;
}

void draw() {
noCursor();
  contador++;
  background(255);
  stroke(0,150,200);
  noFill ();
  ellipse(X+8, Y+8, nx*2, nx*2);
  ellipse(X, Y, nx*2, nx*2);
  fill (r);
  ellipse(X, Y, circulo, circulo);
  ellipse(X+50, Y+50, circulo, circulo);
  ellipse(X-50, Y-50, circulo, circulo);
  noFill();
  ellipse(X+80, Y+80, nx, nx);
  noFill();
  ellipse(X-80, Y-80, nx, nx);

  circulo = circulo + sin( frameCount/8);
  X+=(nx-X)/delay;
  Y+=(ny-Y)/delay;
  line(X+100, Y+100, pmouseX, pmouseY);
  line(X-100, Y-100, pmouseX, pmouseY);
  line(X-50, Y-50, pmouseX, pmouseY);
  line(X+8, Y, pmouseX, pmouseY);
  line(X+50, Y+50, pmouseX, pmouseY);


  if(mousePressed == true) {
    ellipse(mouseX, mouseY, nx, nx);
  }
 
  else {
        beginShape(LINES);
    vertex(400*sin(contador), 300*cos(contador));
    vertex(200*sin(contador), 400*cos(contador));
    vertex(200*sin(contador), 480*cos(contador));
    vertex(500*sin(contador), 400*sin(contador));
    endShape();
  }
}


void mouseMoved() {
  nx = mouseX;
  ny = mouseY;
}


                                
