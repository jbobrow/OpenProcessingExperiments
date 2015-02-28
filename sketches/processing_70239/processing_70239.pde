
size(600,300);
background(0);

//variables color
color C = color(100,255,250,50);
color A = color(2550,255,0,30);
color V = color(0,153,0,50);
color M = color(190,0,170,40);
color R = color(255,0,0,50);
color B = color(255,255,255,30);
color Az = color(0,0,255,40);

//variable grosor línea
int BL = 2;


//fondo con repetición de triangulos
for(int i= 20; i<=width; i =i+30) {
  for(int j=60; j<=380; j=j + 30){
    fill(C);
    triangle(i,j,i+20,20,i,j+20);
  }
}

for(int i= 10; i<=width; i =i+30) {
  for(int j=20; j<=380; j=j + 30){
    fill(C);
    triangle(i,j,i+20,160,i,j+20);
  }
}


//lineas superiores
stroke(10);
fill(255,255,255);
line(2,5,580,5);
line(2,10,580,10);
line(2,15,580,15);
line(2,20,580,20);

point(590,5);
point(590,10);
point(590,15);
point(590,20);


//diagonal de cuadros
noStroke();
fill(A);
rect(0,0,100,50);
rect(50,25,100,50);
rect(100,50,100,50);
rect(150,75,100,50);
rect(200,100,100,50);
rect(250,125,100,50);
rect(300,150,100,50);
rect(350,175,100,50);
rect(400,200,100,50);
rect(450,225,100,50);
rect(500,250,100,50);


//figuras superior derecha
fill(25,255,200,30);
quad(300,20,360,130,450,200,500,30);
fill(255,205,200,30);
quad(420,70,480,135,550,110,590,10);
fill(Az);
quad(490,100,590,190,540,190,350,100);
fill(0,255,255,30);
quad(160,20,220,70,320,120,355,45);
fill(V);
quad(480,170,550,230,580,220,590,150);


//elipses y arcos
fill(R);
arc(50,90,180,180,PI/2.34,6.61);
fill(B);
ellipse(300,280,280,280);
fill(V);
ellipse(160,180,220,200);
fill(M);
ellipse(60,260,150,150);


//letras
stroke(0);
strokeWeight(BL);
fill(255,155,10,50);
//M
beginShape();
vertex(520,260);
vertex(530,260);
vertex(535,270);
vertex(540,260);
vertex(550,260);
vertex(550,290);
vertex(540,290);
vertex(540,280);
vertex(535,290);
vertex(530,280);
vertex(530,290);
vertex(520,290);
endShape(CLOSE);
//J
beginShape();
vertex(558,260);
vertex(588,260);
vertex(588,270);
vertex(580,270);
vertex(580,290);
vertex(558,290);
vertex(558,275);
vertex(568,275);
vertex(568,280);
vertex(570,280);
vertex(570,270);
vertex(558,270);
endShape(CLOSE);
