
/*
Thanks to http://www.openprocessing.org/sketch/60845
*/
class Dendrit {
  float X;
  float Y;
  float rot;
  float V;
  float tm;
  int fm;

  
  Dendrit(int tX, int tY, float tfm, float trot, float tV) {
    X = tX;
    Y = tY;
    rot = trot;
    tm = tfm;
    V = tV;
  }

  void go() {
    
    V += random(-0.03, 0.03);
    // println(V);
    tm /= 1.01;
    strokeWeight(tm);
    rot += random(-0.2, 0.2);
    line(X, Y, X + V*sin(rot), Y + V*cos(rot));
    line(X, Y, X + V*sin(rot), Y + V*cos(rot));
    X += V*sin(rot);
    Y += V*cos(rot);
    fm++;
    println(tm);
    if(random(400) > 398.5-(fm/20)) {
      dendrits = (Dendrit[]) append(dendrits, new Dendrit(int(X), int(Y), tm, rot + random(-0.2, 0.2), V));
    }
  }
  boolean done() {
    if(tm < 1.01) {
      return true;
    }else{
      return false;
    }
  }
}


