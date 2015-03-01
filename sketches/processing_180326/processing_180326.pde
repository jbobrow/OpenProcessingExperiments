
int counter;
float x,y;
float concentration, lastConcentration;
float gradient, angle;
PImage env;

void setup() {  
  size(300, 600);
  background(0);  
  //colorMode(HSB);   
  x = (int)random(300);
  y = (int)random(300);
  angle = random(2.0*PI);
  
  env = createImage(300, 300, RGB);
  env.loadPixels();
  int col;
  for (int i = 0; i < env.width; i++) {
       for (int j = 0; j < env.height; j++) {
         col=200-(int)(dist(i,j,150,150));
        env.pixels[i+j*env.width] = color(col, 0, col/2); 
      }
  }
  env.updatePixels();
  image(env, 0, 0);
  
  lastConcentration = concentration = env.get((int)x,(int)y);
}

void draw() {  //draw function loops 
  if(mousePressed == true) tumble();
  else run (0.7);  

  background(0);
  drawEnvironment();
  drawColi();  
  getConcentrationAndGradient();
  drawGradient();
}

void run (float d) {
    x = x + d*sin(angle);
    y = y + d*cos(angle);
    if (x > 300) x = 0;
    if (y > 300) y = 0;
    if (x < 0) x = 300;
    if (y < 0) y = 300;
}

void tumble () {
    angle = random(2.0*PI);
}

void drawColi() {
    fill(255,255,255);
    ellipse(x,y,10,10);
}

void drawEnvironment(){
   image(env, 0, 0);     
}

void getConcentrationAndGradient() {
    lastConcentration = concentration;
    concentration = red(env.get((int)x,(int)y));
    gradient += (concentration - lastConcentration - gradient)/20.0;
}

void drawGradient () {
  int c = 125 + (int)(255.0*gradient); 
  fill (c,0,c/2);
  rect(0,300,300,600);
}
