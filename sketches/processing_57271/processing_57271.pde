
//es un poco abstracto pero queria generar una textura que siguiera una pelotita y que al momento de dar click fuera como si le disparara y la pantalla se pusiera en rojo
// como un jueguito

int movex;
int movey;
 float verticalx=0;
 
 
void setup(){
size(900,450);
background(0);
smooth();
noFill();
stroke(random(255),random(255),random(255),random(80,100));
movex=0;
movey=0;
 
}
 
 
 
void draw(){
  
  stroke(random(255),0,0);
 background(0);
 //fill(0,0,random(20,30),random(20,40));
ellipse( movex,movey+0,random(20,60),random(20,60));
triangle (movex,movey+0,40,50,mouseX,mouseY);
bezier(900,+0,40,50,100,50,mouseX+0,mouseY);
bezier(100,450,40,50,100,50,mouseX+0,mouseY);
bezier(100,+0,40,50,100,50,movex+0,movey);


strokeWeight(random(10));
 
movex=movex+10;
movey++;
 
if (movex>=width){
  movex=0;
}
 
if (movey>=height){
  movey=0;
}
 
 if (mousePressed){
   background(255,0,0);
 }
 
 for (int i = 0; i < 450; i = i+10) {
  line(mouseX, i, movex, i);
}
 
 
 
}
 
 
//bezier(x1, y1, cpx1, cpy1, cpx2, cpy2, x2, y2);
 
 
//curve(cpx1, cpy1, x1, y1, x2, y2, cpx2, cp);
