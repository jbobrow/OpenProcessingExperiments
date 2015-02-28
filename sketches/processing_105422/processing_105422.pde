
import java.util.Random;
Random r = new Random();

Alga[] alghe = new Alga[20];


// //////////////////////////////////////////////////////////////////
void setup() {
  size(640, 500);
  frameRate(24);
  smooth();
  
  for(int i=0; i <alghe.length; ++i) {
    
    float x = (float)r.nextGaussian()*50 + (width-100); // posizone gauss
    double l = (r.nextGaussian()*5 + 10 ); // altezza gauss
    double w = (r.nextGaussian()*2 + 10); // larghezza gauss
    
    alghe[i] = new Alga(20, (int)l, (int)w, (int)random(0.5, 4), 0.5, new PVector(x, height) );
  }
  
}

// //////////////////////////////////////////////////////////////////
void draw() {
  background(121, 187, 255);
  
  for(int i=0; i <alghe.length; ++i) {
    alghe[i].display(frameCount);
  }

}

class Alga {
  
  int s_n, s_l, s_w;    //numero, lunghezza e larghezza massima dei segmenti
  float o_ph;    // sfasamento di oscillazione relativo - di ciascun segmento
  float o_amp;   // ampiezza di oscillazione relativa massima - di ciascun segmento
  PVector bp;    // posizione della base
  PVector ip, fp, segment; // posizione iniziale, finale e vettore segmento
  
  color c_skin, c_spine;
  
  
  // COSTRUTTORE ////////////////////////////////////////////////////////////
  Alga(int _s_n, int _s_l, int _s_w, float _o_ph, float _o_amp, PVector _bp) {
    
    s_n = _s_n;
    s_l = _s_l;
    s_w = _s_w;
    o_ph = _o_ph;
    o_amp = _o_amp;
    bp = _bp; //hp = new PVector (80, height/2);
    
    ip = new PVector(0,0);
    fp = new PVector(0,0);
    segment = new PVector(0, 0);
    
    c_skin = color(57, random(100, 200), 78);
    c_spine = color(196, 209, 30);
  }
  
  
  // METODI /////////////////////////////////////////////////////////////////
  void display(float t) {
    ip = bp;

    for(int i=0; i<s_n; ++i) {
  
      segment.mult(0);
      segment.y = -1;
    
      float a = map(i, 0, s_n, 0, o_amp);
      segment.x = a * sin( radians((i * o_ph) + t) );
    
      segment.normalize();
      segment.mult(s_l);
  
      fp = PVector.add(ip, segment);
    
      float weight = map(i, 0, s_n, s_w, 1);
    
      strokeWeight(weight);
      stroke(c_skin);
      line(ip.x, ip.y, fp.x, fp.y);
    
      ip = fp;
    
    }
    
  }
  
}


