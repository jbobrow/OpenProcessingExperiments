
Wavy test;

void setup(){
  size(300, 200);
  test = new Wavy();
}


void draw(){
  test.update();
  test.visualize();
}
class Emitter{
  
  color B;
  float A, X, Y, VX, VY, L;
  int T, C, I;
  
  Emitter(){
    X = random(width);
    Y = random(height);
    VX = random(-5, 5);
    VY = random(-5, 5);
    B = color(random(250), random(250), random(250));
    A = random(20,70);
    T = int(random(20,80));
    L = 1/(1.0/T);
    I = 1;
    if(random(1) > .5){
      I = -1;
    }
  }
  
  float[][][] applyTo(float[][][] pix){
    X += VX;  Y +=VY;
    if(X < 0  ||  X > width){
      VX *= -1;
    }
    if(Y < 0  ||  Y > height){
      VY *= -1;
    }
    C += I;
    for(float t = 0; t < 2*PI; t += .005){
      float c = cos(t);
      float s = sin(t);
      for(float p = 0; p < T; p += T/40.0){
        float a = A*cos( 2*PI*((p + C)%T)/T );
        float r = L*p/T;
        while(inBounds(X + c*r, Y + s*r)){
          pix[int(X + c*r)][int(Y + s*r)][0] += a*red(B)/250;
          pix[int(X + c*r)][int(Y + s*r)][1] += a*green(B)/250;
          pix[int(X + c*r)][int(Y + s*r)][2] += a*blue(B)/250;
          r += L;
        }
      }
    }
    return pix;
  }
}
class Wavy{
  
  float[][][] amps;
  ArrayList <Emitter> emits;
  
  Wavy(){
    loadPixels();
    amps = new float[width][height][3];
    emits = new ArrayList();
    for(int i = 0; i < 5; i++){
          emits.add( new Emitter() );

    }
  }

  void update(){
    for(int x = 0; x < width; x++){
      for(int y = 0; y < height; y++){
        amps[x][y][0] *= .7;
        amps[x][y][1] *= .7;
        amps[x][y][2] *= .7;
      }
    }
    for(Emitter emit : emits){
      amps = emit.applyTo(amps);
    }
  }
  
  void visualize(){
    for(int x = 0; x < width; x++){
      for(int y = 0; y < height; y++){
        pixels[x + y*width] = color(amps[x][y][0],
                                    amps[x][y][1],
                                    amps[x][y][2]);
      }
    }
    updatePixels();
  }
}
boolean inBounds(float x, float y){
  if( x > 0  &&  x < width  &&  y > 0  &&  y < height){
    return true;
  }
  return false;
}


