
float posicioX = 50;
float posicioY = 40;
float velocitatX = random(1,2);
float velocitatY = random(1,2);
float posicioC = 50;

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
color arena = color(149,121,15);
float verd = color(63,165,30);
color vermell = color(206,52,52);
PImage mar;
int total = 100;
float[] x = new float [total];
float[] y = new float [total];
float v;
int sz;




void setup(){
  size(800,400);
float velocitatX = random(1,2);
float velocitatY = random(1,2);
//mar = loadImage("mar3.jpg");

for (int i =0; i<total; i++) {
x[i] =width/2;
y[i] =height/2;
}

v=5;
sz=15;

}

void draw(){
// image(mar,0,0);
  background(blau);
  fill(arena);
  stroke(arena);
  rect(0,350,800,50);
  
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;
  
   strokeWeight(2);
 
  //parts cos color marró
 fill(marro);
  stroke(marro);
  
  
  
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
  
  //actualització
for (int i =0; i<total; i++) {
x [i] = x [i]+ random (-v,+v);
y [i] = y [i]+ random(-v,+v);





//peixets de colors 
  //peixet1
  //taronja = color(random(200,255),137,64);
  fill(taronja);
stroke(taronja);
ellipse(x[i],y[i],35,20);
triangle(x[i]-25,y[i]-10,x[i]-8,y[i],x[i]-25,y[i]+10);
fill(0);
ellipse(x[i]+10,y[i],5,5);
}


 


}


  void mousePressed(){
  velocitatX = random(1,6);
  velocitatY = random(1,3);
  
  //variació de color
  marro = color(random(200,255), random(150,200), random(60,80));
  taronja =  color(random(70,255), random(180,200), random(50,80));
  blau = color(0,0,random(150,255));
  arena = color(random(100,149),random(100,160),random(15,30));
  
  //nueva posicion de la bola
  posicioX=mouseX;
  posicioY=mouseY;
  

   

}

