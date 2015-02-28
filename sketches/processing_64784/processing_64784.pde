


int e_w = 20;
int e_h = 80;
int num;

int[] x = new int[400/e_h];
int[] y = new int[400/e_h];

int m_x;
int m_y;

float theta;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  num = width / e_h;

  for (int i = 0; i<num;i++) {
    for (int j = 0; j<num;j++) {
      x[i] = i*e_h;
      y[j] = j*e_h;      
    }
  }
  
}

void draw() {
  noStroke();
  fill(360, 70);
  rect(0, 0, width, height);

  m_x = (mouseX / e_h) * e_h;
  m_y = (mouseY / e_h) * e_h;



  for (int i = 0; i<num;i++) {
    for (int j = 0; j<num;j++) {
      fill((j+i)*35,80,100);
      pushMatrix();
      translate(x[i]+e_h/2, y[j]+e_h/2);
      if (m_x == x[i] && m_y == y[j]) {
        rotate(theta);
      }
      ellipse(0, 0, e_w, e_h);
      ellipse(0, 0, e_h, e_w);
      rotate(radians(45));
      ellipse(0, 0, e_w, e_h);
      ellipse(0, 0, e_h, e_w);

      popMatrix();
    }
  }
  theta+=0.05;
}

