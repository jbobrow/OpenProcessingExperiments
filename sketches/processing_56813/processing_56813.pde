
import processing.opengl.*;
int k = 1;
float t = 0;
int N = 6, r;
//float[] V = new float[N];

void setup() {
  size(700, 700, P2D); 
  smooth();
  background(0);
  r = 2*width;
}

void draw() {

  fill(0, 10);
  rect(0, 0, width, height);  
  translate(width/2, height/2);

  noFill();
  //  ellipse(0, 0, 2*r, 2*r);

  stroke(255);

  float[] V = new float[N];

  //  rotate(radians(5*t));

  for ( int i = 0; i < N; i++) {    
    float ang = i*(2*PI/float(N));
    //    ellipse(r*sin(t)*cos(ang), r*sin(t)*sin(ang),50,50);  
    V[i]=k*sin(radians(t))*ang;
  }

  for ( int j = 20; j > 1; j -= 1) {
    stroke(255, 5*j);
    beginShape();
    for ( int i = 0; i < N; i++) {
      vertex(r/j*cos(V[i]), r/j*sin(V[i]));
    }
    endShape(CLOSE);
    
    beginShape();
    for ( int i = 0; i < N; i++) {
      vertex(-r/j*cos(V[i]), r/j*sin(V[i]));
    }
    endShape(CLOSE);
    
    
    beginShape();
    for ( int i = 0; i < N; i++) {
      vertex(-r/j*sin(V[i]), -r/j*cos(V[i]));
    }
    endShape(CLOSE);
    
    beginShape();
    for ( int i = 0; i < N; i++) {
      vertex(r/j*sin(V[i]), -r/j*cos(V[i]));
    }
    endShape(CLOSE);   
  }
  
    if (mousePressed == true) {
//    save("capturas/img"+frameCount+".png");
    background(0);
    k += 1;
    t = 0;
  }



  t += 0.1;
}


