
// 
// WARNING: BRIGHT FLASHING COLORS
//


int particleCount = 50;

// particle
float[] px = new float[particleCount];
float[] py = new float[particleCount];
float[] pw = new float[particleCount];
float[] ph = new float[particleCount];
float[] rad = new float[particleCount];
float[] spdX = new float[particleCount];
float[] spdY = new float[particleCount];
float[] gravity = new float[particleCount];
float[] damping = new float[particleCount];

// circles

float fy;
float fx;
float fw;
float fh;
float frad;
float spdfX;
float spdfY;
int counter;

   
void setup() {
  size(600, 600);
  smooth();
  
for (int i=0; i<particleCount; i+=1){
  px[i] = random(width);
  py[i] = random(height);
  
  pw[i] = 250;
  ph[i] = pw[i];
  rad[i] = pw[i]/2;
  
  spdX[i] = random(-5, 5);
  spdY[i] = random(-3, 3);
  gravity[i] = random(-.3, .3);
  damping[i] = .05;
  
}

}

void draw() {
  background(0);
  noStroke();
  fill(255,10);
  

for (int i=0; i<particleCount; i+=1){
  fill(random(255),random(255),random(255), 20);
  ellipse(px[i], py[i], pw[i], ph[i]);
  
  px[i] += spdX[i];
  spdY[i] += gravity[i] + damping[i];
  py[i] += spdY[i];
  
  
  if (px[i] > width){
    px[i] = width;
  spdX[i] *= -1;
  }
  
    if (px[i] < 0){
  px[i] = 0;
      spdX[i] *= -1;
  }
  
    if (py[i] > height){
py[i] = height;
  spdY[i] *= -1;
  }
  
  if (py[i] < 0){
    py[i] = 0;
  spdY[i] *= -1;
  }
}


createSpinners();
}

