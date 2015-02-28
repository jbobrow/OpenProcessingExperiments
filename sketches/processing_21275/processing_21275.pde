
//Nicholas Tang
//2/18/2011

class Region {
  int r, g, b, l, idx;
  int[] indexx, indexy;
  
  Region(int l1, int r1, int g1, int b1, int indexdx, int indexdy, int idx1){
    l = l1;
    r = r1;
    g = g1;
    b = b1;
    idx = idx1;
    indexx = new int[4000];
    indexy = new int[4000];
    indexx[0] = indexdx;
    indexy[0] = indexdy;
  }
  void update(int indexdx, int indexdy){
    idx++;
    indexx[idx] = indexdx;
    indexy[idx] = indexdy;
  }
}

