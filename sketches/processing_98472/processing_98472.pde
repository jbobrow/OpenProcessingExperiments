
//Rafael Santin
//Trabalho de Conclusão de Disciplina de Computação - Interação

//GLOBO DE NEVE COM IGREJA
int neve = 750;
float[] px = new float[neve];
float[] py = new float[neve];
float[] angle = new float[neve];
float[] randomY = new float[neve];
int[] randomSpawn = new int[neve];
int[] starSize = new int[neve];
int[] starInitSize = new int[neve];
float[] radius = new float[neve];
int starMarkedSize = 8;
float speed = 0.05;
PFont fonte;

void setup(){
size(200, 200);
fonte = createFont ("Arial Rounded MT Bold", 12);
textFont (fonte);
smooth();
 //o número de quadros, no caso 60
//serve para calcular a quantidade de neve que gira, e seu tamanho
for (int c=0; c<neve; c++) {
randomSpawn[c]=(int)random(0,360);
radius[c]=random(0, width/1.5);
starInitSize[c] = (int)random(1,4);
  }
}
void draw(){
//pavimento
fill(82, 81, 87);
noStroke();
rectMode(CORNER);
rect(0, 174/2, 300, 200);
// parades de trás 
fill(229, 228, 189);
noStroke();
rectMode(CORNER);
rect(123/2, 67/2, 50/2, 66/2);
rect(136/2, 59/2, 12/2, 8/2);
//paredes
fill(239, 238, 202);
noStroke();
rectMode(CORNER);
rect(23/2, 137/2, 251/2, 37/2);
rect(142/2, 132/2, 13/2, 5/2);
triangle(23/2, 137/2, 142/2, 80/2, 142/2, 137/2);
triangle(274/2, 137/2, 155/2, 80/2, 155/2, 137/2);
// linhas de contorno
stroke(60, 60, 60);
strokeWeight(1);
smooth();
line(142/2, 80/2, 23/2, 137/2);
line(155/2, 80/2, 274/2, 137/2);
line(123/2, 67/2, 135/2, 67/2);
line(136/2, 59/2, 147/2, 59/2);
line(148/2, 67/2, 172/2, 67/2);
//janelas
fill(99, 103, 88);
noStroke();
rectMode(CORNER);
rect(125/2, 137/2, 47/2, 37/2);
quad(142/2, 90/2, 155/2, 97/2, 155/2, 132/2, 142/2, 132/2);
rect(97/2, 144/2, 13/2, 13/2);
rect(38/2, 142/2, 26/2, 29/2);
rect(203/2, 143/2, 68/2, 15/2);
noFill();
stroke(255, 255, 255);
strokeWeight(2);
smooth();
rect(97/2, 144/2, 13/2, 13/2);
rect(38/2, 142/2, 26/2, 29/2);
rect(203/2, 143/2, 68/2, 15/2);
line(64/2, 157/2, 38/2, 157/2);
line(51/2, 142/2, 51/2, 171/2);
rect(218/2, 143/2, 13/2, 15/2);
rect(244/2, 143/2, 13/2, 15/2);
stroke(110, 110, 110);
strokeWeight(1);
smooth();
line(23/2, 154/2, 38/2, 154/2);
line(64/2, 154/2, 97/2, 154/2);
line(110/2, 154/2, 125/2, 154/2);
line(172/2, 154/2, 203/2, 154/2);
stroke(80, 80, 80);
strokeWeight(1);
smooth();
line(113/2, 143/2, 120/2, 135/2);
line(120/2, 135/2, 127/2, 130/2);
line(127/2, 130/2, 134/2, 127/2);
line(134/2, 127/2, 142/2, 125/2);
line(155/2, 125/2, 167/2, 128/2);
line(167/2, 128/2, 175/2, 132/2);
line(175/2, 132/2, 181/2, 137/2);
line(181/2, 137/2, 186/2, 143/2);
stroke(100, 100, 100);
line(65/2, 142/2, 65/2, 172/2);
line(65/2, 172/2, 38/2, 172/2);
line(111/2, 144/2, 111/2, 158/2);
line(111/2, 158/2, 97/2, 158/2);
line(272/2, 143/2, 272/2, 159/2);
line(272/2, 159/2, 203/2, 159/2);
//gramado
fill(201, 216, 125);
noStroke();
quad(0, 174/2, 163/2, 174/2, 151/2, 200, 0, 200);
quad(238/2, 173/2, 300/2, 174/2, 300/2, 187/2, 247/2, 184/2);
ellipseMode(CENTER);
ellipse(219/2, 177/2, 17/2, 6/2);
quad(240/2, 173/2, 247/2, 184/2, 219/2, 180/2, 219/2, 174/2);
//espelho d’agua
fill(66, 104, 198);
noStroke();
ellipseMode(CENTER);
ellipse(150, 150, 90, 40);
stroke (29, 32, 39);
ellipse(150, 150, 90, 40);
//Cruz
stroke(60, 60, 60);
fill(239, 238, 202);
rect(155, 150, -10, -130);
rect(115, 40, 70, 10);
strokeWeight(0.5);
fill(0, 10);
rect(0, 0, width, height);
for (int i=0; i<neve;i++) {
px[i] = width/2 + cos(radians(-angle[i])-randomSpawn[i])*(radius[i]);
py[i] = height/2 + sin(radians(-angle[i])-randomSpawn[i])*(radius[i]);
angle[i] -= speed; //(detersjovt at gange med i)
starSize[i] = starInitSize[i];
    //Uso do mouse
float mouseTjekX = px[i] - mouseX;
float mouseTjekY = py[i] - mouseY;
if (sqrt(sq(mouseTjekX) + sq(mouseTjekY)) <starInitSize[i]*2) {
// se apertar o mouse a neve fica colorida
println("star number: "+ i + "star size " +starInitSize[i]);
fill(random(0,255),random(0,255),random(0,255));
ellipse (px[i], py[i], starMarkedSize, starMarkedSize); 
}
      //se não continua como se nada tivesse acontecido
else {
fill(255);
ellipse (px[i], py[i], starSize[i], starSize[i]);
//nome
textAlign (RIGHT);
fill(255,0,0);
text("RAFAEL SANTIN 2013", 190, 190);
}
}
}
