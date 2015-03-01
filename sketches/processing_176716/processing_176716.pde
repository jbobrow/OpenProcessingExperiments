



//variables utilitzades
int x1 = 0;
int x2 = 30;
int x3 = 60;
int x4 = 90;
int x5 = 120;
int x6 = 150;
int x7 = 180;
int x8 = 210;
int x9 = 240;
int x10 = 270;
int x11 = 300;
int x12 = 330;
int x13 = 360;
int x14 = 390;
int x15 = 420;
int x16 = 450;
int x17 = 480;
int x18 = 510;

int y1 = 1;
int y2 = 0;
int y3 = 0;
int y4 = 0;
int y5 = 0;
int y6 = 0;
int y7 = 0;
int y8 = 0;
int y9 = 0;
int y10 = 0;
int y11 = 0;
int y12 = 0;
int y13 = 0;
int y14 = 0;
int y15 = 0;
int y16 = 0;
int y17 = 0;
int y18 = 0;


//inici
void setup() {
size(500,400);
frameRate(100);
noStroke();
smooth();
background(255,255,255);
}
void draw() {

  //printació per pantalla de les cordenades x,y
//println(mouseX,mouseY);
//consulta a un metode
balls();

}
void balls(){
 //figures y els seus colors
 fill(random(215),random(200),random(100));
ellipse(x1,y1,30,30);

  fill(random(123),random(123),random(123));
ellipse(x2,y2,30,30);
  fill(0,random(140),0);
ellipse(x3,y3,30,30);
  fill(255,random(255),0);
ellipse(x4,y4,30,30);
  fill(random(255),0,0);
ellipse(x5,y5,30,30);
  fill(255,0,random(200));
ellipse(x6,y6,30,30);
  fill(25,random(230),0);
ellipse(x7,y7,30,30);
  fill(2,0,random(245));
ellipse(x8,y8,30,30);
  fill(random(255),random(254),random(255));
ellipse(x9,y9,30,30);
  fill(255,random(255),random(255));
ellipse(x10,y10,30,30);
  fill(random(5),random(220),random(220));
ellipse(x11,y11,30,30);
  fill(55,random(110),random(230));
ellipse(x12,y12,30,30);
  fill(random(255),random(210),random(110));
ellipse(x13,y13,30,30);
  fill(125,random(255),0);
ellipse(x14,y14,30,30);
  fill(115,random(255),143);
ellipse(x15,y15,30,30);
  fill(random(215),random(200),random(100));
ellipse(x16,y16,30,30);
 fill(random(21),random(250),random(107));
ellipse(x17,y17,30,30);
  fill(random(255));
ellipse(x18,y18,30,30);
 //repetició de les figures un numero infinit de vagades
if( y1 >=0 && y1 < 415){  

  y1 = y1+1;
  y2 = y2+1;
  y3 = y3+1;
 y4 = y4+1;
 y5 = y5+1;
 y6 = y6+1;
 y7 = y7+1;
 y8 = y8+1;
 y9 = y9+1;
 y10 = y10+1;
 y11 = y11+1;
 y12 = y12+1;
 y13 = y13+1;
 y14 = y14+1;
 y15 = y15+1;
 y16 = y16+1;
 y17 = y17+1;
 y18 = y18+1;
  


 }
else if(y1 >= 415){
 
  y1= 0;
  y2 = 0;
  y3 = 0;
 y4 = 0;
 y5 = 0;
 y6 = 0;
 y7 = 0;
 y8 = 0;
 y9 = 0;
 y10 = 0;
 y11 = 0;
 y12 = 0;
 y13 = 0;
 y14 = 0;
 y15 = 0;
 y16 = 0;
 y17 = 0;
 y18 = 0;
 
 
 
}
else if(y1 >=0 && y1 < 415){
 y1 = y1+1;
y2 = y2+1;
  y3 = y3+1;
 y4 = y4+1;
 y5 = y5+1;
 y6 = y6+1;
 y7 = y7+1;
 y8 = y8+1;
 y9 = y9+1;
 y10 = y10+1;
 y11 = y11+1;
 y12 = y12+1;
 y13 = y13+1;
 y14 = y14+1;
 y15 = y15+1;
 y16 = y16+1;
 y17 = y17+1;
 y18 = y18+1;

 
}
 
}

//si prenem el botó del ratolí tornen a la posició inicial
void mousePressed(){
    y1= 0;
  y2 = 0;
  y3 = 0;
 y4 = 0;
 y5 = 0;
 y6 = 0;
 y7 = 0;
 y8 = 0;
 y9 = 0;
 y10 = 0;
 y11 = 0;
 y12 = 0;
 y13 = 0;
 y14 = 0;
 y15 = 0;
 y16 = 0;
 y17 = 0;
 y18 = 0; 
 
  x1 = 30;
 x2 = 60;
 x3 = 90;
 x4 = 120;
 x5 = 150;
 x6 = 180;
 x7 = 210;
 x8 = 240;
 x9 = 270;
 x10 = 300;
 x11 = 330;
 x12 = 360;
 x13 = 390;
 x14 = 420;
 x15 = 450;
 x16 = 480;
 x17 = 510;
 x18 = 0;
 

  };
  
  //i quan deixem el ratolí les posicións de les figures varien
void mouseReleased(){
       y1= 144;
  y2 = 23;
  y3 = 32;
 y4 = 45;
 y5 = 10;
 y6 = 40;
 y7 = 85;
 y8 = 190;
 y9 = 380;
 y10 = 120;
 y11 = 270;
 y12 = 370;
 y13 = 170;
 y14 = 180;
 y15 = 287;
 y16 = 244;
 y17 = 380;
 y18 = 10; 

}









