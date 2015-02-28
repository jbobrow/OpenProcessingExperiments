
float x,y;
float v = random(3,3);
float vy = random(3,3);
 
void setup(){
size(600,600);
x= random (width);
y= random (height);
//noCursor(); 
}
 
void draw(){
  stroke(0);
  background(x,y,0);
  cap();
  bigotis();
  boca();
  ulls();
  nas();
  x = x+v;
  y = y+vy;
  limits();
} 

void cap() {
fill(10,172,198); //BLAU
ellipse(x,y,250,240); //CARABLAVA
fill(255); //BLANC
ellipse(x,y+15,225,200); //CARABLANCA
}

void bigotis(){
line(x-98,y-42,x-35,y-15); //BIGOTI SUPERIOR ESQUERRE
line(x-115,y-3,x-38,y+3); //BIGOTI MIG ESQUERRE
line(x-102,y+40,x-37,y+27); //BIGOTI INFERIOR ESQUERRE
 
line(x+102,y-42,x+38,y-15); //BIGOTI SUPERIOR DRET
line(x+110,y-3,x+40,y+3); //BIGOTI MIG DRET
line(x+106,y+40,x+39,y+23); //BIGOTI INFERIOR DRET
}
 
void boca(){ 
line(x+3,y-40,x+3,y+67); //LINIA NAS
noFill(); //ARC BUIT
arc(x+3,y+25,190,85,2*PI,3*PI); //ARC BOCA
}

void ulls(){
fill(255); //BLANC
ellipse(x-25,y-76,55,70); //ULLS 
fill(255); //BLANC
ellipse(x+30,y-76,55,70); //ULLS
fill(0); //NEGRE
ellipse(x+25,y-74,12,12); //NINETA DRETA
ellipse(x-19,y-74,12,12); //NINETA ESQUERRA
}
 
void nas(){
fill(255,0,0); //VERMELL
ellipse(x+3,y-36,35,35); //RODONA NAS VERMELLA
stroke(255); //CONTORN BLANC
fill(255);//BLANC
ellipse(x-2,y-38,11,11);//RODONA PETITA NAS
}

void mousePressed(){
  v = random(-5,5);
  vy = random(-5,5);
  x= mouseX;
  y= mouseY;
} 

void limits(){
  if (x+240/2 > width || x-240/2 < 0) {
    v = -v;
  }
  if (y+250/2 > height || y-250/2 < 0){
    vy = -vy;
  }
}
