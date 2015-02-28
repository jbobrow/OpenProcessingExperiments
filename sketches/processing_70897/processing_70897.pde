
class Plum {
  float d1,d2,d3, d4,flowerS, flowerR;
  color c1;

  Plum(float d1,  float s, float r) {
   
  d2=d1/sin(PI/5);
  d3=2.5*d1;
  d4=2*d1;
    flowerS=s;
    flowerR=r;
  c1=#B41648;  
  }

  void drawchange() {
    if (keyPressed && (key==CODED)) {
      if (keyCode==UP) {
        flowerS+=0.01;
      };
      if (keyCode==DOWN) {
        flowerS-=0.05;
      }
      if (keyCode==LEFT) {
        flowerR-=0.1;
      }
      if (keyCode==RIGHT) {
        flowerR+=0.1;
      }
    }
    
    
  if (keyPressed) {
    if (key == 'c') {
      c1=#CE6687;
    }
  }
  
   if (keyPressed) {
    if (key=='C') {
      c1=#B41648;
    }
  }


    
  }
  
  void drawflower() {
    
    translate(mouseX,mouseY);
  scale(flowerS);
  rotate(flowerR);
fill(c1);
noStroke();
ellipse(0,-d2,d3,d3);
ellipse(d2*cos(PI/2-2*PI/5),-d2*sin(PI/2-2*PI/5),d3,d3);
ellipse(d2*sin(PI/5),d2*cos(PI/5),d3,d3);
ellipse(-d2*sin(PI/5),d2*cos(PI/5),d3,d3);
ellipse(-d2*cos(PI/2-2*PI/5),-d2*sin(PI/2-2*PI/5),d3,d3);
fill(#F2D95A);
noStroke();
ellipse(0,0,d4,d4);
    
   
    
}
}

