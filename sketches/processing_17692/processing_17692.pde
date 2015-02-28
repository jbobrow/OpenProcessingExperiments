
class Blob {
  float x;
  float y;
  float w;
  float rr;
  float rg;
  float rb;
  float rt = 100;

  Blob(float tempX, float tempY, float tempW, float tempRR, float tempRG, float tempRB) {
    x = tempX;
    y = tempY;
    w = tempW;
    rr = tempRR;
    rg = tempRG;
    rb = tempRB;
  }


  void display () {
    if (w < 100) {
            w = w + 2;
      rt = rt - 2;
      
    }
    else {
      w = 0;
    }

    
    fill(rr,rg,rb,rt);
    ellipse(x,y,w,w);
  }
}


