
int Length = 100;

float[] X = new float[Length];
float[] Y = new float[Length];
float[] SpX = new float[Length];
float[] SpY = new float[Length];

float[] SpRate = new float[Length];

float[] Color = new float[Length];

void setup(){
  size(700,700);
  colorMode(HSB,359,100,100);
  smooth();
  frameRate(30);

  for(int i=0; i<Length; i++){
    X[i] = random(width);
    Y[i] = random(height);
    SpX[i] = 0;
    SpY[i] = 0;
    SpRate[i] = random(0.0005, 0.001);
    Color[i] = random(359);
  }  
}

void draw(){
  background(300);

  for(int i=0; i<Length; i++){
    SpX[i] = (mouseX - X[i]) * SpRate[i];
    SpY[i] = (mouseY - Y[i]) * SpRate[i];

    X[i] += SpX[i];
    Y[i] += SpY[i];

    draweye(i);

  }
}

void draweye(int i){
  pushMatrix();

  translate(X[i], Y[i]);
  rotate(atan2(mouseY - Y[i], mouseX - X[i]));

  float congestion = dist(mouseX, mouseY, X[i], Y[i]);
  float dist_max = dist(0, 0, 200, 200);

  ellipseMode(CENTER);
  noStroke();
  fill(172,70,97);
  //fill(Color[i],70,97);
  ellipse(0, 0, 20, 20);
//  fill(359, 0, 99);
  fill(359, 110-congestion/dist_max*100, 99);
  ellipse(4, 0, 10,10) ;
  fill(0);
  ellipse(5, 0, 5,5) ;

  popMatrix();
}













