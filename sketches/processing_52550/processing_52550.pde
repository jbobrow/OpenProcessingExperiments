
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/52550*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
Desert Crossing
by Daniel Buschek
February, 2012

Move the mouse horizontally to control the flow of time.
*/


int numSteps = 10;
float[] rnd = new float[numSteps];

void setup() {

  size(800, 600);
  frameRate(30);
  smooth();
  noStroke();
  colorMode(HSB, 360);
  for (int i = 0; i < numSteps; i++)
    rnd[i] = random(0, 1);
}

void draw() {
  
  background(0);  
  
  float speed = max(0.25, mouseX/(float)width * 3);
  float maxStep = numSteps;
  
  for (int i = 1; i < numSteps; i++) {
    
    float cycle = (1+sin(-HALF_PI + frameCount*0.03*speed))/2;
    fill(60 * (1-cycle), 150, i/maxStep * 360); 
    ellipse(width/2, height * cycle, 
    (1-i/maxStep) * width/2.0, (1-i/maxStep) * width/2.0);
  }
  
  for (int i = numSteps-1; i > 0; i--) { 
    
    float cycle = (1+sin(i/maxStep/4.0 * TWO_PI + frameCount*0.03*speed))/2;
    float cycle2 = (frameCount*(1+maxStep*maxStep-i*i)*speed/20)%(width*2);
    
    fill(60 * cycle, 60, 360 * cycle);
    
    rect(0, height - i/maxStep * height/2, width, height/2/maxStep);    
    fill(30, 100, 160 * cycle);
    
    pushMatrix();
    translate(width + rnd[i]*width/2 - cycle2, 
    height - i/maxStep * height/2 + height/2.0/maxStep);
    beginShape(); 
    vertex(0, 0); 
    vertex(200 * (1+rnd[i]) * (1-i/maxStep), 0); 
    vertex(100 * (1+rnd[i]) * (1-i/maxStep), -100 * (1+rnd[i]) * (1-i/maxStep)); 
    endShape(CLOSE);
    popMatrix();
    
    fill(0, 200 + (1-i/maxStep) * 160);
    rect(-rnd[i]*width + cycle2, 
    height - i/maxStep * height/2 + height/4.0/maxStep, 4, height/2.0/maxStep * (1-i/maxStep));
    
    fill(60, 30, 360, 60);
    rect(0, height/2 + i/maxStep*height/3 * cycle, width, 40);   
  }
}



