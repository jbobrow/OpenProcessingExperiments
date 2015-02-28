
//setting up the cordinate ball

int numberofballs = 30;
float centerx[] = new float[numberofballs];
float centery[] = new float[numberofballs];

float speedx[] = new float [numberofballs];
float speedy[] = new float [numberofballs];

float r[] = new float [numberofballs];
float g[] = new float [numberofballs];
float b[] = new float [numberofballs];


void setup() {
  size(500, 500); 
  for (int i = 0 ; i < numberofballs; i++) {
    speedx [i] = random(3);
    speedy [i] = random(2);
    
    centerx[i] = random(50, 450);
    centery[i] = random(50,450);
   
   r[i] = random(255);
   g[i] = random(255);
   b[i] = random(255);
  }
}


void draw() {

  background(33, 255, 104);

  for (int i = 0 ; i < numberofballs; i++) {
  
    fill(r[i], g[i], b[i], 220);
    
    noStroke();
    
    ellipse(centerx[i], centery[i], 20, 20);
    

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


