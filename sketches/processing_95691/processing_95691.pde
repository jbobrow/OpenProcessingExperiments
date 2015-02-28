
 int x=19, x2=44, x3=105, x4=130;//x=Llanta1, x2=Llanta2, x3=Llanta3, x4=Llanta4.
 int x5=10;//Carrito Grande.
 int y2=193;//Carrito Grande.
 int x6=59, x7=87, x8=118;//Chimn.
 int y3=175, y4=168, y5=162;//Chimn.
 int y=231;//y=Llantas.
 float rojo=72,verde=205,azul=237;

 void setup(){
size(600,400);
background(72,205,237);
noStroke();
fill(250,250,0);
frameRate(50);

}

void draw (){
background(rojo,verde,azul);
//Comienza el paisaje.
noStroke();
fill(121,126,127);
rect(0,200,600,100);
noStroke();
fill(98,198,97);
rect(0,300,600,100);
stroke(243,234,30);
strokeWeight(3);
line(0,200,600,200);
stroke(243,234,30);
strokeWeight(3);
line(0,300,600,300);
stroke(243,234,30);
strokeWeight(3);
line(0,250,50,250);
stroke(243,234,30);
strokeWeight(3);
line(100,250,150,250);
stroke(243,234,30);
strokeWeight(3);
line(200,250,250,250);
stroke(243,234,30);
strokeWeight(3);
line(300,250,350,250);
stroke(243,234,30);
strokeWeight(3);
line(400,250,450,250);
stroke(243,234,30);
strokeWeight(3);
line(500,250,550,250);
stroke(243,234,30);
strokeWeight(3);
line(595,250,600,250);
//Comienzan Edificios.
noStroke();//Primer Edif Izq.
fill(39,39,39);
rect(31,26,90,174);
noStroke();
fill(255);
rect(101,32,10,10);
noStroke();
fill(255);
rect(101,50,10,10);
noStroke();
fill(255);
rect(101,90,10,10);
rect(101,50,10,10);
noStroke();
fill(255);
rect(101,150,10,10);
noStroke();
fill(255);
rect(80,120,10,10);
noStroke();
fill(255);
rect(80,60,10,10);
noStroke();
fill(255);
rect(80,170,10,10);
fill(255);
rect(50,32,10,10);
noStroke();
fill(255);
rect(50,50,10,10);
noStroke();
fill(255);
rect(50,90,10,10);
rect(50,50,10,10);
noStroke();
fill(255);
rect(50,150,10,10);
noStroke();//Segundo edif.
fill(162,122,122);
rect(152,106,140,94);
noStroke();
fill(255);
rect(171,137,20,20);
rect(211,137,20,20);
rect(251,137,20,20);
noStroke();//Tercer edif.
fill(169,164,122);
rect(331,26,90,174);
noStroke();
fill(252);
rect(401,32,10,10);
rect(401,50,10,10);
rect(401,90,10,10);
rect(401,50,10,10);
rect(401,150,10,10);
rect(380,120,10,10);
rect(380,60,10,10);
rect(380,170,10,10);
rect(350,32,10,10);
rect(350,50,10,10);
rect(350,90,10,10);
rect(350,50,10,10);
rect(350,150,10,10);
fill(169,164,122);//2da parte, 3er edif.
rect(421,106,140,94);
noStroke();
fill(255);
rect(531,150,10,10);
rect(531,180,10,10);
rect(501,170,10,10);
rect(501,130,10,10);
rect(480,130,10,10);
rect(480,150,10,10);
rect(480,180,10,10);
rect(450,120,10,10);
rect(450,140,10,10);
rect(450,180,10,10);

//Comienza Carrito.
fill(223,148,38);
rect(x5,y2,140,36);//Comienza Carrito Grande.
x5=x5+1;
rect(x6,y3,19,18);//Chimn.
x6=x6+1;
rect(x7,y4,19,25);
x7=x7+1;
rect(x8,y5,19,32);
x8=x8+1;
fill(0,0,0);//Comienzan llantas.
ellipse(x,y,13,13);
ellipse(x2,y,13,13);
ellipse(x3,y,13,13);
ellipse(x4,y,13,13);
x=x+1;
x2=x2+1;
x3=x3+1;
x4=x4+1;

azul=azul-.5;
rojo=rojo-.5;
verde=verde-.5;

}


