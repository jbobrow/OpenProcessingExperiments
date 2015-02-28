
class Reaction{
  float [][][] a;
  PGraphics atmt; 
  int sz;
  float ch=0.02f,ad=4.5f;
  
  Reaction()
  {
    sz=50;
    a = new float [sz][sz][2];
    atmt = createGraphics(sz, sz, P2D);
  }
  void run()
  {
    for (int x = 0; x < sz; x++) {
      for (int y = 0; y < sz; y++) {
          float c_a = 0.0;
          noiseDetail(3,0.3);
          c_a = sin(12.0*(noise((frameCount)*ch,x*ch,y*ch)*ad));
          a[x][y][1] = constrain(c_a, -0.5, 0.5);
          atmt.set(x,y,color(a[x][y][1]*255.0f));
      }
    }
  }
}


