
//PRÀCTICA FINAL RELLOTGE - VIDEOJOCS UPF 2015


float x,y,vx,vy;
int mida=50;
PImage foto;
int mida2=60;
int mida3=70;
int mida4=50;
int mida5=50;



void setup () {

size (700,500);
x= width/2;
y= height/2;
vx=3;
vy=3;
foto= loadImage ("gespa.jpg");

}

void draw() {
  
  background(0);
  image (foto,0,0);
  smooth();
  porteries();
  MigdelCamp();
  limitsCamp();
  dibuixa();
  mou();
  comprobarLimits();
 canviColorFons ();
 temps();
 jugador();
 temps2();
}

void porteries() {
  
  strokeWeight(6);
  noFill();
  stroke(255);
  quad (0,175,0,325,40,325,40,175);
  quad (width,175,width,325,(width-40),325,(width-40),175);
  
}

void MigdelCamp(){
  
  stroke(255);
  line(width/2,0,width/2,height);
  noFill();
  ellipse(width/2,height/2,mida2*2,mida2*2);
  
}

void limitsCamp(){
  strokeWeight(7);
  stroke(0);
  quad(0,0,width,0,width,height,0,height);
  
}
  
void dibuixa () {
  
  strokeWeight (3);
  stroke(0);
  fill(random(0,255), random(0,255), random(0,255), random(150,255));
  
      if(keyPressed) {
        fill(255, 0, 0, 200);
    } 
  
  ellipse (x,y,mida,mida);
  
}

void mou(){
  
  if (x>=width-(mida/2)||x<=0+(mida/2)){
    vx=-vx;
  }
  if (y>=height-(mida/2)||y<=0+(mida/2)){
    vy=-vy;
  }

}

void comprobarLimits(){
  
  x=x+vx;
  y=y+vy;

}

void canviColorFons() {

  if (x>=width-(mida/2)) {
    background(255,0,0,100);
  }
  if (x<=0+(mida/2)) {
    background(10,3,255,100);
  }
  if (y>=height-(mida/2)) {
    background(246,255,0,200);
  }
  if (y<=0+(mida/2)) {
    background(3,255,17,200);
  }
  if (y<=0+(mida/2)) {
    textSize (100);
    strokeWeight (5);
    fill(255,0,0);
    text ("Futbol!", width/3, height/3);
  
  }
 
 }

void temps(){
  
  mida= second();
  //ellipse (x,y,mida2,mida2);
  
}

void temps2() {
  
  fill(255);
  strokeWeight(4);
  stroke(0);
  textSize (60);
     
   if (minute()<45){
     text(minute(),50,height-50);
   }else if (minute()>=45){
     text("DESCANS",50, height-50);
   }
  
  mida4=hour();
  ellipseMode (CENTER); 
  fill(255,0,0);
  noFill();
  ellipse (mida4+600, mida4+50, mida4-40, mida4-40);
  textSize(30);
  stroke (0);
  text("TIC-TAC", 560,50);
   
      }
   
   
void jugador () {
 
  fill(0,53,225);
  ellipse (mida3+60,mida3+65, mida3-40, mida3-40);
  line (mida3+60,mida3+83,mida3+60,mida3+140);
  line (mida3+60, mida3+110, mida3+5, mida3+60);
  line (mida3+60, mida3+110, mida3+115, mida3+60);
  line (mida3+60, mida3+140, mida3+110, mida3+160);
  line (mida3+60, mida3+140, mida3+15, mida3+160);
  ellipseMode (CENTER);
  ellipse (mida3+130, mida3+140, mida3-50, mida3-50);
  line(mida3+110, mida3+160, mida3+120, mida3+150);
  line(mida3+15,mida3+160, mida3, mida3+150);
  
}
        
void mousePressed () {
  
  vx= random(-3,15);
  vy= random(-3,15);
  
  fill(random(0,255), random(0,255), random(0,255), random(100,255));
  
}

/*void mouseReleased( ) {
    mida=40;
}
*/


