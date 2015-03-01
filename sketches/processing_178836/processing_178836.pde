

float easing = 0.05;
float Radius = 80;
float miniRadius = 25;
float a1,a2,b1,b2,c1,c2,d1,d2,e1,e2,f1,f2,g1,g2,h1,h2;
float LimitN = 150;
float LimitNE = 100;
float LimitE = 150;
float LimitSE = 100;
float LimitS = 150;
float LimitSW = 100;
float LimitW = 150;
float LimitNW = 100;
float redA,greenA,blueA;
float redB,greenB,blueB;
float redC,greenC, blueC;
float redD,greenD,blueD;
float redE,greenE,blueE;
float redF,greenF,blueF;
float redG,greenG,blueG;
float redH,greenH,blueH;

void setup(){
  size(400,400);
  background(255);
  ellipseMode(RADIUS);
}
  
 void draw(){
   
   background(255);
   
float startPX = width/2; //Start Point X 
float startPY = height/2; //Start Point Y
float between = dist(mouseX,mouseY,startPX,startPY);
   
line(0,height/2,width,height/2); // x
line(width/2,0,width/2,height); // y
   
   
   
   
   ellipse(a1,a2,miniRadius,miniRadius);
   ellipse(b1,b2,miniRadius,miniRadius);
   ellipse(c1,c2,miniRadius,miniRadius);
   ellipse(d1,d2,miniRadius,miniRadius);
   ellipse(e1,e2,miniRadius,miniRadius);
   ellipse(f1,f2,miniRadius,miniRadius);
   ellipse(g1,g2,miniRadius,miniRadius);
   ellipse(h1,h2,miniRadius,miniRadius);
      

   
   
//Hover Movement

if (between < Radius+70) {
 a1 = a1 + 4;
 a2 = a2 + 4;
 b1 = b1 - 4;
 b2 = b2 - 4;
 c1 = c1 - 4;
 d1 = d1 - 4;
 d2 = d2 + 4;
 e1 = e1  + 4;
 e2 = e2  - 4;
 f1 = f1  + 4;
 g2 = g2 - 4;
 h2 = h2 + 4;

 
}
 
 else {
   
   a1 = startPX;
   a2 = startPY;
   b1 = startPX;
   b2 = startPY;
   c1 = startPX;
   c2 = startPY; 
   d1 = startPX;
   d2 = startPY; 
   e1 = startPX;
   e2 = startPY;
   f1 = startPX;
   f2 = startPY;
   g1 = startPX;
   g2 = startPY;
   h1 = startPX;
   h2 = startPY;
 
   
 } 
 
 // a Limiter

if (a1 > (startPX+LimitSE)){
a1 = startPX+LimitSE;
a2 = startPY+LimitSE;
   }
   
   // b Limiter 
if  (b1 < (startPX-LimitNW)){
b1 = startPX-LimitNW;
b2 = startPY-LimitNW;
}

   // c Limiter 
if  (c1 < (startPX-LimitW)){
c1 = startPX-LimitW;
c2 = startPY;
}

// d Limiter 
if  (d1 < (startPX-LimitSW)){
d1 = startPX-LimitSW;
d2 = startPY +LimitSW;
}

// e Limiter 
if  (e1 >= (startPX+LimitNE)){
e1 = startPX+LimitNE;
e2 = startPY - LimitNE;
}
  // f Limiter 
if  (f1 >(startPX+LimitE)){
f1 = startPX+LimitE;
f2 = startPY;
}
   // g Limiter 
if  (g2 <(startPY-LimitN)){
g1 = startPX;
g2 = startPY-LimitN;
}

   // h Limiter 
if  (h2 >(startPY+LimitS)){
h1 = startPX;
h2 = startPY+LimitS;
}


noFill();
beginShape();
vertex(a1, a2);
vertex(h1, h2);
vertex(d1, d2);
vertex(c1, c2);
vertex(b1, b2);
vertex(g1, g2);
vertex(e1, e2);
vertex(f1, f2);
vertex(a1, a2);
endShape(CLOSE);

 }



