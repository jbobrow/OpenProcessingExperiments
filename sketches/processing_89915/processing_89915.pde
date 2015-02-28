
public static final int dim = 450;
public static final int area = 100;
public static final int safety = 30;

void setup() {
  //variable size in some Ps flavors is forbidden
  //size(dim + area,dim);
  size(550, 450);
  frameRate(30);
  background(0);
}

int xAnt, yAnt, zAnt;

void draw() {
  int x = xAnt;
  int y = yAnt;
  int z = zAnt;
  if (mouseX < dim) {
    x = mouseX;
    y = dim - mouseY;
    
    xAnt = x;
    yAnt = y;
  }
  else if (mouseX > (dim + safety)) {
    z = mouseY;
    zAnt = z;
  }
    
  noStroke();
  colorMode(HSB, dim);
  stroke(z, x, y);
  fill(z, x, y);
  rect(0,0,dim,dim);
}


