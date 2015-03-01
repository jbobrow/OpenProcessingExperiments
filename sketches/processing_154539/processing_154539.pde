
int count;

int t=0;

boolean mousep = false;

int nmax = 1000;

boolean[][] point;
boolean[][] kpoint;

void setup() {
  size(1000, 500); 
  background(255);  
  point = new boolean[nmax][nmax];
  kpoint = new boolean[nmax][nmax];
  for (int i = 0; i <= nmax-1; i ++) {    
    for (int j = 0; j <= nmax-1; j ++) {    
      point[i][j] = false;
      kpoint[i][j] = false;
    }
  }
}

void draw() {
  background(255);


  if (t==0) {
    puffer(10, 0);
  }



  if (mousePressed) {
    if (!mousep) {      
    puffer(mouseX, mouseY-height/2);
    }
    mousep = true;
  }
  if (!mousePressed)mousep = false;

  if (true) {
    for (int i = 1; i <= nmax-2; i ++) {    
      for (int j = 1; j <= nmax-2; j ++) {
        count = 0;    
        if (point[i-1][j-1]) count++;
        if (point[i-1][j]) count++;
        if (point[i-1][j+1]) count++;
        if (point[i][j-1]) count++;
        if (point[i][j+1]) count++;
        if (point[i+1][j-1]) count++;
        if (point[i+1][j]) count++;
        if (point[i+1][j+1]) count++;

        if (point[i][j]) {
          if (count<=1 || count>=4) kpoint[i][j]=false;
          else kpoint[i][j]=true;
        }
        else {
          if (count==3) kpoint[i][j]=true;
          else kpoint[i][j]=false;
        }
      }
    }
  }

  for (int i = 0; i <= nmax-1; i ++) {    
    for (int j = 0; j <= nmax-1; j ++) {    
      point[i][j] = kpoint[i][j];
    }
  }

  for (int i = 0; i <= nmax-1; i ++) {    
    for (int j = 0; j <= nmax-1; j ++) {    
      if (point[i][j]) point(i, j);
    }
  }
  
  t++;
  
}

void puffer(int x, int y) {
  point[x+ 1][height/2+y+ 3]=true; 
  point[x+ 1][height/2+y+ 8]=true; 
  point[x+ 1][height/2+y+ 17]=true; 
  point[x+ 2][height/2+y+ 4]=true; 
  point[x+ 2][height/2+y+ 9]=true; 
  point[x+ 2][height/2+y+ 18]=true; 
  point[x+ 2][height/2+y+ 12]=true; 
  point[x+ 3][height/2+y+ 9]=true; 
  point[x+ 3][height/2+y+ 10]=true; 
  point[x+ 3][height/2+y+ 11]=true; 
  point[x+ 3][height/2+y+ 4]=true; 
  point[x+ 3][height/2+y+ 18]=true; 
  point[x+ 4][height/2+y+ 1]=true; 
  point[x+ 4][height/2+y+ 4]=true; 
  point[x+ 4][height/2+y+ 15]=true; 
  point[x+ 4][height/2+y+ 18]=true; 
  point[x+ 5][height/2+y+ 2]=true; 
  point[x+ 5][height/2+y+ 3]=true; 
  point[x+ 5][height/2+y+ 4]=true; 
  point[x+ 5][height/2+y+ 16]=true; 
  point[x+ 5][height/2+y+ 17]=true; 
  point[x+ 5][height/2+y+ 18]=true; 
}

