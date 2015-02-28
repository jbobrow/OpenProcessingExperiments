
float a,b, board_sz, stone_sz;

float cx = -100, cy = -100;
int n = 0;

int BLACK = 2; WHITE = 1;
int SZ = 19;

int[][] stones;
int[][] warning;
int[][] liberty;

void setup(){
    size (600, 600);
    a=width/(SZ + 1);
    b=height/(SZ + 1);
    stone_sz = a * .8;
    stones = new int[SZ][SZ];
    warning = new int[SZ][SZ];
    liberty = new int[SZ][SZ];
      for(int i=0;i<SZ;i++)
        for(int j=0;j<SZ;j++)
          liberty[i][j] = 4;                  
    board();
}

void draw() {
    background(200);
    stroke(0);
    board();
    if (n >= 1) {
        PVector p = snap(cx, cy);
        for(int i = 0; i < SZ; i++)         
          for (int j = 0; j < SZ ; j++) {
            if (stones[i][j] != 0) {
                int c = stones[i][j] == WHITE ? 255 : 0;   
                stroke(0);
                fill(c);
                ellipse ((i + 1) * a, (j + 1) * b, stone_sz, stone_sz);
            }
            if (warning[i][j] > 0) {
                noFill();
                stroke(255, 0, 0);
                ellipse ((i + 1) * a, (j + 1) * b, stone_sz * 1.2, stone_sz * 1.2);
                warning[i][j]--;
            }
        }
    }
}

void mouseClicked() {
    cx = mouseX ;
    cy = mouseY;
    n++;
    PVector p = snap(cx,cy);
    if (stones[round(p.x) - 1][round(p.y) - 1] == 0) {
       stones[round(p.x) - 1][round(p.y) - 1] = n % 2 + 1;
       ArrayList nb = neighbours(round(p.x), round(p.y));
       for (int i = 0; i < nb.size(); i++) {
           PVector q = (PVector)(nb.get(i));
            warning[round(q.x) - 1][round(q.y) - 1] = 20;
            --liberty[round(q.x) -1][round(q.y) - 1];
           if(blocked(round(q.x), round(q.y)) == 0) {
               stones[round(q.x) - 1][round(q.y) - 1] = 0;
               ArrayList nc = neighbours(round(q.x), round(q.y));
               for(int j =0; j<nc.size(); j++) {
                  PVector qq = (PVector)(nc.get(j));
                  liberty[round(qq.x) -1][round(qq.y) - 1]++;
               }
           }
       }
    }
    else {
        warning[round(p.x) - 1][round(p.y) - 1] = 20;
        n--;
    }
}

PVector snap(float x, float y) {
    PVector p = new PVector();
    p.x = round(x/width * (SZ + 1));
    p.y = round(y/height * (SZ + 1));
    p.x = max(1, p.x);
    p.y = max(1, p.y);
    p.x = min(SZ, p.x);
    p.y = min(SZ,p.y);
    return p;
}

void board (){
    for(int i=1; i<=SZ;i++){
        line(i * a, 0, i*a, height);
        line(0, i*b, width, i*b);
    }
}

ArrayList neighbours(int c, int r) {
  int minC = c > 1 ? c - 1 : c;
  int minR = r> 1 ? r-1:r;
  int maxC = c < SZ ? c+1 : c;
  int maxR = r < SZ ? r+1 : r;
ArrayList aux = new ArrayList();
  for(int i = minC ; i<=maxC ; i++)     {
      for(int j = minR ; j<=maxR; j++) {
        if((i==c ^ j ==r)){   
            aux.add(new PVector(i, j));
        }
        }
   }
   return aux;
}    

int group(int i, int j, int[][] ex) {
        ArrayList nc = neighbours(i, j);
        int kind = stones[i-1][j-1];
        int lib = liberty[i-1][j-1];
        for (int z = 0; z < nc.size(); z++) {
            PVector ne = (PVector)(nc.get(i));
            if(ex[round(ne.x)-1][round(ne.y)-1] == 0) {
               if(stones[round(ne.x)-1][round(ne.y)-1] == kind) {
                  ex[round(ne.x)-1][round(ne.y)-1] = 1;
                  warning[round(ne.x)-1][round(ne.y)-1] = 20;
                  lib += group(round(ne.x), round(ne.y), ex);
               }             
               else {
                   ex[round(ne.x)-1][round(ne.y)-1] = -1;
               }
            }
        }
        return lib;
    }    

int blocked(int c, int r) {
    int[][] explored = new int[SZ][SZ];
    explored[c-1][r-1] = 1;
    
   /* */
    
    return group(c, r, explored);
    return liberty[c-1][r-1];
} 
