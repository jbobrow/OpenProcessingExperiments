
float x;
float y;
float v=random(3,5);
float v1=(2);
float vy=random(3,5);
float vy1=(2);
float color1=(255);
float color2=(255);
float color3=(255);

void setup(){
size(600,600);
x=width/2;
y=height/2;
}

void draw(){
background(85,255,251);
stroke(0,0,0);
cara();
orelles();
ull1();
ull2();
nas();
boca();
cos();
Limits();
posicio();
walker();
}

void mousePressed(){
x=mouseX;
y=mouseY;
v = random(-5, 5);
vy = random(-5, 5);
color1=random(255);
color2=random(255);
color3=random(255);


}

// Cara
void cara(){
fill(240,219,177);
ellipse(x,y,300,200);
}

// Orelles
void orelles(){
ellipse(x-158,y,20,30);
line(x-160,y,x-155,y-5);
line(x-160,y,x-158,y+8);
ellipse(x+158,y,20,30);
line(x+160,y,x+155,y-5);
line(x+160,y,x+158,y+8);
}

// Ull 1
void ull1(){
fill(color1,color2,color3);
ellipse(x-80,y-20,50,50);
fill(240,219,177);
arc(x-80,y-15,50,40,0,PI);
line(x-104,y-15,x-56,y-15);
fill(0,0,0);
ellipse(x-80,y-20,5,5);
line(x-90,y-60,x-60,y-50);
}

// Ull 2
void ull2(){
fill(color1,color2,color3);
ellipse(x+80,y-20,50,50);
fill(240,219,177);
arc(x+80,y-15,50,40,0,PI);
line(x+56,y-15,x+104,y-15);
fill(0,0,0);
ellipse(x+80,y-20,5,5);
line(x+60,y-50,x+90,y-60);
}

// Nas
void nas(){
line(x,y+10,x+10,y+20);
line(x+10,y+20,x,y+30);
}

// Boca
void boca(){
 line(x-20,y+60,x+30,y+60);
line(x-20,y+60,x-25,y+57);
line(x+30,y+60,x+25,y+50);
line(x+25,y+60,x+15,y+70);
}

// Cos
void cos(){
  if (x<width/2){
    fill(250,255,18);
rect(x-100,y+100,200,100,30);
fill(255,0,0);
noStroke();
rect(x-60,y+100,30,100);
noStroke();
rect(x+40,y+100,30,100);
noStroke();
rect(x-30,y+150,70,50);
fill(250,255,18);
ellipse(x-45,y+165,15,15);
ellipse(x+55,y+165,15,15);
  }
  else {
    fill(240,219,177);
rect(x-100,y+100,200,100,30);
fill(247,211,142);
ellipse(x-45,y+165,15,15);
ellipse(x+55,y+165,15,15);
fill(252,157,122);
ellipse(x-45,y+165,5,5);
ellipse(x+55,y+165,5,5);
  }

}

void Limits(){
 if (x-170<0){
   x=170;
 }
 if (x+170>width){
   x=width-170;
 }
 if (y-100<0){
   y=100;
 }
 if (y+200>height){
   y=height-200;
 }
}

void posicio(){
  
  x = x+v;
  y = y+vy;
  
  if (x+170 > width||x-170 <0) {
    v=-v;
  }
  if (y+200 > height||y-100 <0) {
    vy=-vy;
  }
}

void walker(){
  float r=random(100);
  if (r<25){
    x=x-v1;
  }
  else if (r<50){
    x=x+v1;
  }
  else if (r<75){
    y=y-vy1;
  }
  else if (r<100){
   y=y+vy1;
  } 
}




