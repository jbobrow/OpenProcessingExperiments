
int a;
int b;


void setup(){
  size(400,400);
  a=width;
  b=height;
  noCursor();
}


void draw(){
  background(216,15,22);
  a = mouseX*2;
  b = mouseY*2;
  fill(255); //ojos
  stroke(0);
  strokeWeight(7);
  ellipse(a/2-50,b/2-15,100,100);
  ellipse(a/2+50,b/2-15,100,100);
  fill(0);  //pupilas
  ellipse(a/2-40,b/2-15,20,20);
  ellipse(a/2+30,b/2-15,20,20);
  fill(0);  //cejas
  quad(a/2-120,b/2-70,a/2,b/2-30,a/2,b/2-50,a/2-105,b/2-110);
  quad(a/2+120,b/2-60,a/2,b/2-30,a/2,b/2-50,a/2+105,b/2-90);
  
  strokeWeight(5);  //boca
  fill(255,196,0);
  triangle(a/2-80,b/2+60,a/2,b/2,a/2+100,b/2+80);
  fill(234,173,40);
  triangle(a/2-75,b/2+63,a/2,b/2+120,a/2+80,b/2+80);

 
}



