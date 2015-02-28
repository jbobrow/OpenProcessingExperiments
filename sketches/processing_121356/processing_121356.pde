
int Length = 20;

float[] X = new float[Length];
float[] Y = new float[Length];
float[] Ang = new float[Length];
float[] Rot = new float[Length];
float[] C  = new float[Length];
float[] Radius = new float[Length];

float Cx, Cy;
float Power = 0;
float MaxPower = 200;

void setup() {
  size(400,400);
  colorMode(HSB, 100);
  frameRate(30);
}

void draw() {
  fadeToWhite();
  
  if(Power > 0) {
    for(int i = 0; i < Length; i++) {
      Ang[i] += Rot[i] * (Power / 10);
      X[i] = Cx + ( Power * sin(radians(Ang[i])) );
      Y[i] = Cy + ( Power * cos(radians(Ang[i])) );
      
      noStroke();
      fill(C[i], 80, 100, min(Power, 80));
      ellipse(X[i], Y[i], Radius[i], Radius[i]);
      fill(C[i], 40, 100, min(Power, 80));
      rect(X[i] + random(-50,50), Y[i]+random(-50,50),
      random(15), random(15));
      triangle(X[i] + random(-300,300), X[i] + random(-300,300),
      X[i]+1, Y[i]-1, X[i]+1, Y[i]+1);
    }
  }
  
  if(mousePressed) {
    Cx = mouseX;
    Cy = mouseY;
    if(Power < MaxPower) Power += 1;
    
  }else{
    if(Power > 1) Power = Power * 0.98;
    else Power = 0;
  }
}


void fadeToWhite() {
  noStroke();
  fill(99, 30);
  rectMode(CENTER);
  rect(0, 0, 800, 800);
}

void mousePressed() {
  Power = 0;
  for(int i = 0; i < Length; i++) {
    Radius[i] = random(10, 30);
    C[i] = random(100);
    Rot[i] = random(-5, 5);
  }
}


