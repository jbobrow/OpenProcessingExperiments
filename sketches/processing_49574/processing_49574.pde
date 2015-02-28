
import processing.opengl.*;
import javax.media.opengl.*;

int petaleAmt1, petaleAmt2; 
float x, y;
color c1a, c1b, c2a, c2b;

float[] posPetal1, posPetal2;  

//temp variables
int ix;        
float fx, fy, fcx1, fcy1, fcx2, fcy2;

void setup() {
  size(300, 300, OPENGL);
  setupOpenglVars();
  fill(255);
  noStroke();
  frameRate(1);  

  x = width/2.0;
  y = height/2.0;
  
  reset();
}

  
void draw() {
  background(0);    
  
  applyOpenglBlend();
  
  //PETALS 1
  for (int i = 0; i < petaleAmt1; i++) {    
    ix   = i * 6;            
    fx   = posPetal1[0 + ix];
    fy   = posPetal1[1 + ix];
    fcx1 = posPetal1[2 + ix];
    fcy1 = posPetal1[3 + ix];      
    fcx2 = posPetal1[4 + ix];
    fcy2 = posPetal1[5 + ix];    
    drawPetal(fx, fy, fcx1, fcy1, fcx2, fcy2, c1a, c1b);
  }

  //PETALS 2
  for (int i = 0; i < petaleAmt2; i++) {    
    ix   = i * 6;            
    fx   = posPetal2[0 + ix];
    fy   = posPetal2[1 + ix];
    fcx1 = posPetal2[2 + ix];
    fcy1 = posPetal2[3 + ix];      
    fcx2 = posPetal2[4 + ix];
    fcy2 = posPetal2[5 + ix];    
    drawPetal(fx, fy, fcx1, fcy1, fcx2, fcy2, c2a, c2b);
  }

  reset();

}


void reset() {

  float rad, lar, nrad, s;
  
  c1a = color(random(255), random(255), random(255));
  c1b = color(random(255), random(255), random(255));
  c2a = color(random(255), random(255), random(255));
  c2b = color(random(255), random(255), random(255));
  
  //PETAL 1
  
  petaleAmt1 = int(random(5, 15));
  if (petaleAmt1 % 2 == 0) petaleAmt1++; //force odd value

  posPetal1 = null;
  posPetal1 = new float[6 * petaleAmt1];

  rad = random(50,100); //hauteur du petale
  lar = random(0.2, 0.7); //largeur du petale
  nrad = rad/random(1.1, 5.0 * lar);  

  s = TWO_PI / petaleAmt1;
  
  for (int i = 0; i < petaleAmt1; i++) {    
    int ix = i * 6;

    float l = sin(s * i) * rad;    
    float h = cos(s * i) * rad;

    float cx1 = x + sin(s * i + lar) * nrad;
    float cy1 = y + cos(s * i + lar) * nrad;      

    posPetal1[0 + ix] = x + l; // x
    posPetal1[1 + ix] = y + h; // y
    posPetal1[2 + ix] = cx1; // cx1
    posPetal1[3 + ix] = cy1; // cy1

    float cx2 = x + sin(s * i - lar) * nrad;
    float cy2 = y + cos(s * i - lar) * nrad;

    posPetal1[4 + ix] = cx2; // cx2
    posPetal1[5 + ix] = cy2; // cy2
  }
  
  // PETAL 2
  
  petaleAmt2 = int(random(3, 15));
  if (petaleAmt2 % 2 != 0) petaleAmt2++; //force odd value

  posPetal2 = null;
  posPetal2 = new float[6 * petaleAmt2];

  rad = random(20, 60); //hauteur du petale
  lar = random(0.2, 0.7); //largeur du petale
  nrad = rad/random(1.1, 5.0 * lar);  

  s = TWO_PI / petaleAmt2;
  
  for (int i = 0; i < petaleAmt2; i++) {    
    int ix = i * 6;

    float l = sin(s * i) * rad;    
    float h = cos(s * i) * rad;

    float cx1 = x + sin(s * i + lar) * nrad;
    float cy1 = y + cos(s * i + lar) * nrad;      

    posPetal2[0 + ix] = x + l; // x
    posPetal2[1 + ix] = y + h; // y
    posPetal2[2 + ix] = cx1; // cx1
    posPetal2[3 + ix] = cy1; // cy1

    float cx2 = x + sin(s * i - lar) * nrad;
    float cy2 = y + cos(s * i - lar) * nrad;

    posPetal2[4 + ix] = cx2; // cx2
    posPetal2[5 + ix] = cy2; // cy2
  }
  
}

void drawPetal(float p1, float p2, float p3, float p4, float p5, float p6, color c1, color c2) {
  beginShape();
  fill(c1);
  vertex(p1, p2);  
  bezierVertex(p3, p4, p3, p4, x, y);    
  fill(c2);
  bezierVertex(p5, p6, p5, p6, p1, p2);    
  endShape();
} 

PGraphicsOpenGL pgl;
GL gl;

void setupOpenglVars() {
  pgl = (PGraphicsOpenGL) g;
  gl = pgl.gl;
}

void applyOpenglBlend(){
  gl.glEnable(GL.GL_BLEND);
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);
}
                
                
