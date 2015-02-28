
float[] reactorx = new float[91];
float[] reactory = new float[91];
float[] reactorr = new float[91];



void setup(){
  size(700,400);
  background(255);
  int i = 91;
  int x = 50;
  int y = 50;
  while (i>0){
    i--;
    reactorx[i] = x;
    reactory[i] = y;
    reactorr[i] = 20;
    if (x == 650){
      x = 50; y = y + 50;}
      else{
        x = x + 50;}
  }

  ellipseMode(CENTER);
}



void draw(){
  noStroke();
  fill(255,20);
  rect(0,0,700,400);
  fill(255,127,0,80);
  int r = 0;
  float x3;
  float y3;
  while (r < 91){
    if (dist(mouseX,mouseY,reactorx[r],reactory[r])<50){
      x3 = reactorx[r] - mouseX;
      y3 = reactory[r] - mouseY;
      reactorx[r] = reactorx[r]+(0.05*x3);
      reactory[r] = reactory[r]+(0.05*y3);
    }
    
    
    
    ellipse(reactorx[r],reactory[r],reactorr[r],reactorr[r]);
    r = r + 1;}
}

