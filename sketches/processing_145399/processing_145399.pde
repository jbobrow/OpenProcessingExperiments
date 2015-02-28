
/* @pjs pauseOnBlur=true; */

/* ... We have [line_amt] moving lines.
 Each MovingLine has [var_amt] different variables.
 Each variable has a current value [curr], which is
 a value between [from] and [to].
 [t] indicates how far are we between [from] and [to].
 [delta] indicates how much [curr] has changed since the last frame.
 It's used to calculate the angle using atan2.
 Each variable spends time at [curr]. At random times, it decides to change.
 Then it sets a random target [to], an sets [t] to 1 
 and starts counting down to 0 while transitioning between [from] and [to].
*/


int line_amt = 10;
int lookup_length = 200;
PGraphics g;
float[] sine = new float[lookup_length];
float[] ease = new float[lookup_length];
MovingLine[] lineas = new MovingLine[line_amt];

void setup() {
  size(600, 300);
  colorMode(HSB, 1);
  rectMode(CENTER);
  noSmooth();

  drawGradient();

  /* Create moving lines */
  
  for (int i=0; i<line_amt; i++) {
    lineas[i] = new MovingLine();
  }

  /* Create lookup tables */
  
  for (int i=0; i<lookup_length; i++) {
    float n = float(i) / float(lookup_length-1);
    
    sine[i] = sqrt(1 - pow(n, 2));   
    ease[i] = (n /= 0.5) < 1 ? 0.5 * pow(n, 2.0) : -0.5 * ((n -= 2)*n - 2);
  }
}
void drawGradient() {
  for (int y=0; y<height; y++) {
    stroke(0.1, 0.2, map(y, 0, height, 0.35, 0.15));
    line(0, y, width, y);
    noStroke();
  }
}
void draw() {
  for (int i=0; i<line_amt; i++) {
    lineas[i].update();
  }
  loadPixels();
  for(int x=1; x<width; x++) {
    for(int y=0; y<height; y++) {
      pixels[x+y*width-1] = pixels[x+y*width];
    }
  }
  updatePixels();
}

class MovingLine {
  int var_amt = 7;
  int maxh = 50;
  
  float pHeight;
  color pColor;
  PMatrix pMatrix;

  float[] from = new float[var_amt];
  float[] to = new float[var_amt];
  float[] curr = new float[var_amt];  /* equal to "from" if not transitioning */
  float[] t = new float[var_amt];     /* transition time 0..1 */
  float[] delta = new float[var_amt]; /* variable delta */

  /* 0 = height, 5,1 = x,y, 2,3,4 = hsb, 6 = alpha */

  MovingLine() {
    for (int varn=0; varn<var_amt; varn++) {
      curr[varn] = from[varn] = to[varn] = random(1);
      t[varn] = 0;
    }
    curr[6] = from[6] = to[6] = 0;
    delta[6] = random(0.1, 0.8); 
  }

  void update() {
    for (int varn=0; varn<var_amt; varn++) {
      if (t[varn] > 0) {
        t[varn] -= 0.01;
        if (t[varn] > 0) {
          float n = 1-t[varn];
          delta[varn] = curr[varn];
          curr[varn] = lerp(from[varn], to[varn], ease[int(n*lookup_length)]);
          delta[varn] -= curr[varn];
        } 
        else {
          from[varn] = curr[varn];
        }
      } 
      else {
        if (random(1000) > 997) {
          to[varn] = random(1);
          t[varn] = 1;
        }
      }
    }

    pHeight = map(curr[0], 0, 1, 5, maxh);
    pColor = color(0.1*curr[2], curr[3], 0.2+0.8*curr[4], curr[6]);

    translate(width - 150 + (149-maxh/2) * curr[5], height * 0.1 + height * curr[1] * 0.8);
    rotate(atan2(height * delta[1] * 0.9, delta[5]-1));

    fill(pColor);
    rect(0, 0, 1, pHeight);

    /* highlight */
    
    fill(1, 0.3 * curr[6]);
    rect(0, pHeight/2, 1, 1);

    /* shadow */
    
    fill(0, 0.3 * curr[6]);
    rect(0, -pHeight/2, 1, 1);

    resetMatrix();
  }
}




