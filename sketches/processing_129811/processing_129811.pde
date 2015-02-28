
int width = 1024;
int height = 768;
float y = width/2;
float[] n = new float[width/10];


color c;
boolean shift = true;

void setup() {
  size(width,height);
  background(0);  
  c = color(random(255),random(255),random(255));
  
  stroke(255);
  fill(255);
   createArray();
}

void createArray() {

  for (int i = 0; i < n.length; i++) {
    n[i] = int(random(0,height));
    
      
  }

} 

void mousePressed() {
  if (mouseButton == LEFT) {
    shift = false;
  }
  if (mouseButton == RIGHT) {
    shift = true;
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
  }
}

void shift()
{
    float temp = n[0];
    for (int m = 1; m < n.length; m++)
        n[m-1] = n[m];
    n[n.length-1] = temp;
}

void draw() {
  if (shift == true) {
    shift(); 
  } 
  background(0);
  noSmooth();
  stroke(c);
  strokeWeight(1);
  for (int j = 0; j < n.length; j++) {    
    point(j*10,n[j]);
  }
  for (int k = 0; k < n.length-1; k++) {
    line(k*10,n[k],(k+1)*10,n[k+1]);
  }
}
