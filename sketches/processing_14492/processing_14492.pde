
void setup() {
size(300,300);
//background
background(#00BFFF);
}
 
void draw() {
  background(#00BFFF);
  for(int x=0; x<300; x=x+20){
   for(int y=0; y<300; y=y+20){
     pushMatrix();
     translate(x+x,y+y);
     scale(0.2);
     rotate(sin(frameCount/2));
     sujin_draw();
     popMatrix();
     
   }
  }
 }
  
void sujin_draw() {
stroke(0);
int[] x={10,20,30,40,50,60,70,80,90,100};
int[] y={110,120,130,140,150,160,170,180,190,200};
int[] z={15,55,115,145};
//ear
fill(#8B4513);
ellipse(x[4],x[4],40,40);
ellipse(y[4],x[4],40,40);
fill(#D2B48C);
ellipse(z[1],z[1],20,20);
ellipse(z[3],z[1],20,20);
//face
fill(#8B4513);
ellipse(x[9],x[9],140,120);
//eye
fill(0);
ellipse(x[9]-40,x[8],5,5);
ellipse(x[9]+40,x[8],5,5);
//nose
fill(#D2B48C);
ellipse(x[9],y[1],50,50);
beginShape();
vertex(x[8],y[2]);
vertex(x[9],z[2]);
vertex(y[0],y[2]);
endShape();
fill(0);
ellipse(x[9],y[0],x[1],z[0]);
//cheek
fill(#FF4500);
ellipse(x[9]+50,y[0],20,5);
ellipse(x[9]-50,y[0],20,5);
}

