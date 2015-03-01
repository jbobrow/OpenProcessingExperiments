
void setup(){
  frameRate(1);
  size(500,250);
  colorMode(HSB, 100, 100, 100);
}
color c1,c2,c3,c4;

void draw(){
  color bg = color(51,51,51);
  background(bg);
  
  for(int i=200;i>=0;i=i-200/9){
    color c = color(random(100),20,95);
    if (i==200) c1=c;
    fill(c);    
    noStroke();
    arc(width/2+100,height/2+100,i,i,PI,PI*2);
  }  
  for(int i=200;i>=0;i=i-200/9){
    color c = color(random(100),20,95);
    if (i==200) c2=c;
    fill(c);
    noStroke();
    arc(width/2,height/2,i,i,PI/2,PI/2*3);
  }
  for(int i=200;i>=0;i=i-200/9){
    color c = color(random(100),20,95);
    if (i==200) c3=c;
    fill(c);
    noStroke();
    if (i>170) arc(width/2,height/2,i,i,-PI/2,0); else arc(width/2,height/2,i,i,-PI/2,PI/2);
  }
  for(int i=200;i>=0;i=i-200/9){
    color c = color(random(100),20,95);
    if (i==200) c4=c;
    fill(c);
    noStroke();
    if (i>170) arc(width/2-100,height/2-100,i,i,PI/2,PI); else arc(width/2-100,height/2-100,i,i,0,PI);
  }
  pushMatrix();
  translate(width/2+100,height/2+100);
  halfCadre1(c1);
  popMatrix();
  
  color c= color(random(100),20,95);
  pushMatrix();
  translate(width/2,height/2+100);
  halfCadre(c);
  popMatrix();
  pushMatrix();
  translate(width/2+100,height/2);
  rotate(PI);
  halfCadre(c);
  popMatrix();
  
  c= color(random(100),20,95);
  pushMatrix();
  translate(width/2-100,height/2);
  halfCadre(c);
  popMatrix();
  pushMatrix();
  translate(width/2,height/2-100);
  rotate(PI);
  halfCadre(c);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  halfCadre1(c3);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(PI);
  halfCadre1(c2);
  popMatrix();
  
  pushMatrix();
  translate(width/2-100,height/2-100);
  rotate(PI);
  halfCadre1(c4);
  popMatrix();
  
}

void halfCadre1(color c){
  beginShape();
    noStroke();
    fill(c);
    vertex(0,0);
    vertex(0,5-100);
    vertex(100/9,5-100);
    vertex(100/9,-100/9);
    vertex(100-100/9,-100/9);
    vertex(100-100/9,0); 
  endShape();
}

void halfCadre(color c){
  beginShape();
    noStroke();
    fill(c);
    vertex(0,0);
    vertex(0,-100);
    vertex(100/9,-100);
    vertex(100/9,-100/9);
    vertex(100-100/9,-100/9);
    vertex(100-100/9,0); 
  endShape();
}

