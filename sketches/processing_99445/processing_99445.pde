
/**
 * Zoom. 
 * 
 * Move the cursor over the image to alter its position. Click and press
 * the mouse to zoom and set the density of the matrix by typing numbers 1-5.
 * This program displays a series of lines with their heights corresponding to 
 * a color value read from an image. 
 */

PImage img;
//boolean onetime = true;
int[][] imgPixels;
float sval = 2.0;
float nmx, nmy;
int res = 1;

void setup() 
{
  size(840, 860, P3D);
  noFill();
  stroke(0);
  img = loadImage("squat_silhoutte.jpg");
  imgPixels = new int[img.width][img.height];
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      imgPixels[j][i] = img.get(j, i);
    }
  }
}

void draw() 
{
  background(255);

  nmx = nmx + (mouseX-nmx)/2; 
  nmy += (mouseY-nmy)/2; 

  if(mousePressed) { 
    sval += 0.010; 
  } 
  else {
    sval -= 0.01; 
  }

  sval = constrain(sval, 1.0, 2.5);

  translate(width/2 + nmx * sval-100, height/2 + nmy*sval - 200, -50);
  scale(sval);
  rotateZ(PI/9 - sval + 0);
  rotateX(PI/sval/8 + 0);
  rotateY(sval/8 + 0);

  translate(-width/2, -height/2, 0);

  for (int i = 0; i < img.height; i += res) {
    for (int j = 0; j < img.width; j += res) {
      float rr = red(imgPixels[j][i]); 
      float gg = green(imgPixels[j][i]);
      float bb = blue(imgPixels[j][i]);
      float tt = rr+gg+bb;
      stroke(rr, gg, bb);
      line(i, j, tt/10-20, i, j, tt/10 );
    }
  }
}

void keyPressed() {
  if(key == '1') {
    res = 0;
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







