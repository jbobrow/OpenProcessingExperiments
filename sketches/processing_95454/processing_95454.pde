
/*-------------------
Codi creat per Arnau Cuadras
Pràctica "P1.1_e"
Informàtica
Grup 4
2n GEDI
ELISAVA
-------------------*/
 
int counter;
void setup() {
  size(400,410);
  background(0,0,0);
  counter=0;
}
void draw(){
  counter++;
  strokeWeight(20);
  stroke(random(255),random(255),random(255));
  fill(0,0,0);
  if(mousePressed==true){
    ellipse(200,200,200,200);
stroke(0,0,0);
triangle(200,200,250,100,200,200);
stroke(random(255),random(255),random(255));
ellipse(200,200,150,150);
stroke(0,0,0);
triangle(210,210,260,260,210,210);
stroke(random(255),random(255),random(255));
ellipse(200,200,100,100);
stroke(0,0,0);
triangle(200,200,155,155,200,200);
fill(255);
text("life",195,205);
stroke(0,102,53);
rect(300,390,85,5);
fill(255);
text("ACC P1.1_E",300,397);
  }
}
