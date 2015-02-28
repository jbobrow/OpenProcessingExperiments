
// dados! (02/06/11, 2 am)

int lado = 100;
int esp = 25;
int num_dados = 2;
int x = 0;
int y = 0;
float d = 20;
float p = 10;
  
void setup() {
  size(lado*num_dados + esp*(num_dados + 1), lado + 2*esp);
  strokeWeight(4);
  smooth();
  stroke(0);
  background(200);
  noLoop();
}

void draw() {
  strokeJoin(ROUND);
  pushMatrix();
  translate(esp,esp);
  for (int i=0; i<num_dados; i++) {
    rect(0,0,lado,lado);
    translate(lado+esp,0);
  }
  popMatrix();
  translate(esp+lado/2,esp+lado/2);
  pushMatrix();
  fill(0);
  for (int i=0; i<num_dados; i++) {
    x = 1 + int(random(6));
    print(x);
    dado(x);
    translate(lado+esp,0);
  }
  fill(255);
  popMatrix();
  println(" ");
}

void mousePressed() {
  redraw();
}

void dado(int cara) {
  if (cara == 1) {
    ellipse(0,0,p,p);
  } else if ((cara == 2) || (cara == 3) || (cara == 4) || (cara == 5) || (cara == 6)) {
    ellipse(-d,d,p,p);
    ellipse(d,-d,p,p);
    if (cara == 3) {
      ellipse(0,0,p,p);
    }
    else if ((cara == 4) || (cara == 5) || (cara == 6)) {
      ellipse(d,d,p,p);
      ellipse(-d,-d,p,p);
      if (cara == 5) {
        ellipse(0,0,p,p);
      } else if (cara == 6) {
        ellipse(d,0,p,p);
        ellipse(-d,0,p,p);
      }
    }
  } 
}


