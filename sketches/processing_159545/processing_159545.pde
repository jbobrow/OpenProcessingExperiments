
int BALL_MAX = 40;

float[] x = new float[BALL_MAX];
float[] y = new float[BALL_MAX];
float[] xSpeed = new float[BALL_MAX];
float[] ySpeed = new float[BALL_MAX];
float[] bSize = new float[BALL_MAX];
color[] bColor = new color[BALL_MAX];

void setup(){
  size(480,480);
  smooth();
  frameRate(30);
  colorMode(HSB,360,100,100);
  noStroke();
  textSize(50);
  textAlign(CENTER);
  
  for(int i=0; i<BALL_MAX; i++){
    x[i]= random(width);
    y[i]= random(height);
    xSpeed[i] = random(-40,2);
    ySpeed[i] = random(5,-8);
    bSize[i] = random(20,60);
    bColor[i] = color(random(100,240),random(80,100),random(80,100),70);
  }
}

void draw(){
  
  background(0,0,99);
  
  
  for(int i=0; i<BALL_MAX; i++){
    fill(bColor[i]);
    ellipse(x[i],y[i],bSize[i],bSize[i]);
    x[i] += xSpeed[i];
    y[i] += ySpeed[i];
    
    
    if(x[i] > width || x[i] < 0){
      xSpeed[i] *= -1;
      
    }
     if(y[i] > height || y[i] < 0){
      ySpeed[i] *= -1;
    }
  }
  
  fill(0,0,99);
  text("procceshing",240,240);
  
}


