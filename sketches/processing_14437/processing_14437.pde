
//bz reaction by Alasdair Turner 
//http://www.openprocessing.org/visuals/?visualID=1263
class BZ{
float [][][] a;
float [][][] b;
float [][][] c;
int sz;
int p = 0, q = 1;
int time=0;
float ch=0.05,ad=2; 
BZ()
{
sz=30; 
  a = new float [sz][sz][2];
  b = new float [sz][sz][2];
  c = new float [sz][sz][2];
  for (int x = 0; x < sz; x++) {
    for (int y = 0; y < sz; y++) {
      a[x][y][p] = random(0.0,0.7);
      b[x][y][p] = random(0.0,0.7);
      c[x][y][p] = random(0.0,0.7);
    }
  }
} 
void run()
{
  time++;
  for (int x = 0; x < sz; x++) {
    for (int y = 0; y < sz; y++) {
      float c_a = 0.0;
      float c_b = 0.0;
      float c_c = 0.0;
      for (int i = x - 1; i <= x+1; i++) {
        for (int j = y - 1; j <= y+1; j++) {
          c_a += a[(i+sz)%sz][(j+sz)%sz][p];
          c_b += b[(i+sz)%sz][(j+sz)%sz][p];
          c_c += c[(i+sz)%sz][(j+sz)%sz][p];
        }
      }
      c_a /= 9.0*(noise((frameCount)*ch,x*ch,y*ch)*ad);
      c_b /= 9.0*(noise((frameCount)*ch,x*ch,y*ch)*ad);
      c_c /= 9.0*(noise((frameCount)*ch,x*ch,y*ch)*ad);
      // adjust these values to alter behaviour
      a[x][y][q] = constrain(c_a + c_a * (c_b - c_c), 0, 1);
      b[x][y][q] = constrain(c_b + c_b * (c_c - c_a), 0, 1);
      c[x][y][q] = constrain(c_c + c_c * (c_a - c_b), 0, 1);
    }
  }
              if (p == 0) {
    p = 1; q = 0;
  }
  else {
    p = 0; q = 1;
  }


}
}

