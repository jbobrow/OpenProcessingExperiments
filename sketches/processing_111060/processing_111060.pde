
size (800,800);

strokeWeight(2);
colorMode(HSB, 360, 100, 100);
int sides= 6;
int r= 30;
int xc= 0;
int yc= 0;
stroke(255, 90);
background(#89AABC);

//   float rm= random (30, 53);
   fill(#FFBE0A);
   
   for (int transX=0; transX<width+50; transX= transX+90){
   for (int transY=0; transY<height+50; transY= transY+45){

        pushMatrix();
          if (transY%2==0) {
        translate(transX, transY);
          } else {
        translate(transX+45,transY+20);
          }
            beginShape();
            for(int i=0; i<sides; i++) {
               vertex(xc + r*cos(i*TWO_PI/sides), yc + r*sin(i*TWO_PI/sides));
            }
            endShape(CLOSE);
        popMatrix();
   }
   }
   
//transY-=9)


