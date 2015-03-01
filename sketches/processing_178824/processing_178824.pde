
//setting up the background
void setup() {
  size(700, 820);
  background(256);   
  color[] hexCol = new color[100]; //creates an array for each of the colors in each position
  for (int i=0; i < 100; i++) {
    noStroke();
    color col = color((int)random(0, 256), (int)random(0, 256), (int)random(0, 256));
    hexCol[i] = col;
    fill(col);    
    if (i%20 < 10){
      polygon(floor(i/10)*100 - 25*(floor(i/10)-1), (i%10)*50*sqrt(3)+25*sqrt(3), 50, 6);
    }else{      
      polygon(floor(i/10)*100 - 25*(floor(i/10)-1), (i%10)*50*sqrt(3), 50, 6);     
    }    
  }
}

void draw() {
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void mousePressed(){
  /* mouseX, mouseY -- define equation for mouse to satisfy
  */  
}




