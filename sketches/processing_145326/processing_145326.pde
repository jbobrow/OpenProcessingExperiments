
float l=0;
float h=850;
float dl=1.5;

float x=0;
float vx=2;
float y=850;
float vy=1;

float xr=0;
float yr=50;
float vxr=random (-4,7.5);
float vyr=random (-4,7.5);

float col1=random (255);
float col2=random (255);
float col3=random (255);


void setup (){
  size(800,800);
  x=width/2;
  y=height/2;
  xr=height/2;
  yr=height/2;
  noCursor();
}

void draw(){
  background(217,246,250);
  texto();
  fondo();
  cabeza();
  ojos();
  boca();
  nariz();
  cuerpo();
  corbata();
  puntero();
}

void mousePressed(){
  fondo();
  x=mouseX;
  y=mouseY;
  vxr=random(-4,5);
  vyr=random(-4,5);

  col1=random (255);
  col2=random (255);
  col3=random (255);
}

void fondo(){
fill(61,157,250,50);
strokeWeight(0.5);
stroke(61,157,250);
ellipse(l-200,h,50,50);
ellipse(l-200,h-100,50,50);
ellipse(l-200,h-200,50,50);
ellipse(l-200,h-300,50,50);
ellipse(l-200,h-400,50,50);
ellipse(l-200,h-500,50,50);
ellipse(l-200,h-600,50,50);
ellipse(l-200,h-700,50,50);
ellipse(l-200,h-800,50,50);
ellipse(l-100,h-50,50,50);
ellipse(l-100,h-150,50,50);
ellipse(l-100,h-250,50,50);
ellipse(l-100,h-350,50,50);
ellipse(l-100,h-450,50,50);
ellipse(l-100,h-550,50,50);
ellipse(l-100,h-650,50,50);
ellipse(l-100,h-750,50,50);
ellipse(l-100,h-850,50,50);
ellipse(l+0,h,50,50);
ellipse(l+0,h-100,50,50);
ellipse(l+0,h-200,50,50);
ellipse(l+0,h-300,50,50);
ellipse(l+0,h-400,50,50);
ellipse(l+0,h-500,50,50);
ellipse(l+0,h-600,50,50);
ellipse(l+0,h-700,50,50);
ellipse(l+0,h-800,50,50);
ellipse(l+100,h-50,50,50);
ellipse(l+100,h-150,50,50);
ellipse(l+100,h-250,50,50);
ellipse(l+100,h-350,50,50);
ellipse(l+100,h-450,50,50);
ellipse(l+100,h-550,50,50);
ellipse(l+100,h-650,50,50);
ellipse(l+100,h-750,50,50);
ellipse(l+100,h-850,50,50);
ellipse(l+200,h,50,50);
ellipse(l+200,h-100,50,50);
ellipse(l+200,h-200,50,50);
ellipse(l+200,h-300,50,50);
ellipse(l+200,h-400,50,50);
ellipse(l+200,h-500,50,50);
ellipse(l+200,h-600,50,50);
ellipse(l+200,h-700,50,50);
ellipse(l+200,h-800,50,50);
ellipse(l+300,h-50,50,50);
ellipse(l+300,h-150,50,50);
ellipse(l+300,h-250,50,50);
ellipse(l+300,h-350,50,50);
ellipse(l+300,h-450,50,50);
ellipse(l+300,h-550,50,50);
ellipse(l+300,h-650,50,50);
ellipse(l+300,h-750,50,50);
ellipse(l+300,h-850,50,50);
ellipse(l+400,h,50,50);
ellipse(l+400,h-100,50,50);
ellipse(l+400,h-200,50,50);
ellipse(l+400,h-300,50,50);
ellipse(l+400,h-400,50,50);
ellipse(l+400,h-500,50,50);
ellipse(l+400,h-600,50,50);
ellipse(l+400,h-700,50,50);
ellipse(l+400,h-800,50,50);
ellipse(l+500,h-50,50,50);
ellipse(l+500,h-150,50,50);
ellipse(l+500,h-250,50,50);
ellipse(l+500,h-350,50,50);
ellipse(l+500,h-450,50,50);
ellipse(l+500,h-550,50,50);
ellipse(l+500,h-650,50,50);
ellipse(l+500,h-750,50,50);
ellipse(l+500,h-850,50,50);
ellipse(l+600,h,50,50);
ellipse(l+600,h-100,50,50);
ellipse(l+600,h-200,50,50);
ellipse(l+600,h-300,50,50);
ellipse(l+600,h-400,50,50);
ellipse(l+600,h-500,50,50);
ellipse(l+600,h-600,50,50);
ellipse(l+600,h-700,50,50);
ellipse(l+600,h-800,50,50);
ellipse(l+700,h-50,50,50);
ellipse(l+700,h-150,50,50);
ellipse(l+700,h-250,50,50);
ellipse(l+700,h-350,50,50);
ellipse(l+700,h-450,50,50);
ellipse(l+700,h-550,50,50);
ellipse(l+700,h-650,50,50);
ellipse(l+700,h-750,50,50);
ellipse(l+700,h-850,50,50);
ellipse(l+800,h,50,50);
ellipse(l+800,h-100,50,50);
ellipse(l+800,h-200,50,50);
ellipse(l+800,h-300,50,50);
ellipse(l+800,h-400,50,50);
ellipse(l+800,h-500,50,50);
ellipse(l+800,h-600,50,50);
ellipse(l+800,h-700,50,50);
ellipse(l+800,h-800,50,50);
ellipse(l+900,h-50,50,50);
ellipse(l+900,h-150,50,50);
ellipse(l+900,h-250,50,50);
ellipse(l+900,h-350,50,50);
ellipse(l+900,h-450,50,50);
ellipse(l+900,h-550,50,50);
ellipse(l+900,h-650,50,50);
ellipse(l+900,h-750,50,50);
ellipse(l+900,h-850,50,50);
l=l+dl;
h=h; 
if(l>200){
dl=-1.5;
}
if(l<0){
dl=1.5;
}
}

void texto(){
  textSize(50);
  fill(0);
  text("BOB ESPONJA",xr,yr);
  xr=xr+vxr;
  yr=yr+vyr;
  if (xr>width-320 || xr<0){
     vxr=-vxr;
  }
  if (yr>height || yr<0){
    vyr=-vyr;
  }
}

void cabeza(){
  fill(254,255,44);
  stroke(0);
  strokeWeight(2);
  quad(x,y,x+300,y,x+275,y+250,x+25,y+250);
  strokeWeight(0);
  fill(213,216,20);
  ellipse(x+50,y+30,20,40);
  ellipse(x+30,y+60,15,30);
  ellipse(x+260,y+40,20,30);
  ellipse(x+50,y+210,20,40);
  ellipse(x+70,y+230,10,20);
  ellipse(x+250,y+200,15,30);
  ellipse(x+220,y+220,20,30);
  x=x+vx;
  y=y+vy;
  if (x>width-300 || x<0){
     vx=-vx;
  }
  if (y>height-345 || y<0){
    vy=-vy;
  }
}

void ojos(){
  strokeWeight(2);
  stroke(0);
  fill(255,255,255);
  ellipse(x+100,y+100,100,100);
  ellipse(x+200,y+100,100,100);
  fill(65+x,178-y/2,237-x);
  strokeWeight(3);
  ellipse(x+120,y+100,35,35);
  ellipse(x+180,y+100,35,35);
  fill(0,0,0);
  strokeWeight(2);
  ellipse(x+120,y+100,12.5,12.5);
  ellipse(x+180,y+100,12.5,12.5);
}

void boca(){
  strokeWeight(3);
  noFill();
  arc(x+150,y+150,200,75,0,PI);
  strokeWeight(2);
  fill(255,255,255);
  quad(x+120,y+185.5,x+142.5,y+187,x+142.5,y+209.5,x+119,y+208);
  quad(x+160,y+187,x+182.5,y+185.5,x+182.5,y+208,x+160,y+209.5);
}

void nariz(){
  fill(254,255,44);
  strokeWeight(2);
  arc(x+150,y+125,25,30,PI-QUARTER_PI,TWO_PI+QUARTER_PI);
}

void cuerpo(){
  strokeWeight(2);
  stroke(0,0,0);
  fill(255,255,255);
  rect(x+25,y+250,250,75);
  fill(191,132,13);
  rect(x+25,y+285,250,40);
  rect(x+75,y+325,50,20);
  rect(x+175,y+325,50,20);
  fill(0,0,0);
  rect(x+40,y+295,35,7.5);
  rect(x+90,y+295,35,7.5);
  rect(x+175,y+295,35,7.5);
  rect(x+225,y+295,35,7.5);
  fill(255,255,255);
  triangle(x+142.5,y+250,x+125,y+265,x+95,y+250);
  triangle(x+162.5,y+250,x+180,y+265,x+210,y+250);
}

void corbata(){
  fill(col1,col2,col3);
  beginShape();
  vertex(x+137.5,y+250);
  vertex(x+162.5,y+250);
  vertex(x+157.5,y+260);
  vertex(x+142.5,y+260);
  endShape();
  beginShape();
  vertex(x+142.5,y+260);
  vertex(x+157.5,y+260);
  vertex(x+165,y+295);
  vertex(x+150,y+310);
  vertex(x+135,y+295);
  endShape();
}

void puntero(){
  strokeWeight(1);
  fill(173,128,5);
  arc(mouseX+50,mouseY+5,50,25,PI,TWO_PI);
  fill(80,59,1);
  rect(mouseX+25,mouseY+5,50,10);
  fill(255,0,0);
  rect(mouseX+25,mouseY+15,50,5);
  fill(62,175,7);
  rect(mouseX+25,mouseY+20,50,5);
  fill(173,128,5);
  rect(mouseX+25,mouseY+25,50,10);
}


