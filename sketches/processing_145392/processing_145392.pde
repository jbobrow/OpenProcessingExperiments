
//Variables
float xpuke;
float ypuke;
float vx=random(-3,3);
float vy=random(-3,3);

//Posició central
float px;
float py;

//Colors variables
float color1=random(255);
float color2=random(255);
float color3=random(255);
float color4=random(255);
float color5=random(255);
float color6=random(255);

//Config
void setup(){
 size(500,500); 
 xpuke=random(100,400);
 ypuke=random(100,400);
 px=width/2;
 py=height-200;
}

//Loop general
void draw(){
  fons();
  dibuix();
  mov();
}

void mousePressed(){
  vx=random(-3,3);
  vy=random(-3,3);
  color1=random(255);
  color2=random(255);
  color3=random(255);
  color4=random(255);
  color5=random(255);
  color6=random(255);
}

//1
void fons(){
  background(255);
}

//2
void dibuix(){
  //cap
  stroke(0);
ellipse(xpuke,ypuke-250,150,150);
ellipse(xpuke,ypuke-100,150,150);
rect(xpuke-75,ypuke-250,150,150);
stroke(255);
ellipse(xpuke,ypuke-250,140,140);
ellipse(xpuke,ypuke-250,140,140);
rect(xpuke-70,ypuke-250,130,145);
stroke(0);
rect(xpuke-50,ypuke-250,90,185);
strokeWeight(10);
ellipse(xpuke-50,ypuke-270,10,10);
ellipse(xpuke+30,ypuke-270,10,10);
strokeWeight(2);
line(xpuke-50,ypuke-55,xpuke-20,ypuke-50);
line(xpuke+30,ypuke-50,xpuke+50,ypuke-60);
strokeWeight(5);

//puke
stroke(color1,0,0);
fill(color1,0,0,200);
rect(xpuke-350,ypuke-245,385,25);
noFill();
stroke(color2,180,0);
fill(color2,180,0,200);
rect(xpuke-350,ypuke-215,385,25);
noFill();
stroke(color3,255,0);
fill(color3,255,0,200);
rect(xpuke-350,ypuke-185,385,25);
 noFill();
 stroke(color4,150,0);
fill(color4,150,0,200);
rect(xpuke-350,ypuke-155,385,25);
noFill();
stroke(color5,0,255);
fill(color5,0,255,200);
rect(xpuke-350,ypuke-125,385,25);
noFill();
stroke(color6,0,255);
fill(color6,0,255,200);
rect(xpuke-350,ypuke-95,385,25);
noFill();
}
  
void   mov(){
  if (xpuke+100>width||xpuke-350<0){
    vx=-vx;
    color1=random(255);
    color2=random(255);
    color3=random(255);
    color4=random(255);
    color5=random(255);
    color6=random(255);
  }
  if (ypuke+100>height||ypuke-190>0){
    vy=-vy;
    color1=random(255);
    color2=random(255);
    color3=random(255);
    color4=random(255);
    color5=random(255);
    color6=random(255);
  }
}
    



