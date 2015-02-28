
int n;
int MAX = 20;
int[] x;
int[] y;
float[] X;
float[] Y;

boolean closed;
int xOffset, yOffset;
boolean drag;
int active;

void setup()
{
  size(640, 480);
  x = new int[MAX];
  y = new int[MAX];
  X = new float[MAX];
  Y = new float[MAX];
  closed = false;
  drag = false;
  reset = true;
  n = 0;
}

void draw(){
  background(255);
  stroke(0);

  
  beginShape();
  for (int i = 0; i < n; i++) {
     vertex(x[i], y[i]);
  }
  if (closed) {
    fill(192, 192, 224, 128);
    endShape(CLOSE);
  } else {
    noFill();
    endShape();
  }
  
  if (closed) {
    fill(255, 225, 128, 128);
    beginShape();
    for (int i = 0; i < n; i++) {
      vertex(X[i], Y[i]);
    }
    endShape(CLOSE);
  }
  
  int mX = mouseX;
  int mY = mouseY;
  for (int i = 0; i < n; i++) {
    if ((i == 0 && !closed) || max(abs(x[i]-mX), abs(y[i]-mY)) < 7) {
     fill(255,0,0);
    } else {
     fill(0,0,255);
    } 
    ellipse(x[i], y[i], 7, 7);
  }
  
  textSize(24);
  fill(128);
  text("Fourier Transform of a Polygon", 40, 40); 
}

void mousePressed(){
  active = -1;

  if (closed) {
    
    for (int i = 0; i < n; i++) {
      int dx = abs(x[i] - mouseX);
      int dy = abs(y[i] - mouseY);
      if (dx < 7 && dy < 7) {
        active = i;
        break;
      }
    }

    if (active > -1) {
      drag = true;
      xOffset = mouseX - x[active];
      yOffset = mouseY - y[active];
    }

  } else {
    if ((n > 0) && (abs(x[0] - mouseX) < 7) && (abs(y[0] - mouseY) < 7)) {
      closed = true;
    } else {
      x[n] = mouseX;
      y[n] = mouseY;
      n += 1;
      if (n == MAX) {
        closed = true;
      }
    }
  }
}

void mouseDragged(){
  if (drag) {
    x[active] = mouseX - xOffset;
    y[active] = mouseY - yOffset;
  }
  if (closed) {
    for (int j = 0; j < n; j++) {
      X[j] = 0;
      Y[j] = 0;
      for (int k = 0; k < n; k++) {
        float xx = x[k] - width/2;
        float yy = y[k] - height/2;
        X[j] += xx*cos(2*PI*j*k/n) - yy*sin(2*PI*j*k/n);
        Y[j] += xx*sin(2*PI*j*k/n) + yy*cos(2*PI*j*k/n);
      }
      X[j] = X[j]/sqrt(n) + width/2;
      Y[j] = Y[j]/sqrt(n) + height/2;
    }
  }
}

void mouseReleased(){
  if (drag) {
    drag = false;
  }

}
    
void keyPressed(){
  if (key == 114 || key == 82) {
    setup();
  }
}
    
    
  
