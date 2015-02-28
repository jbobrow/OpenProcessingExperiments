
int i=0;
float a = 0;
float b = 0;
float c = 0;
 
void setup(){
  size(900,900, P3D); 
  noFill();
  smooth();
   
  noLoop();
}
 
 
void draw(){
  
  translate(500,500);
  background(250);
  smooth();
 
   
  a += 0.006;
  if(a > 360) {
    a = 0;
  }
   
  b += 0.003;
  if(b > 180) {
  b = 0;
  }
   
  c += 0.009;
  if(c > 360) {
  c = 0;
  
 
  }
 
  strokeWeight(1);
  rotateX(a);
  ellipse(0,0,300,300);
  rotateX(a);
  ellipse(0,0,-300,300);
  rotateY(a);
  ellipse(0,0,300,300);
  rotateY(a);
  ellipse(0,0,300,-300);
  
  strokeWeight(1);
  rotateX(a);
  ellipse(0,0,300,300);
  rotateX(a);
  ellipse(0,0,-300,300);
  rotateY(a);
  ellipse(0,0,300,300);
  rotateY(a);
  ellipse(0,0,300,-300);
   
  strokeWeight(1);
  rotateX(b);
  ellipse(0,0,300,300);
  rotateX(b);
  ellipse(0,0,-300,300);
  rotateY(b);
  ellipse(0,0,300,300);
  rotateY(b);
  ellipse(0,0,300,-300);
  
       strokeWeight(2);
  rotateX(a);
  ellipse(0,0,900,900);
  rotateX(a);
  ellipse(0,0,-900,900);
  rotateY(a);
  ellipse(0,0,900,900);
  rotateY(a);
  ellipse(0,0,900,-900);
  
  strokeWeight(1);
  rotateX(a);
  ellipse(0,0,900,900);
  rotateX(a);
  ellipse(0,0,-900,900);
  rotateY(a);
  ellipse(0,0,900,900);
  rotateY(a);
  ellipse(0,0,900,-900);
   
  strokeWeight(3);
  rotateX(b);
  ellipse(0,0,900,900);
  rotateX(b);
  ellipse(0,0,-900,900);
  rotateY(b);
  ellipse(0,0,900,900);
  rotateY(b);
  ellipse(0,0,900,-900);
   
     strokeWeight(2);
  rotateX(a);
  ellipse(0,0,100,100);
  rotateX(a);
  ellipse(0,0,-100,100);
  rotateY(a);
  ellipse(0,0,100,100);
  rotateY(a);
  ellipse(0,0,100,-100);
  
  strokeWeight(2);
  rotateX(a);
  ellipse(0,0,100,100);
  rotateX(a);
  ellipse(0,0,-100,100);
  rotateY(a);
  ellipse(0,0,100,100);
  rotateY(a);
  ellipse(0,0,100,-100);
   
  strokeWeight(2);
  rotateX(b);
  ellipse(0,0,100,100);
  rotateX(b);
  ellipse(0,0,-100,100);
  rotateY(b);
  ellipse(0,0,100,100);
  rotateY(b);
  ellipse(0,0,100,-100);
 
 strokeWeight(1);
  rotateX(c);
  ellipse(0,0,300,300);
  rotateX(c);
  ellipse(0,0,-300,300);
  rotateY(c);
  ellipse(0,0,300,300);
  rotateY(c);
  ellipse(0,0,300,-300);
  
  strokeWeight(4);
  rotateX(a);
  ellipse(0,0,600,600);
  rotateX(a);
  ellipse(0,0,-600,600);
  rotateY(a);
  ellipse(0,0,600,600);
  rotateY(a);
  ellipse(0,0,600,-600);
  
  strokeWeight(5);
  rotateX(b);
  ellipse(0,0,600,600);
  rotateX(b);
  ellipse(0,0,-600,600);
  rotateY(b);
  ellipse(0,0,600,600);
  rotateY(b);
  ellipse(0,0,600,-600);
  
  strokeWeight(6);
  rotateX(a);
  ellipse(0,0,600,600);
  rotateX(a);
  ellipse(0,0,-600,600);
  rotateY(a);
  ellipse(0,0,600,600);
  rotateY(a);
  ellipse(0,0,600,-600);
  
}

 
  void mousePressed(){
  noLoop();
  }
 
  void mouseReleased() {
  loop();
  }



