
public static final int W = 456, H = 456, SLOW_ITER = 200, FAST_ITER = 4, CHAOS_GAMES_SLOW = 2000, CHAOS_GAMES_FAST = 800;
FractalFlame ff;
void setup() {
  size(W, H);
  ff = new FractalFlame();
}
void draw() {

  if(! ff.render) {
    //background(255-ff.iters*255.0/ff.max_iters);
    ff.update();
    
  } 
  ff.display();

}
void keyPressed() {
  ff.restart();
}
void mouseDragged() {
  ff.restart( mouseX, mouseY );
}
void mouseReleased() {  
  ff.slow();
  ff.rerender();
}
void mousePressed() {
  ff.fast();
}
class FractalFlame {
  int len = 3;
  Function[] functions = new Function[len];
  float[] probs;
  float[][][] histogram = new float[W][H][2];
  float[] p = new float[3];
  float[][] pixel_alpha = new float[W][H];
  float[][] pixel_hue = new float[W][H];
  float logFreq;
  float gamma = 22;
  int iters = 0;
  boolean render;
  float lx = 1000;
  float hx = -1000;
  float ly = 1000;
  float hy = -1000;
  int chaos_games = CHAOS_GAMES_SLOW;
  int max_iters = SLOW_ITER;
  
  public FractalFlame() {
    probs = new float[len];
    calcProbs();
    
    for(int i = 0; i < len; i++) {
      functions[i] = new Function();
    }
    p[0] = random(W);
    p[1] = random(H);
    p[2] = random(1);
    rerender();
  }

  void calcProbs() {
    float tot = 0;
    for(int i = 0; i < probs.length; i++) {
      probs[i] = (random(1-tot)/probs.length);
      tot += probs[i];
    }
  }
  void setBounds() {
    float[] tmp = new float[] { 
      p[0], p[1], p[2]
    };

    for(int k = 0; k < chaos_games; k++) {
      //for(int fun = 0; fun < functions.length; fun++) {
      float choose = random(1);
      float low = 0;
      Function func = null;

      /*for(int i = 0; i < probs.length; i++) {
       if(choose > low && choose < low + probs[i]) {
       func = functions[i];
       break;
       }
       low += probs[i];
       func = functions[i];
       }*/
      func = functions[(int)random(functions.length - 0.1)];
      tmp = calc( func, tmp );
      //}
       if(k > 40) {
        if(tmp[0] > hx) hx = tmp[0];
        if(tmp[0] < lx) lx = tmp[0];
        if(tmp[1] > hy) hy = tmp[1];
        if(tmp[1] < ly) ly = tmp[1];
       }
  }
  }
  void iter() { 
    float[] tmp = new float[] { 
      p[0], p[1], p[2]
    };

    for(int k = 0; k < chaos_games; k++) {
      //for(int fun = 0; fun < functions.length; fun++) {
      float choose = random(1);
      float low = 0;
      Function func = null;

      /*for(int i = 0; i < probs.length; i++) {
       if(choose > low && choose < low + probs[i]) {
       func = functions[i];
       break;
       }
       low += probs[i];
       func = functions[i];
       }*/
      func = functions[(int)random(functions.length - 0.1)];
      tmp = calc( func, tmp );
      //}
     
        //if(tmp[0] > hx) hx += (tmp[0] - hx)*k/chaos_games;
        //if(tmp[0] < lx) lx += (tmp[0] - lx)*k/chaos_games;
        ///if(tmp[1] > hy) hy += (tmp[1] - hy)*k/chaos_games;
        //if(tmp[1] < ly) ly += (tmp[1] - ly)*k/chaos_games;
      /*if(k < 40) {
        if(tmp[0] > hx) hx += k/(tmp[0] - hx);
        if(tmp[0] < lx) lx += k/(tmp[0] - lx);//*k/chaos_games;
        if(tmp[1] > hy) hy += k/(tmp[1] - hy);//*k/chaos_games;
        if(tmp[1] < ly) ly += k/(tmp[1] - ly);//*k/chaos_games;
      }*/
      if(k > 40) {
        int x = (int)constrain(map(tmp[0], lx, hx, 0, W-1), 0, W-1);
        int y = (int)constrain(map(tmp[1], ly, hy, 0, H-1), 0, H-1);

        //if(tmp[0] > hx) hx = tmp[0];
        //if(tmp[0] < lx) lx = tmp[0];
        //if(tmp[1] > hy) hy = tmp[1];
        //if(tmp[1] < ly) ly = tmp[1];

        histogram[x][y][0] += 1;
        histogram[x][y][1] = (histogram[x][y][1] + tmp[2])/2.0;
      }
    }
  }
  void calcMax() {
    logFreq = 0;
    float freq = 0;
    int x = 0,y = 0;
    for(int i = 0; i < histogram.length; i++) {
      for(int j = 0; j < histogram[0].length; j++) {
        if(histogram[i][j][0] > freq) {
          freq = histogram[i][j][0];
          x = i;
          y = j;
        }
      }
    }
    //println("x: "+x+"\ny: "+y);
    logFreq = log(freq);
  }

  void display() {
    loadPixels();
    colorMode(HSB, 1);
    for(int i = 0; i < histogram.length; i++) {
      for(int j = 0; j < histogram[0].length; j++) {
        float a = log(histogram[i][j][0])/logFreq;
        pixels[i+j*H] = color(constrain(histogram[i][j][1], 0, 1), 1, a);
      }
    }
    updatePixels();
  }

  void update() {
    p[0] = random(W);
    p[1] = random(H);
    p[2] = random(1);
    
    iter();
    iters++;
    if(iters > max_iters) {
      render = true;
      
    }
    calcMax();
  }

  float[] calc( Function func, float[] vals ) {
    float[] tmp = func.f( vals[0], vals[1], vals[2] );

    return tmp;
  }
  void restart() {
    for(int i = 0; i < functions.length; i++) {
      functions[i].randomCoefs();//setCoefs( sin(my/(56.0+i)*i/2), cos(mx/(52.0-i)*i/1.1), sin(PI+mx/(90+i)*i/1.6),
                             //sin(mx/(76.0+3.3*i)*i/1.3), cos(mx/(90.0-i)*i/1.1), sin(PI+mx/(20+i)*i*.5) );
      functions[i].randomWeights();
    }
    rerender();
  }
  void restart(float mx, float my) {
    for(int i = 0; i < functions.length; i++) {
      functions[i].setCoefs( 
          sin(my/(5.6+i/4.4)), cos(mx/(52.0-i)*i/1.1), sin(PI+mx/(90+i)),
          sin(mx/(7.6+i/2.7)), cos(mx/(90.0-i)*i/1.1), sin(PI+mx/(20+i))
      );
      functions[i].randomWeights();
    }
    rerender();
  }
  
  void fast() {
    chaos_games = CHAOS_GAMES_FAST;
    max_iters = FAST_ITER;
  }
  void rerender() {
    lx = 1000;
    hx = -1000;
    ly = 1000;
    hy = -1000;
    for(int i = 0; i < FAST_ITER; i++) {
      p = new float[]{ random(W), random(H), random(1) };
      setBounds();
    }
    render = false;
    for(int i = 0; i < histogram.length; i++) {
      for(int j = 0; j < histogram[0].length; j++) {
        histogram[i][j][0] = 0;
        histogram[i][j][1] = 0;
      }
    }
    iters = 0;
    
  }
  void slow() {
    chaos_games = CHAOS_GAMES_SLOW;
    max_iters = SLOW_ITER;
  }
}

class Function {
  float a,b,c,d,e,f;
  int clr;
  float h;
  float[] weights = new float[3];
  Variation[] vars = new Variation[3];
  public Function() {
    h = random(1);
    randomCoefs();
    randomWeights();
    initVars();
  }
  void randomCoefs() {
    float high = 2;
    float low = -2;
    a = random(low,high);
    b = random(low,high);
    c = random(low,high);
    d = random(low,high);
    e = random(low,high);
    f = random(low,high);
  }
  void setCoefs(float a_, float b_, float c_, float d_, float e_, float f_ ) {
    a = a_;
    b = b_;
    c = c_;
    d = d_;
    e = e_;
    f = f_;
  }
  void randomWeights() {
    for(int i = 0; i < weights.length; i++)
      weights[i] = random(1);
  }
  void initVars() {
    vars[0] = new SinVar();
    vars[1] = new LinVar();
    vars[2] = new SphereVar();
  }
  float[] f( float x, float y, float h_ ) {
    float[] ret = new float[] {
      0,0,0
    };
    for(int i = 0; i < vars.length; i++ ) {
      float[] tmp = vars[i].v( a*x + b*y + c, d*x + e*y + f );
      for(int j = 0; j < tmp.length; j++) {
        ret[j] += weights[i]*tmp[j];
      }
    }
    ret[2] = (h_ + h)/2;
    return ret;
  }
}
interface Variation {
  public float[] v( float m, float n );
}
class LinVar implements Variation {
  public LinVar() {
  }
  public float[] v( float m, float n ) {
    return new float[] { 
      m,n
    };
  }
}
class SinVar implements Variation {
  public SinVar() {
  }
  public float[] v( float m, float n ) {
    return new float[] { 
      sin(m), cos(n)
      };
    }
  }
class SphereVar implements Variation {
  public SphereVar() {
  }
  public float[] v( float m, float n ) {
    return new float[] { 
      m/(m*m + n*n), n/(m*m + n*n)
      };
    }
  }


