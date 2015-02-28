


PImage img;
//boolean onetime = true;
int[][] imgPixels;
float sval = 1.0;
float nmx, nmy;
int res = 5;
PImage bg;
int a; 

void setup() 
{
  size(603, 397, P3D);
  frameRate(30);
  bg=loadImage("forget me nots.jpg");
  noFill();
  stroke(255);
  img = loadImage("forget me nots.jpg");
  imgPixels = new int[img.width][img.height];
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      imgPixels[j][i] = img.get(j, i);
      
    }
  }
}

void draw() 
{
  background(bg);

  nmx = nmx + (mouseX-nmx)/20; 
  nmy += (mouseY-nmy)/20; 

  if(mousePressed) { 
    sval += 0.005; 
  } 
  else {
    sval -= 0.01; 
  }

  sval = constrain(sval, 1.0, 2.5);

  translate(width/2 + nmx * sval-100, height/2 + nmy*sval - 200, -50);
  scale(sval);
  rotateZ(PI/9 - sval + 0);
  rotateX(PI/sval/8 - 0);
  rotateY(sval/8 - 0);

  translate(-width/2, -height/2, 0);

  for (int i = 0; i < img.height; i += res) {
    for (int j = 0; j < img.width; j += res) {
      float rr = red(imgPixels[j][i]); 
      float gg = green(imgPixels[j][i]);
      float bb = blue(imgPixels[j][i]);
      float tt = rr+gg+bb;
      stroke(rr, gg, gg);
      line(i, j, tt/10-20, i, j, tt/10 );
    }
  }
}

void keyPressed() {
  if(key == '1') {
    res = 1;
  } 
  else if (key == '2') {
    res = 2; 
  } 
  else if (key == '3') {
    res = 3;
  } 
  else if (key == '4') {
    res = 4;
  } 
  else if (key == '5') {
    res = 5;
  }
}







