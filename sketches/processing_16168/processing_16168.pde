
float x[] = new float[100];
float y[] = new float[100];
float v[] = new float[255];
float w[] = new float[255];
float z[] = new float[255];
float invVel;
void setup() {
  background(255);
  size(1280,768,P2D);
  invVel=30;
  for (int i = 0; i < 50; i++) {

  }
  smooth();

}

void draw() {
  //background(255);
  for (int i = 0; i < 50; i++) {
    
    fill(w[i],z[i],v[i]);
  }

  for (int j = 0; j < 50; j++) {
    
    ellipse(x[j],y[j],20,20);
  }

  for (int j = 0; j < 50; j++) {
    x[j] = x[j] + (mouseX-x[j] + 5*random(-j,j))/invVel ;
    y[j] = y[j] + (mouseY-y[j] + 5*random(-j,j))/invVel;
  }


}

void mousePressed(){
  for (int j = 0; j < 50; j++) {
    // x[j] = random(width);
    //y[j] = random(height);   

  }
  noStroke();
  fill(255);
  rect(0,0,width,height);
  invVel=-50; 
  stroke(0);
  noFill();
}

void mouseReleased(){
  invVel=100; 

}


