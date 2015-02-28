
int i=0;
float a = 0;
float b = 0;
float c = 0;

void setup(){
  size(600,600, P3D);  
  noFill();
  smooth();
  
  noLoop();
}


void draw(){
  translate(300,300);
  background(255);
  smooth();

  
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
}

  void mousePressed(){
  noLoop();
  }

  void mouseReleased() {
  loop();
  }

