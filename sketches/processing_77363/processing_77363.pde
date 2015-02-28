
void setup(){
  size(800,800);
}

float angle=0;
float sfactor=1.0;

void draw() {
  background (255,0,255);

 /*angle=map(mouseX,0,width,0,90);*/
 
 angle=angle+0.1;
  sfactor=map(mouseY,0,height,0.98,1.5);
  
  pushMatrix();
  translate(width/2,10);
  spirale(100,40);
  
  popMatrix();
  translate(width/2,height/2);
  spirale(100,40);
  
  translate(width/2,50);
  spirale(100,40);
  
}

void spirale(int n, float s) {
 //fill(0,s+100,s+100);
 //ellipse(0,0,s,s);
 
 stroke(0,255,s,min(n*2,255));
 strokeWeight(s/10);
 triangle(0,0,10,10,s,s);
 
 //line(0,0,s,0);
 
 //rect(0,0,0,0,s,s);
 translate(s,0);
 rotate(radians(angle));
 if(n>0) spirale(n-1,s*sfactor);
}

int factoriel(int n) {
  
  if (n==0) {
    return(1);}
  
  else{
    return(n*factoriel(n-1));
  }
}

