
/*  
Jeff Hendrickson - May 2010
http://laughingravenstudio.com
Bezier Vertexes can work two ways -
bezierVertex(cx1, cy1, cx2, cy2, x, y);    2D
bezierVertex(cx1, cy1, cz1, cx2, cy2, cz2, x, y, z);    3D

The push/pop matrixes segregate each shape so that they can be placed
precisely on the canvas.  Changing the tan, cos, and sin values between the
X, Y, and Z creates very different patterns.

*/
void setup() {
size(900,600,P3D);
background(28,15,5);
}

float vx = width/2;
float vy = height/2;
float vz = 10;
float cx1 = 10;
float cy1 = 12;
float cz1 = 10;
float cx2 = 15;
float cy2 = 10;
float cz2 = 10;
//float x = 10;
//float y = 40;
//float z = 0.6;
float a = 0.04;
int timeLimit = 60;

void draw() {

pushMatrix();  //blue
beginShape();
smooth();
translate(width/2, height/2);
fill(random(0,40), random(100,200), random(180,250), 20);
noStroke();
vertex(vx, vy, vz);  //  x,  y, and z coordinates of anchor point
bezierVertex(cx1*a, cy1*2, cz1*a, cx2*a, cy2*2, cz2*a, vx, vy*a, vz);

  rotateY(cos(a));
  rotateX(sin(a));
  rotateZ(tan(a/2));

endShape();
popMatrix();

pushMatrix();  //green
beginShape();
smooth();
translate((width/2)-150, height/2);
fill(random(150,171), random(200,221), random(72,82), 30);
noStroke();
vertex(vx, vy, vz);  //  x and y coordinates of anchor point
bezierVertex(cx1*a*2, cy1*2, cz1*a*2, cx2*a*2, cy2*a*2, cz2*a, vx*2, vy, vz*a*2);

  rotateY(sin(a));
  rotateX(cos(a));
  rotateZ(tan(a/2));
  
endShape();
popMatrix();

pushMatrix();  //white
beginShape();
smooth();
translate((width/2)+150, height/2);
fill(255,255,255, 30);
noStroke();
vertex(vx, vy, vz);  //  x and y coordinates of anchor point
bezierVertex(cx1*a*2, cy1*a, cz1*a, cx2*a*2, cy2*a, cz2*a, vx*a*2, vy, vz*2);

  rotateY(cos(a));
  rotateX(cos(a));
  rotateZ(tan(a/2));
  
endShape();
popMatrix();


    a+= 0.003;
    cx1+= 0.03;
    cy1+= 0.03;
    cx2+= 0.07;
    cy2+= 0.06;
    vx+= 0.03;
    vy+= 0.05;
    
    if (cx1>10) {
      cx1=1;
    }
        if (cy1>12) {
      cy1=2;
    }
        if (cz1>10) {
          cz1=5;
        }
        if (cx2>15) {
      cx2=10;
    }
        if (cy2>10) {
      cy2=3;
    }
    if (cz2>10) {
          cz2=4;
        }
        
        //change this to get longer or shorter times
if (millis() >= timeLimit*1000) {
        noLoop();
      }
}
      //this will save a snapshot to the folder
void mousePressed()  {
  save("bezierVertexTestV3-400.png");
}




