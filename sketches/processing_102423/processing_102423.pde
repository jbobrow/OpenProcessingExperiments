
size (400,600);

fill(103,129,66);
rect(0,390,400,210);
PImage img;
img=loadImage("rcioceu.jpg");
background (img);
//grama
fill(103,129,66);
 rect(0,545,400,100);
 //piso
fill (100,200);
rect (45,545,275,20);


fill(248,222,211);
rect (50,400,100,150);
rect (150,150,65,400);
rect (215,400,100,150);

fill (230,226,221);//cor das bordas
triangle (40,400,150,400,150,340);
triangle (215,340,215,400,325,400);
fill(248,222,211);
triangle (60,395,145,395,145,350);
triangle (220,350,220,395,305,395);

//topo
fill (230,226,221);
rect (160, 140,45,10); //meio
rect (150,135,10,15);
rect (205,135,10,15);
fill (182,172,154);
triangle (160,140,205,140,182.5,30);
strokeWeight (5); 
line (182.5,30,182.5,10); //cruz
line (178,15,186,15);

//colunas
strokeWeight(1);
fill (230,226,221);
rect (150,150,10,400);
rect (205,150,10,400);

//janelas
fill (108,63,30);
for ( int x = 60; x < 150; x = x+30)    {
   rect ( x,405,30,30);
   rect ( x,435,30,30);
}

 int y = 215;
 rect(y,405,30,30);
 rect(y,435,30,30);
 y=y+30;
 rect(y,405,30,30);
 rect(y,435,30,30);
 y=y+30;
 rect(y,405,30,30);
 rect(y,435,30,30);
 
 fill(58,50,48);
 rect(60,475,90,20);
 rect(215,475,90,20);
 
 //portas
 fill (96,26,26);
 for ( int i = 65; i < 130; i = i+20) {
   rect ( i, 505, 20,45);
 }
 for ( int a= 220; a < 300; a =a+20) {
   rect (a, 505, 20, 45);
 }
 //janelas centrais
 stroke(89,45,0);
 fill (89,45,0);
 rect (168,190,12,55);
 ellipse (174,192,12,30);
 rect (185,190,12,55);
 ellipse (191,192,12,30);
 
 rect (168,350,12,55);
 ellipse (174,352,12,30);
 rect (185,350,12,55);
 ellipse (191,352,12,30);
 
 //retangulo central
 stroke(0,255);
 fill (230,226,221);
 rect (161,405,43,7);
 fill(248,222,211);
 rect (163,412,39,138);
 
 //imagem central
 fill(106,149,165);
 stroke(106,149,165);
 rect (168,472,29,72);
 ellipse (182.5, 472,29,30);
 triangle (170,467,195,467,182.5,455);
 
 //circulo central
 fill(188,119,82);
 noStroke();
 ellipse (182.5,297, 20,20); 
 fill(248,222,211);
 ellipse (182.5,297, 10,10);
