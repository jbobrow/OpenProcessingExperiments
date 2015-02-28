
void setup(){
size(800,400,P3D);
};

void draw(){
background(0,0,0);
stroke(0);
lights();
int fc=frameCount;
int przesX=width/2;
int przesY=height/2;
pushMatrix();
translate(przesX,przesY);
rotateX(fc*PI/100);
rotateY(fc*PI/100);
rotateZ(fc*PI/100);
fill(255,0,0);
box(100,100,100);
popMatrix();
pushMatrix();			//określenie UW_1
translate(przesX,przesY);
rotateY(fc*PI/100);
pushMatrix();		//określenie UW_2,zagnieżdżenie 1
 translate(150,0);
 rotateX(fc*PI/100);
 rotateY(fc*PI/100);
 fill(0,255,0);
 box(50,50,50);
 rotateY(fc*PI/60);
 pushMatrix();		//określenie UW_3, zagnieżdżenie 2
  translate(70,0);
  rotateX(fc*PI/30);
  rotateY(fc*PI/30);
  rotateZ(fc*PI/30);
  fill(0,0,255);
  box(20,20,20);
 popMatrix();		//koniec zagnieżdżenia 2
popMatrix();		//koniec zagnieżdżenia 1
popMatrix();
};

