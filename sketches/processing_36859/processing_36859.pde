
void setup () {
  size (480, 300);
}

float boobSize;
float nippleSize;


void draw () {
  smooth ();
  background (0);
  //drawboob (100, 100, 40, 10, 0);
  //drawboob (200, 100, 40, 10, 1);
  
  
  for (int i=1; i<5; i++) {
    boobSize = random(25,60);
    nippleSize = random(5,15);
    
    drawboobpair (50, i*height/4 -40, boobSize, nippleSize);}
    
    for (int i=1; i<5; i++) {
      boobSize = random(25,60);
    nippleSize = random(5,15);
    drawboobpair (180, i*height/4-40, boobSize, nippleSize);}
    
    for (int i=1; i<5; i++) {
      boobSize = random(25,60);
    nippleSize = random(5,15);
    drawboobpair (420, i*height/4-40, boobSize, nippleSize);}
}

void drawboob(
float x, 
float y, 
float boobSize, 
float nippleSize, 
int nipplePlace) {
  fill (239, 208, 207);
  stroke (0);
  strokeWeight (3);
  ellipse (x, y, boobSize, boobSize);

  fill (240, 128, 126);
  stroke (245, 36, 32);
  strokeWeight (1.5);
  if (nipplePlace == 0) {
    // The nipple will be on the left side
    ellipse (x-nippleSize/3, y+nippleSize/2, nippleSize, nippleSize);
  }
  else {
    ellipse (x+nippleSize/3, y+nippleSize/2, nippleSize, nippleSize); 
    // The nipple will be on the right side
  }
}

void drawboobpair(
float x, 
float y, 
float boobSize, 
float nippleSize)

{
  drawboob (x-boobSize/2, y, boobSize, nippleSize, 0);
  drawboob (x+boobSize/2, y, boobSize, nippleSize, 1);
}



