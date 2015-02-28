
//"Dust Fireworks"
//Valerie Nelkin
//Senior Honors Project 2010

particle[] Z = new particle[8000];
float colour = random(1);
int depth;
float circles = random(100);

void setup() {
  
  smooth();
  size(600,600,P2D);  
  depth = width;
  //background(150,150,255);
  frameRate(25);
  
  float n = 100;
  float px, py, pz;
  float m, v, theta, phi;
  
  for(int k = 0; k < n; k++) {
    px = random(width);
    py = random(height);
    pz = random(depth);
    m = random(50);
    for(int i = int((Z.length-1000)*k/n); i < int((Z.length-1000)*(k+1)/n); i++) {
      v = sq(random(sqrt(m)));
      theta = random(TWO_PI);
      phi = random(TWO_PI);
      Z[i] = new particle( px+v*cos(phi)*cos(theta), py+v*cos(phi)*sin(theta), pz+v*sin(phi), 0, 0, 0, 1 );
    }
  }
  px = width/2;
  py = height/2;
  for(int i = Z.length-1000; i < Z.length; i++) {
    pz = random(depth);
    v = sq(random(sqrt(width/4)));
    theta = random(TWO_PI);
    Z[i] = new particle( px+v*cos(theta), py+v*sin(theta), pz, 0, 0, 0, 1 );
  }

  /*
  for(int i = 0; i < Z.length; i++) {
    r = i/float(Z.length);
    Z[i] = new particle( random(width), r*height, depth/2, 0, 0, 0, 1 );
  }
  */
  
  frameRate(60);
  
}

void draw() {
 
  colorMode(RGB,255);
  background(25,25,75);
  float r;
  
  filter(INVERT);
  fill(200,255,255,175);
  ellipse(mouseX,mouseY, 100,100);
  
  for(int i = 0; i < Z.length; i++) {
    int zx = Z[i].getX();
    int zy = Z[i].getY();
    if (mouseX < width/2 && mouseY < height/2) {
      if (zx < width/2 && zy < height/2) {
    if( mousePressed && mouseButton == LEFT ) {
      Z[i].gravitate( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 0.75 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Z[i].repel( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 1 ) );
    }
    else {
      Z[i].deteriorate();
    }
    }
    }
     if (mouseX < width/2 && mouseY > height/2) {
      if (zx < width/2 && zy > height/2) {
    if( mousePressed && mouseButton == LEFT ) {
      Z[i].gravitate( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 0.75 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Z[i].repel( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 1 ) );
    }
    else {
      Z[i].deteriorate();
    }
    }
    }
     if (mouseX > width/2 && mouseY < height/2) {
      if (zx > width/2 && zy < height/2) {
    if( mousePressed && mouseButton == LEFT ) {
      Z[i].gravitate( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 0.75 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Z[i].repel( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 1 ) );
    }
    else {
      Z[i].deteriorate();
    }
    }
    }
    if (mouseX > width/2 && mouseY > height/2) {
      if (zx > width/2 && zy > height/2) {
    if( mousePressed && mouseButton == LEFT ) {
      Z[i].gravitate( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 0.75 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Z[i].repel( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 1 ) );
    }
    else {
      Z[i].deteriorate();
    }
      }
    }

    Z[i].update();
    r = float(i)/Z.length;
    colorMode(HSB,1);
    if( Z[i].magnitude/100 < 0.1 ) {
      stroke( colour, pow(r,0.1), 0.9*sqrt(1-r), Z[i].magnitude/100+abs(Z[i].z/depth)*0.05 );
    }
    else {
      stroke( colour, pow(r,0.1), 0.9*sqrt(1-r), 0.1+abs(Z[i].z/depth)*0.05 );
    }
    Z[i].display();
  }

  colour+=random(0.01);
  colour = colour%1;

  filter(INVERT);
  
}

void keyPressed() {
  for(int i = 0; i < Z.length; i++) {
    if (key== ' ') {
      Z[i].reset(random(width),random(height), depth/2, 0, 0, 0, 0.75 );
          }
  }
  //if (key == 's') {
    //saveFrame("stardust-##.tif");
  //}
}
 
    



