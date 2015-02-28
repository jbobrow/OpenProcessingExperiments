
int i=0;
float a = 0;
float b = 0;
float c = 0;

void setup(){
  size(600,600, P3D);  
  noFill();
  smooth();
}


void draw(){
  translate(300,300);
  background(11);
  smooth();
  
  
  a += 0.004;
  if(a > 1080) { 
    a = 0;
  }
  
  b += 0.002;
  if(b > 360) { 
  b = 0; 
  }
  
  c += 0.006;
  if(c > 720) { 
  c = 0; 
  }

  stroke(random(13, 30), random(113, 229), random(180, 218), 100);
  strokeWeight(6);
  rotateX(a);
  ellipse(0,0,300,300);
  rotateX(a);
  ellipse(0,0,-300,300);
  rotateY(a);
  ellipse(0,0,300,300);
  rotateY(a);
  ellipse(0,0,300,-300);
  
 stroke(random(143, 172), random(5,33), random(75,91), 100);
  strokeWeight(4);
  rotateX(b);
  ellipse(0,0,300,300);
  rotateX(b);
  ellipse(0,0,-300,300);
  rotateY(b);
  ellipse(0,0,300,300);
  rotateY(b);
  ellipse(0,0,300,-300);
 
stroke(random(27,75), random(81,145), random(165,205), 100);
  strokeWeight(3);
  rotateX(c);
  ellipse(0,0,300,300);
  rotateX(c);
  ellipse(0,0,-300,300);
  rotateY(c);
  ellipse(0,0,300,300);
  rotateY(c);
  ellipse(0,0,300,-300); 
}

