
int counter=10;
int[][] map;
PVector[] nbd; 
 
void setup() {  //setup function called initially, only once

  colorMode(RGB, 255);
  
  map = getFreshMap();

  noStroke();
  size(250, 250);
  background(255);  //set background white
  counter = 0;
  nbd = getNeighborhood();
}

int[][] getFreshMap() {
  
  int m = new int[250][250];
  for(int i = 0; i < m.length; i++) {
      m[i] = new int[250];
      for (int j=0; j< m[i].length; j++) {
          m[i][j] = 255;
      }
  }
  return m;
}

void mouseClicked() {
    if (mouseButton == RIGHT) {
        background(255);
        map = getFreshMap();
    }
}

void mouseDragged() {  //draw function loops 
  
    int x = mouseX; //(int) ((counter * cos( (q/360) * 2 * PI)) + 125);
    int y = mouseY; //(int) ((counter * sin( (q/360) * 2 * PI)) + 125);

    for(int ni=0; ni<nbd.length;ni++) {
        punch(nbd[ni].x + x, nbd[ni].y + y);               
    }   
    
    for(int ni=0; ni<nbd.length;ni++) {
        fill(getValue(nbd[ni].x + x,nbd[ni].y + y));
        ellipse(nbd[ni].x + x,nbd[ni].y + y,1,1);               
    }        
  
  counter = (counter+59) % 191;
}
 
 
void draw() { 
}
 
                          
PVector[] getNeighborhood()
{
    int R = 10;
    ArrayList vs = new ArrayList();
 
    for(int r=R;r>0;r--) {    
        for(int j=-r;j< r;j++) {
            for (int k=-r; k< r; k++) {
                if (sqrt((j*j) + (k*k)) <= r) {
                    vs.add(new PVector(j,k));  
                } 
            }
        }
    }
        
    PVector[] n = new PVector[vs.size()];
    for(int vi=0; vi< n.length;vi++) {
        n[vi] = (PVector) vs.get(vi);
    }
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
