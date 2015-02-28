
float[] xP = new float[1000];
float[] yP = new float[1000];


void setup() {

  size(500, 500);

  int i = 0;
  while (i < xP.length) {
    xP[i] = random(0, 500);
    yP[i] = random(0, 500);
    i= i+1;
  }
}


void draw() {

  background(255);

  int i = 0;
  while (i < xP.length) {

    ellipse(xP[i], yP[i], 10, 10);
    float dista = dist(mouseX, mouseY,xP[i], yP[i]);
if(dista < 100) {
    xP[i]=xP[i]+(xP[i]-mouseX)/25;
    yP[i]=yP[i]+(yP[i]-mouseY)/25; 

    
    
    
  }
  i=i+1;
}}



