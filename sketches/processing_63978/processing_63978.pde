
int counter=10;
int[][] map;
 
void setup() {  //setup function called initially, only once

  colorMode(RGB, 255);
  
  map = new int[250][250];
  for(int i = 0; i < map.length; i++) {
      map[i] = new int[250];
      for (int j=0; j< map[i].length; j++) {
          map[i][j] = 255;
      }
  }

  noStroke();
  size(250, 250);
  background(255);  //set background white
  counter = 0;
  
}

void draw() {  //draw function loops 
  
  for(int q=0; q < 360; q++) {
    int x = (int) ((counter * cos( (q/360) * 2 * PI)) + 125);
    int y = (int) ((counter * sin( (q/360) * 2 * PI)) + 125);

    PVector[] nbd = getNeighborhood(x,y);
    for(int ni=0; ni<nbd.length;ni++) {
        punch(nbd[ni].x, nbd[ni].y);               
    }   
    
    for(int ni=0; ni<nbd.length;ni++) {
        fill(getValue(nbd[ni].x,nbd[ni].y));
        ellipse(nbd[ni].x,nbd[ni].y,1,1);               
    }        
  }
  
  counter = (counter+59) % 191;
}
                          
PVector[] getNeighborhood(int x, int y)
{
    int p=0;
    PVector[] n = new PVector[6];
    n[p++] = new PVector(x+1,y+1)        
    n[p++] = new PVector(x-1,y+1);    
    
    n[p++] = new PVector(x,y+1)        
    n[p++] = new PVector(x,y+1);    
    n[p++] = new PVector(x,y-1)        
    n[p++] = new PVector(x,y-1);            

    n[p++] = new PVector(x,y);
    n[p++] = new PVector(x,y);
    n[p++] = new PVector(x,y);
    
    n[p++] = new PVector(x-1,y)        
    n[p++] = new PVector(x-1,y);    
    n[p++] = new PVector(x+1,y)        
    n[p++] = new PVector(x+1,y);    
    
    n[p++] = new PVector(x-1,y-1);
    n[p++] = new PVector(x+1,y-1);
    return n;
}


int punch(int x, int y)
{
  int v = getValue(x,y);
  if (v != -1) {
    setValue(x, y, nextValue(v));    
  }  
}


int getValue(int x, int y) {
  if ((x > -1) && (x < 250) &&
    (y > -1) && (y < 250)) {
    return map[x][y];    
  } else {
    return -1;
  }
  
}

void setValue(int x, int y, int value) {
  if ((x > -1) && (x < 250) &&
    (y > -1) && (y < 250)) {
    map[x][y] = value;
  } 
}


int nextValue(int value) {
    return value/1.1;
}
