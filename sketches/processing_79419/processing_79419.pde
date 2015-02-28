
void setup() {
  size(480,120);
  background(90);
  smooth();
}

void draw() {
  cara(10,10, 255,30);
  cara(60,10,245,20);
  cara(110,10,235,10);
  cuadrado(120,0,230,15);
  cuadrado(180,10,210,10);
  cuadrado(230,-10,180,5);
}

void cara(int x, int y, color c, int sizeOjos){  
 pushMatrix();
 translate(x,y);
 noStroke();
 fill(c);
 ellipse(40,40,80,80); // cara 
 fill(0);
 ellipse(20,25,sizeOjos,sizeOjos);
 ellipse(60,25,sizeOjos,sizeOjos);
 stroke(0);
 line(20,55,60,55);
 popMatrix(); 
}

void cuadrado(int w, int z, color r, int sizeOjos2){
pushMatrix();
translate(w,z);
noStroke();
fill(r);
rect(40,40,100,50);
fill(0);
rect(55,50,sizeOjos2,sizeOjos2);
rect(110,50,sizeOjos2,sizeOjos2);
stroke(0);
line(60,80,120,80);
popMatrix();
}
