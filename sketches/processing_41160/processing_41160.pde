
///http://www.openprocessing.org/visuals/?visualID=33487
///http://www.tibilis.com/site/uploads/products/812debbaa5abde8ad3c3b29899f56e645b2c61c8.jpg

PImage img;
int numberofballs = 15;
float centerx[] = new float[numberofballs];
float centery[] = new float[numberofballs];
 
float speedx[] = new float [numberofballs];
float speedy[] = new float [numberofballs];
 
float r[] = new float [numberofballs];
float g[] = new float [numberofballs];
float b[] = new float [numberofballs];
 

void setup() {

  
  size(400, 400);
  for (int i = 0 ; i < numberofballs; i++) {
    speedx [i] = random (5);
    speedy [i] = (5);
     
    centerx[i] = random(30, 450);
    centery[i] = random(30, 450);
    
   r[i] = random(255);
   g[i] = random(255);
   b[i] = random(255);
  }

  img = loadImage("clown.jpg");  
  
}
 
 
void draw() {
  

  background(#ffffff);
  image (img, 55, 80);
 
  for (int i = 0 ; i < numberofballs; i++) {
   
    fill(r[i], g[i], b[i], 220);
     
    noStroke();
    smooth ();
     
    ellipse(centerx[i], centery[i], i+34, i+34);
     
 
    centerx[i] = centerx[i] + speedx[i];
    centery[i] = centery[i] + speedy[i];
   
 
  if (centerx[i] <= 25) {
    speedx[i] = speedx[i] * -1;
   r[i] = random(255);
   g[i] = random(255);
   b[i] = random(255);
  }
 
  if (centery[i] >= 475) {
    speedy[i] = speedy[i] * -1;
   r[i] = random(255);
   g[i] = random(255);
   b[i] = random(255);
  }
 
  if (centerx[i] >= 475) {
    speedx[i] = speedx[i] * -1;
   r[i] = random(255);
   g[i] = random(255);
   b[i] = random(255);
  }
 
  if (centery[i] <= 25) {
    speedy[i]  = speedy[i] * -1;
    r[i] = random(255);
   g[i] = random(255);
   b[i] = random(255);
  }
    
  }
   
}



