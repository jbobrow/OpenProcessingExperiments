
final int bsize = 50;

int[][] blinkers = new int[bsize][bsize];
int[][] buffer = new int[bsize][bsize];

int minf, maxf;

void setup() {
  size(600,600);
  noStroke();
  smooth();
  textSize(12);
  textAlign(LEFT,TOP);
  minf=10;maxf=80; 
  resetBlinkers();
}

void resetBlinkers() {
   for(int i=0;i<bsize;i++)
    for(int j=0;j<bsize;j++) {
       blinkers[i][j] = (int)random(minf,maxf);
    }
}

void draw() {
 background(0);
 fill(200);
 text("Model: "+option,1,1);
  for(int i=0;i<bsize;i++)
    for(int j=0;j<bsize;j++) {
      float frequency = blinkers[i][j];
      float light = sin(PI * (((1234+frameCount) % frequency) / frequency));
      fill(255 * light, 200*(frequency-minf)/(maxf-minf), 0);
      ellipse(30+i*11,30+j*11,3+5*light,3+5*light);
    }
    
    updateBlinkers();
  }
  
int option=0;  
  
void updateBlinkers() {
  for(int i=0;i<bsize;i++) {
    for(int j=0;j<bsize;j++) {
      int l=(i+bsize-1)%bsize;  
      int r=(i+1)%bsize;
      int u=(j+bsize-1)%bsize;
      int d=(j+1)%bsize;
      switch(option) {
        case 0:
          buffer[i][j] = (int)((blinkers[i][j] - 0.25 * (blinkers[i][u] + blinkers[i][d] + blinkers[r][j] + blinkers[l][j])));
          break;
        case 1:
          buffer[i][j] = (int)(0.5*(blinkers[i][j] - 0.5 * (blinkers[i][u] + 0.5*blinkers[r][j] + 0.5*blinkers[l][j])));
          break;
        case 2:
          buffer[i][j] = (int)(0.75*(blinkers[i][j] - 0.25 * (blinkers[i][u] + 0.5*blinkers[i][d] + blinkers[r][j] + blinkers[l][j] + 30)));
          break;
        case 3:
          buffer[i][j] = (int)((blinkers[i][j] - (1/9.0) * (blinkers[i][j] + blinkers[l][u] + blinkers[i][u] + blinkers[r][u] + blinkers[l][d] + blinkers[i][d] + blinkers[r][d] + blinkers[l][j] + blinkers[r][j])));
          break;   
      }
    }}
    
   for(int i=0;i<bsize;i++)
    for(int j=0;j<bsize;j++) {
      blinkers[i][j]-=buffer[i][j]; 
      if(blinkers[i][j]<minf) blinkers[i][j] = minf;
      if(blinkers[i][j]>maxf) blinkers[i][j] = maxf;
    }
    
}  

void mouseClicked() {
  option = (option + 1) % 4;
  resetBlinkers();
}

void keyPressed() {
  resetBlinkers();
}
