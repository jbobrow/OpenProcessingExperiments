

int i=0;
int j=0;
int horizonte;
float minimo = 10;
int anchoLin;
int anchoMon;
int altoMon;
int monColor;
int variaColor;
float ramp;
void setup() {
  size(800, 400);
  colorMode(HSB);
  background(100, 20, 50);

  horizonte=0;
  monColor = int(random(255));
}


void draw() {
  
  while (horizonte>height);
   {
   i=0;
   ramp=random(.5);
   variaColor=int(random(255));
   while (i < width) {
   noStroke();
   fill(monColor+variaColor*ramp, int(i*ramp), int(map(horizonte, 0, height, 10, random(200, 400))));
   
   anchoMon=int(random(minimo, width)/10);
   altoMon=int(random(minimo, height)/10);
   triangle(i, horizonte, i+anchoMon, horizonte, i+anchoMon-anchoMon/2, horizonte-altoMon);
   i=i+anchoMon;
   }
   variaColor++;
   horizonte ++;
   }
   if (horizonte>height){
  horizonte=0;
  monColor = int(random(255));
 /* 
 for (int k = 0; k < 3; k = k+1) {
  fill(monColor+variaColor*ramp, k, int(map(horizonte, 0, height, 10, random(200, 400))));
  
 // noFill();
j=0;
  beginShape();
  vertex(j+int(anchoLin*random(-1, 1)), int(random(0, height/2)));
  while (j<width)
  {
    anchoLin=int(random(minimo, width)/10);
    j=j+anchoLin;
    vertex(j+int(anchoLin*random(-1, 1)), int(random(height*0.4, height*0.6)));
    //curveVertex(j+anchoLin, int(random(0, height)));
    //curveVertex(j, int(random(0, height)));
  }
  vertex(j+int(anchoLin*random(-1, 1)), int(random(height*0.3, height*0.6)));
  endShape();
 }
*/
}
}

