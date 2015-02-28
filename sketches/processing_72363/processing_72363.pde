
PVector[] p = new PVector[3];
float shift = .5; //produces and image certain points of rotation
float fade = 0;
float fillCol = 0; //sets beginning for fading
float rot = 0;
float spin = 0;

void setup() {
  size(400, 400);
  background(0);
  smooth();
  fade = 255 / (width/2.0/shift); //sets shading
  spin = 270 / (width/2/shift); //total rotation
  p[0] = new PVector(-width/2, 0);
  p[1] = new PVector(width/3, height/3); // distorts the image's shape when rotated
  p[2] = new PVector(0, -height/2);
  noStroke();
  translate(width/4, height/2); //sets center
  triBlur();
}

void triBlur() {
  fill(fillCol);
  fillCol += fade;
 // rotate(spin); //consistent spacing
  rotate(rot+=radians(spin)); //stagers spin
  triangle(p[0].x += shift, p[0].y -= shift/3, // sets rotated image's shape
           p[1].x -= shift/2, p[1].y -= shift/3, 
           p[2].x, p[2].y += shift); //sets boundry and shape
  if (p[0].x < 0) {
    triBlur();
  }
}
