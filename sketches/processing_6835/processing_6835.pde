
/*
'a' = less boids
'z' = more boids, but will freeze above 50, so go down first
'*' = faster
'/' = slower
'-' = shorter lines
'+' = longer lines
mouse left = trails
mouse right = no trails
mouse x/y = color change
*/



int amount = 50;
int canvasY = 600;
int canvasX = 600;
float inc = 0.003;
int tran = 1;
int distL = 30;

float[] ptX = new float[amount];
float[] ptY = new float[amount];
float[] nX = new float[amount];
float[] nY = new float[amount];

void setup() {
  background(0);
    if (mouseButton == LEFT) {
  background(0);
  }

  size(canvasX, canvasY);
  smooth();
  strokeWeight(2);
  for (int i = 0; i < amount; i++) {
    ptX[i] = random(0, canvasX);
    ptY[i] = random(0, canvasY);
  }
}

void draw() {
  
    if (mouseButton == RIGHT) {
  background(0);
  }

  fill(mouseY*0.5,mouseX*0.5,155,tran);
  stroke(5,120,random(255));

if((keyPressed == true)&&(key == '+')) {
  distL++;
}
if((keyPressed == true)&&(key == '-')) {
  distL--;
}
if((keyPressed == true)&&(key == '*')) {
  inc += 0.0003;
}
if((keyPressed == true)&&(key == '/')) {
  inc -= 0.0003;
}
if((keyPressed == true)&&(key == 'z')) {
  amount+=1;
}
if((keyPressed == true)&&(key == 'a')) {
  amount-=1;
  if(amount >=40) {
    amount = 1;
  }
  

}



  for(int i = 0; i < amount; i++) {
    nX[i] = noise(ptX[i]) * (canvasX);
    nY[i] = noise(ptY[i]) * (canvasY);    
    ptX[i] = ptX[i]+inc;
    ptY[i] = ptY[i]+inc;
  }   
  
  for (int i = 0; i < amount; i++) {
    for(int j = i; j < amount; j++) {
      if(dist(nX[j],nY[j],nX[i],nY[i]) < distL) {
        line (nX[j],nY[j],nX[i],nY[i]);
      }
    }
  }
    for(int i = 0; i < amount; i++) {
    ellipse(nX[i],nY[i], 13, 13);
  }
   tran+=1;
  if(tran >=255) {
    tran = 0;
  } 

}



