
int particleCount = 100;
int tumbleCount = 50;

float[] x = new float[particleCount];
float[] y= new float[particleCount];
//float radius
float[] spdX = new float[particleCount];
float[] spdY = new float[particleCount];
float[] w = new float[particleCount];
float []h = new float[particleCount];
float[] gravity = new float[particleCount];
float[] damping = new float[particleCount];
float[] wind = new float[particleCount];
float[] friction = new float[particleCount];
float[][] line1 = new float[particleCount][tumbleCount];
float [][] line2 = new float[particleCount] [tumbleCount];
float [] []line3= new float[particleCount][tumbleCount];
float [] []line4= new float[particleCount][tumbleCount];



void setup() {
  for (int i=0; i<particleCount; i+=1) {
    size (600, 600);
    smooth ();
    x[i] = random (0, 5);
    y[i] = 600-w[i];
    w [i]= 50;  
    h[i] = 50;
    //radius = 50;
    spdX[i] =random(3.0, 20.0);
    gravity[i] = random (.01, .5);
    damping[i] = .099;
    wind [i] = random (.0000001, .08);
    friction[i] = random(.8,.99);
    spdY [i]= random (0.0055,.99);

    for (int k = 0; k < tumbleCount; k++) {
      line1[i][k] = random(-30, 30);
      line2[i][k] = random(-30, 30);
      line3[i][k]= random(-30, 30);
      line4[i][k] = random(-30, 30);
    }
  }
}

void draw () {

  background (120, 170, 247);

  //clouds 
  noStroke();
  fill (255);
  ellipse (70, 70, 120, 100);
  ellipse (120, 120, 100, 100);
  ellipse (140, 70, 100, 100);

  ellipse (200, 200, 110, 100);
  ellipse (230, 240, 120, 105);
  ellipse (250, 190, 120, 100);

  ellipse (350, 100, 100, 100);
  ellipse (380, 140, 120, 100);
  ellipse (410, 80, 105, 105);

  ellipse (500, 200, 100, 100);
  ellipse (540, 260, 150, 100);
  ellipse (580, 205, 100, 100);

  ellipse (580, 55, 160, 100);

  ellipse (50, 305, 200, 70);
  ellipse (10, 275, 100, 100);

  ellipse (370, 305, 200, 70);
  ellipse (400, 275, 100, 100);


  fill (255, 250, 205);
  rect (0, 400, 600, 600);

  //saloon
  stroke(206, 96, 31);
  fill (152, 84, 20);
  rect (40, 310, 250, 150);
  fill (206, 96, 31);
  rect (95, 310, 1, 150);
  rect (230, 310, 1, 150);
  rect (85, 310, 1, 150);
  rect (240, 310, 1, 150);
  noFill();
  rect (130, 450, 70, 10);
  rect (140, 440, 50, 10);
  rect (150, 430, 30, 10);
  rect (150, 400, 30, 40);

  stroke (255);
  rect (110, 330, 110, 50);
  fill(255);
  PFont font;
  font = createFont("Mesquite Std", 55); 
  textFont(font); 
  text("Saloon", 122, 335, 125, 70);


  //cacti 
  fill (44, 227, 66);
  noStroke();
  ellipse (500, 460, 50, 100);
  ellipse (500, 450, 100, 20);
  ellipse (420, 430, 50, 100);
  ellipse (420, 420, 100, 20);
  ellipse (560, 400, 50, 100);
  ellipse (560, 390, 100, 20);

for (int i = 0; i < particleCount && frameCount/60 > i; i++){ 
  //tumbleweed
  fill (139, 119, 101);
  pushMatrix();
  translate(x [i], y [i]);
  rotate(radians(x[i]));
  // ellipse(0, 0, w, h);

  stroke(185,  180, 85);

  for (int k = 0; k < tumbleCount; k++) {
    line (line1[i][k], line2[i][k], line3[i][k], line4[i][k]);
  }

  popMatrix();
  x [i] += spdX[i];
  spdX[i] += wind[i];
  spdY[i] += gravity[i];
  y[i] += spdY[i];

  if (x[i] > width-w[i]) {
    spdX[i] *= -1;
    spdY[i] *= damping [i];
  }

  if (x[i] < 0) {
    spdX[i] *= -1;
  }

  if (y[i] > height-h[i]) {
    y [i]= height - h[i];
    spdY[i] *= -1;
    spdY[i] *= damping[i];
    spdX[i] *= friction[i];
  }


  if (y[i] < 0) {
    spdY[i] *= -1;
  }
}
} 


