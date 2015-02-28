
color c;
void setup() {
  size(600, 600, P3D);
  background(0);
  translate(0, 0, 20);
  noStroke();
  float x = width;
  float margin = width/10;
  //c = color (184, 99, 97);
  c = color (200, 100, 4);
  cantorDust(x, margin); 
  saveFrame();
}

void makeCube(float x) {
  if (x < 17) {
  fill(c);
  strokeWeight(0.8);
  stroke(0);
  box(x);
  }
}


  

  
  
  
  
  

  



void cantorDust(float x, float m) {
 
  x-=2*m;
 
  translate(m+x/6, m+x/6, 0);
  makeCube(x/3);
  
  translate(x*2/3, 0, 0);
  makeCube(x/3);
  
  translate(0, x*2/3, 0);
  makeCube(x/3);
  
  translate(-x*2/3, 0, 0);
  makeCube(x/3);
  
  translate(-x/6, -x*2/3-x/6, 0); // (m, m, 0);
     
  if(x > 18) {
    
    translate(0, 0, x/9);
    cantorDust(x/3, 0); 
    translate(x*2/3, 0, 0); 
    cantorDust(x/3, 0);
    translate(0, x*2/3, 0);
    cantorDust(x/3, 0);
    translate(-x*2/3, 0, 0);
    cantorDust(x/3, 0);
    translate(0, -x*2/3, -x/9); // (m, m, 0);
    
    translate(0, 0, -x/9);
    cantorDust(x/3, 0); 
    translate(x*2/3, 0, 0); 
    cantorDust(x/3, 0);
    translate(0, x*2/3, 0);
    cantorDust(x/3, 0);
    translate(-x*2/3, 0, 0);
    cantorDust(x/3, 0);
    translate(0, -x*2/3, x/9);
  }
}


