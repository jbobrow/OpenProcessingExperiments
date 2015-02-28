
int total = 0;

float[] xpos = new float[0];
float[] ypos = new float[0];;
float[] r = new float[0];
float[] g = new float[0];
float[] b = new float[0];

void setup(){
  background (255);
  size(700,400);
  smooth();
  //noStroke();
  strokeWeight(0.5);
  
}
void keyPressed(){
 
    background(255);
    xpos = new float[0];
    ypos = new float[0];;
    r = new float[0];
    g = new float[0];
    b = new float[0];
    total=0;
}

void draw(){
 
  int i = 0;
  while (i < total) {
    fill(0,mouseY,mouseX,5);
    ellipse(xpos[i],ypos[i],mouseX,mouseY);
    i = i + 1;
    
}
}



void mousePressed(){
  total = total + 1;
  xpos = expand(xpos, total);
  ypos = expand(ypos, total);
  
  xpos[total - 1] = random(width);
  ypos[total - 1] = random(height);
} 



