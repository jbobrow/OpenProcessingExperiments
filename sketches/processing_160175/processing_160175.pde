
int cuantos = 2000;
float[] px = new float[cuantos]; 
float[] py = new float[cuantos];
float[] tm = new float[cuantos];
float[] vl = new float[cuantos];
color[] colores = new color[cuantos];
void setup() {
  colorMode(HSB);
  size(500,500);
  noStroke();
  for (int L = 0; L<cuantos ; L++) {
    px[L] = random(500);
    py[L] = random(500);
    tm[L] = random(2,20);
    vl[L] = random(0.1,7);
    colores[L] = color(random(255),255,255);
  }
}
void draw(){
  background(255);
  for (int L = 0; L<cuantos ; L++) {
    fill(colores[L]);
    ellipse(px[L],py[L],tm[L],tm[L]);
    
    px[L] = px[L] + vl[L];
    if(px[L]>width){
    px[L]=0;
    }
    py[L] = py[L] - vl[L];
  }
}
