
int i=0;
float a = 0;
float b = 0;
float c = 0;
float e = 0;

void setup(){
  size(600,600, P3D);  
  noFill();
  smooth();
  
  noLoop();
}
int w = 300;
int d = w/2;
int h = w; 

int md = 12; 
int sd = 6; 
int hh,mm;





void draw(){
  translate(300,300);
  background(255);
  smooth();
  
  
  
  int s = second();  // Values from 0 - 59
  int mm = minute();  // Values from 0 - 59
  int hh = hour();    // Values from 0 - 23
 
  strokeWeight(20); 
  point(w/2-d+(hh*d/12),h/2); 
  point(w/2,h/2); 
  strokeWeight(md); 
  float j = map(mm, 0, 60, 0, TWO_PI) - HALF_PI;  
  point(w/2 + cos(j) * (d/2-md/2), h/2 + sin(j) * (d/2-md/2));  
  strokeWeight(sd); 
  j = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;  
  point(w/2 + cos(j) * (d/2-sd/2), h/2 + sin(j) * (d/2-sd/2)); 



  
  a += 0.006;
  if(a > 360) { 
    a = 0;
  }
  
  b += 0.003;
  if(b > 360) { 
  b = 0; 
  }
  
  c += 0.009;
  if(c > 360) { 
  c = 0; 
  }
  d +=0.012;
  if(d > 360) {
  d = 0;
  }
  strokeWeight(10);
  rotateX(a);
  ellipse(0,0,300,300);
  rotateX(a);
  ellipse(0,0,-300,300);
  rotateY(a);
  ellipse(0,0,300,300);
  rotateY(a);
  ellipse(0,0,300,-300);
  
  
  strokeWeight(6);
  rotateX(b);
  ellipse(0,0,300,300);
  rotateX(b);
  ellipse(0,0,-300,300);
  rotateY(b);
  ellipse(0,0,300,300);
  rotateY(b);
  ellipse(0,0,300,-300);
  

 strokeWeight(4);
  rotateX(c);
  ellipse(0,0,300,300);
  rotateX(c);
  ellipse(0,0,-300,300);
  rotateY(c);
  ellipse(0,0,300,300);
  rotateY(c);
  ellipse(0,0,300,-300);

strokeWeight(2);
  rotateX(e);
  ellipse(0,0,300,300);
  rotateX(e);
  ellipse(0,0,-300,300);
  rotateY(e);
  ellipse(0,0,300,300);
  rotateY(e);
  ellipse(0,0,300,-300);
}

  void mousePressed(){
  noLoop();
  }

  void mouseReleased() {
  loop();
  }

