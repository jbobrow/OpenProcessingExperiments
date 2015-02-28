
void setup() {  //setup function called initially, only once
  size(300, 300);
  background(204);
  smooth();
  fill(0);
  line(100,0,100,300);
  line(200,0,200,300);
  line(0,100,300,100);
  line(0,200,300,200);
  noLoop();
}

void draw() {
  for (int fVert=0; fVert<3; fVert++) {
      for (int fHorizont=0; fHorizont<3; fHorizont++) {
          int x=int(random(20,80))+fHorizont*100;
          int y=int(random(10,90))+fVert*100;
          int g=int(random(10,30));
          face(x,y,g,fVert,fHorizont);
          //println(" " + x + " " + y + " " + g + " fVert= " + fVert + " fHorizont= " + fHorizont);
      }
  }  
}

void face(int x, int y, int gap, int fv, int fh) {
line (x,fv*100,x,y);
line(x,y,x+gap,y);
line(x+gap,y,x+gap,(fv+1)*100);
int mouthY=(fv+1)*100-((fv+1)*100-y)/2;
line(x,mouthY,x+gap, mouthY);
//noStroke();
ellipse(x-gap/2,(y-fv*100)/2+fv*100,5,5);
ellipse(x+gap/2,(y-fv*100)/2+fv*100,5,5);
}
