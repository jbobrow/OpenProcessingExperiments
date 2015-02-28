
int balls = 5;
int maxSpeed = 10;
int sizeX = 1000;
int sizeY = 1000;
int ballSize = 25;

int alphaBg = 0;
int alphaBall = 55;

float[] runx = new float[balls];
float[] runy = new float[balls];
int[] posx = new int[balls];
int[] posy = new int[balls];

float[] reds = new float[balls];
float[] greens = new float[balls];
float[] blues = new float[balls];

void setup() {
 size(sizeX, sizeY); 
 background(0);
 
 for (int i = 0; i < balls; i++) {
  reds[i] = random(0, 255);
  greens[i] = random(0, 255);
  blues[i] = random(0, 255);
  
  posx[i] = sizeX / 2;
  posy[i] = sizeY / 2;
 }
}

void draw() {
  noStroke();
  fill(0,0,0,alphaBg);
  rect(0,0,sizeX,sizeY);
  
  for (int i = 0; i < balls; i++) {
    runx[i] = runx[i] + random(-1*maxSpeed/10, maxSpeed/10);
    runy[i] = runy[i] + random(-1*maxSpeed/10, maxSpeed/10);
    if (runx[i] > maxSpeed) {
      runx[i] = maxSpeed;
    }
    if (runy[i] > maxSpeed) {
      runy[i] = maxSpeed;
    }
    
    reds[i] = reds[i] >= 250 ? 247 : reds[i] <= 10 ? 12 : reds[i] + random(-10, 10);
    greens[i] = greens[i] >= 250 ? 247 : greens[i] <= 10 ? 12 : greens[i] + random(-10, 10);
    blues[i] = blues[i] >= 250 ? 247 : blues[i] <= 10 ? 12 : blues[i] + random(-10, 10);
    
    fill(color(reds[i], greens[i], blues[i], alphaBall));
    ellipse(posx[i],posy[i],ballSize,ballSize);
    
    posx[i] += runx[i];
    posy[i] += runy[i];
   
   if (posy[i] >= sizeY || posy[i] <= 0) {
     runy[i] = runy[i] * -1;
   }
   if (posx[i] >= sizeX || posx[i] <= 0) {
     runx[i] = runx[i] * -1;
   }
   /* not working :( 
   for (int j = 0; j < balls; j++) {
     if ((posy[i] >= posy[j] || posy[i] <= posy[j]+ballSize) ||
         (posy[i]+ballSize >= posy[j] || posy[i]+ballSize <= posy[j]+ballSize) ||
         (posx[i] >= posx[j] || posx[i] <= posx[j]+ballSize) ||
         (posx[i]+ballSize >= posx[j] || posx[i]+ballSize <= posx[j]+ballSize)) {
       runx[i] = runx[i] * -1;
       runx[j] = runx[j] * -1;
       runy[i] = runy[i] * -1;
       runy[j] = runy[j] * -1;
     }
     
     if (j+1 == i) {
       j++;
     }
   } */
  }
}
