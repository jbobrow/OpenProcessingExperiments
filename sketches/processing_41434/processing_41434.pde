
float[] reactorx = new float[91];
float[] reactory = new float[91];
float[] reactorr = new float[91];

float[] breactorx = new float[91];
float[] breactory = new float[91];
float[] breactorr = new float[91];

float[] soundr = new float[91];
float[] infillr = new float[91];

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
    breactorx[i] = x;
    breactory[i] = y;
    breactorr[i] = 20;
    if (x == 650){
      x = 50; y = y + 50;}
      else{
        x = x + 50;}
    
    soundr[i] = random(1,10);
    infillr[i] = 0;
  }

  ellipseMode(CENTER);
}



void draw(){
  noStroke();
  fill(255,20);
  rect(0,0,700,400);
  int r = 0;
  int rr = 0;
  float x3;
  float y3;
  while (r < 91){
    if (dist(mouseX,mouseY,reactorx[r],reactory[r])<80 & mouseX>2 & mouseX<698 & mouseY>2 & mouseY<398){
      x3 = reactorx[r] - mouseX;
      y3 = reactory[r] - mouseY;
      reactorx[r] = reactorx[r]+(0.1*x3);
      reactory[r] = reactory[r]+(0.1*y3);
      if (infillr[r]<=240){
        infillr[r] = infillr[r] + 15;}
    }
    while (rr < 91){
      if (rr != r){
      if (dist(reactorx[r],reactory[r],reactorx[rr],reactory[rr])<reactorr[r]){
        x3 = reactorx[rr] - reactorx[r];
        y3 = reactory[rr] - reactory[r];
        reactorx[rr] = reactorx[rr] + (x3*0.1);
        reactory[rr] = reactory[rr] + (y3*0.1);
        if (infillr[rr]<=240){
          infillr[rr] = infillr[rr] + 50;}
        
        reactorx[r] = reactorx[r] - (x3*0.1);
        reactory[r] = reactory[r] - (y3*0.1);
        if (infillr[r]<=240){
          infillr[r] = infillr[r] + 50;}
      }}
      rr = rr + 1;
    }
    if (breactorx[r] != reactorx[r]){
      reactorx[r] = reactorx[r]+((breactorx[r]-reactorx[r])*0.02);
    }
    if (breactory[r] != reactory[r]){
      reactory[r] = reactory[r]+((breactory[r]-reactory[r])*0.02);
    }
    
    
    fill(255-infillr[r],127,0+infillr[r],80);
    ellipse(reactorx[r],reactory[r],reactorr[r],reactorr[r]);
    if (infillr[r] >= 5){
      infillr[r] = infillr[r]-5;}
    r = r + 1;
    rr = 0;}
}

