
float yoff = 0.0f;      
float[] yvalues;   
int i = 15;  
int j;                   
 
void setup() {
 
  int j=600;
  int h=200;
  size(400 , 400);
  frameRate(20);
  smooth();
  yvalues = new float[j/i];
}
 
void draw() {
  background(0);
  calcWave();
  renderWave();
 
}
 
void calcWave() {
  float dx = 0.05f;
  float dy = 0.1f;
  float amplitude = 500f;
  yoff += dy;

  float xoff = yoff; 
 
  for (int i = 0; i < yvalues.length; i++) {
   
    yvalues[i] = (2*noise(xoff)-1)*amplitude;   
     
    xoff+=dx;
  }
 
}
 
void renderWave() {
 
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    fill(random(255),random(255),random(255));
    rect(x*i,width/2+yvalues[x],20,20);
    
    fill(random(255));
    rect(x*i,100,20,20);
    rect(x*i,200,20,20);
    rect(x*i,300,20,20);

  }
}



