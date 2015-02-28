

void setup() {
  size(300,300);
}

void draw() {
  background(#A767A7);
  for(float y=0; y<300; y=y+45){
   for( float x=0; x<300; x=x+45){
     pushMatrix();
     translate(x,y);
     rotate(radians(frameCount*4));
     scale(0.2);
     ran_draw();
     popMatrix();
  }
 }
}


int[] a={10,15,20,25,30,35,40,43,45,47,50,54};
int[] b={55,60,65,70,73,78,80,85,90,95,100,105};
int[] c={110,115,120,125,130,135,140,145,150,
           155,160};
void ran_draw() {
  

 


//face
fill(#000000);
strokeWeight(2);
stroke(0);
ellipse(b[10],c[2],b[10],b[11]);

fill(#ffffff);
strokeWeight(1);
stroke(255,255,255);
ellipse(b[7],c[1],a[10],b[5]);

fill(#ffffff);
strokeWeight(1);
stroke(255,255,255);
ellipse(c[1],c[1],a[10],b[5]);

fill(#ffffff);
strokeWeight(1);
stroke(255,255,255);
ellipse(b[10],c[8],b[6],a[8]);


//ear
fill(#000000);
strokeWeight(2);
stroke(0);
ellipse(a[10],b[1],b[1],b[1]);

//ear 2
fill(#000000);
strokeWeight(2);
stroke(0);
ellipse(c[8],b[1],b[1],b[1]);

//ribbon
fill(#E60012);
beginShape();
vertex(c[2],b[0]);
vertex(107,b[3]);
vertex(c[4],b[5]);
endShape();

fill(#E60012);
beginShape();
vertex(c[4],b[5]);
vertex(136,b[10]);
vertex(c[8],89);
endShape();

//eye
fill(#000000);
strokeWeight(2);
stroke(0);
ellipse(b[7],c[1],a[1],a[4]);

//eye 2
fill(#000000);
strokeWeight(2);
stroke(0);
ellipse(c[1],c[1],a[1],a[4]);

//nose
fill(#000000);
strokeWeight(1);
stroke(0);
ellipse(b[10],c[7],a[5],13);

fill(#ffffff);
strokeWeight(1);
stroke(0);
ellipse(b[10],c[7],a[3],8);
}
