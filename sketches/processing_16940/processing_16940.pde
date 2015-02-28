

PFont f;
PFont f2;
float angulo1 = 0;
float angulo2 = 0;
float angInc;
 int a = second ();
  int b = minute ();
  int c = hour ();
String hora= nf (c,2) + ":" + nf (b,2) + ":" + nf (a,2);

int d = day(); 
int n = month(); 
int y = year(); 
String fecha = nf(d,2) + " / " + nf (n,2) + " / " + nf (y,4);

 void setup (){
  size (800,600,P3D);
   background (0);
  f = loadFont("Candara-48.vlw");
  f2 = loadFont ("Candara-22.vlw");

}
void draw() {
   background (0);
   fill (250,255,3);
    rectMode(CENTER);
  textFont(f); 
   
pushMatrix(); 
   translate(300,270); 
  rotateX(angulo2);
  //translate(340,270); 
  //rotateY(-angulo1);
   text(hora,0,0);
 popMatrix();
 noStroke();
fill (94,21,121,50);

pushMatrix(); 
textFont(f2);
fill (250,255,3);
    rectMode(CENTER);
  translate(370,340); 
  rotateY(angulo2);
 text(fecha, 0, 0);
  popMatrix();
  
 noStroke();
fill (94,21,121,50);

 pushMatrix();
  translate(380,300); 
  rotateX(angulo2);
  lights ();
  box (350); 
  popMatrix();
  
  noStroke();
 fill(44,183,156,60);
 
  pushMatrix();
  translate(380,300); 
  rotateY(angulo2);
  sphere (150); 
  popMatrix();
   
angulo1 += 0.02;
  angulo2 += 0.02;
 
 }
void mousePressed (){
//saveFrame ("111.JPG");
noLoop ();
}
void keyPressed (){
  loop ();
}


