
float posicioX = 50;
float posicioY = 40;
float velocitatX = random(1,2);
float velocitatY = random(1,2);
float posicioC = 50;
//float velocitatc = 0.3;
float a = 70;
float b = 30;
float d = 750;
float e = 700;
float f = 650;
float velocitata = random(0.3,0.5);
float velocitatb = random(0.1,0.3);
float velocitatC = random(0.2,0.5);
color marro = color(240,203,82);
color taronja = color(240,73,12);
color blau = color(73,134,211);
color lila = color(160,102,160);
float groc = color(247,152,7);
color vermell = color(206,52,52);
PImage mar;




void setup(){
  size(800,400);
float velocitatX = random(1,2);
float velocitatY = random(1,2);
mar = loadImage("mar3.jpg");

}

void draw(){
 image(mar,0,0);
  //background(blaufosc);
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;
  
 
  //parts cos color marró
 fill(marro);
  stroke(marro);
  
   //COLOR
  //if (posicioY <= height/3) {
    //fill(marro);
 // }
 // if (posicioY >= height/3 && posicioY <= (height/3)*2) {
   // fill(groc);
    //stroke(groc);
 // }
  //if (posicioY >(height/3)*2) {
   // fill(taronja);
   //stroke(taronja);
 // }
  
ellipse(posicioX,posicioY,100,100);
ellipse(posicioX-15,posicioY+50,15,20);
ellipse(posicioX+15,posicioY+50,15,20);
triangle(posicioX-40,posicioY-30,posicioX-37.5,posicioY-62.5,posicioX-7.5,posicioY-50);
triangle(posicioX+7.5,posicioY-50,posicioX+37.5,posicioY-62.5,posicioX+40,posicioY-30);
//orellesroses
fill(250,126,201);
stroke(250,126, 201);
triangle(posicioX-35,posicioY-32.5,posicioX-35,posicioY-57.5,posicioX-12.5,posicioY-45);
triangle(posicioX+12.5,posicioY-45,posicioX+35,posicioY-57.5,posicioX+35,posicioY-35);
//parts negres
fill(0);
stroke(0);
ellipse(posicioX-20,posicioY-15,8,8);
ellipse(posicioX+20,posicioY-15,8,8);
ellipse(posicioX,posicioY+13, 10, posicioY/40);
//naset i bigotis
triangle(posicioX-5,posicioY-5,posicioX,posicioY,posicioX+5,posicioY-5);
line(posicioX-60,posicioY-10,posicioX-50,posicioY-3);
line(posicioX-60,posicioY+3,posicioX-50,posicioY+3);
line(posicioX-60,posicioY+16,posicioX-50,posicioY+9);
line(posicioX+50,posicioY-3,posicioX+60,posicioY-10);
line(posicioX+50,posicioY+3,posicioX+60,posicioY+3);
line(posicioX+50,posicioY+9,posicioX+60,posicioY+16);

  if (posicioX +50>=width) { velocitatX= -velocitatX;}
  if (posicioX -50 <= 0){ velocitatX = -velocitatX;}
  if ((posicioY +50>=height)||(posicioY -40<=0)) {velocitatY = -velocitatY;}


//peixets de colors 
  //peixet1
posicioC = posicioC + 0.2;
fill(245,137,64);
stroke(245,137,64);
ellipse(posicioC,height-50,35,20);
triangle(posicioC-25,height-60,posicioC-8,height-50,posicioC-25,height-40);
fill(0);
ellipse(posicioC+10,height-50,5,5);


 
//peixet2
a= a + 0.5;
fill(vermell);
stroke(vermell);
ellipse(a,height-300,35,20);
triangle(a-25,90,a-8,height-300,a-25,110);
fill(0);
ellipse(a+10,height-300,5,5);
//peixet3
b= b + 0.4;
fill(245,230,64);
stroke(245,230,64);
ellipse(b,height-150,35,20);
triangle(b-25,240,b-8,height-150,b-25,260);
fill(0);
ellipse(b+10,height-150,5,5);

//peixet4
d = d - 0.2;
fill(blau);
stroke(blau);
ellipse(d,height-200,35,20);
triangle(d+25,height-210,d+8,height-200,d+25,height-190);
fill(0);
ellipse(d-10,height-200,5,5);
 
//peixet5
e= e - 0.5;
fill(taronja);
stroke(taronja);
ellipse(e,height-350,35,20);
triangle(e+25,40,e+8,height-350,e+25,60);
fill(0);
ellipse(e-10,height-350,5,5);
//peixet6
f= f - 0.6;
fill(lila);
stroke(lila);
ellipse(f,height-100,35,20);
triangle(f+25,290,f+8,height-100,f+25,310);
fill(0);
ellipse(f-10,height-100,5,5);

}

//VELOCITAT
//void mouseReleased(){
//pmouseX = ;
//pmouseY = ;}
  void mousePressed(){
  velocitatX = random(1,6);
  velocitatY = random(1,3);
  
  //variació de color
  marro = color(random(200,255), random(150,200), random(60,80));
  
  
  //nueva posicion de la bola
  posicioX=mouseX;
  posicioY=mouseY;
  

   

}




