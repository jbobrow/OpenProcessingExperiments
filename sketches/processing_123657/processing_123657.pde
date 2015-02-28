
void setup(){
size(500,400);
}

int y;
void draw () {
noStroke();  
if(mouseY>width/2){
background(5,5,5);}// tela preta
else{
background(20,32,95); //azul ceu
fill(255); // Lua
ellipse(60,60,50,50);
noStroke();
fill(20,32,95); // meia lua
ellipse(70,50,50,50);
fill  (14,64,20); // gramado
rect (0,335,500,400);
fill(18,21,80); // nuvem
ellipse(300,50,120,40);
ellipse(180,50,120,40);
ellipse(220,30,160,50);
noStroke();
fill (80,31,15); // tronco árvora
rect (20, 255, 5, 80);
rect (85, 255, 5, 80);
fill (48,144,60); //copa árvora
ellipse (20,240,60,90);
ellipse (85,240,70,90);
fill(203,201,146); //parede casa
rect(250,170,210,170,20);
fill(142,139,136); //telhado
triangle(215,200,360,100,490,200);
fill(178,29,13); //porta
rect(270,250,50,90);
fill(240,232,73); //janela
quad(370,230,370,280,430,280,430,230);
for (int i = 2; i < 90; i = i+8) {
noStroke(); //piscas do telhado
fill(random(300), random(150), random(300),random(255));
ellipse(i+260,190,10,10);
}
for (int i = 5; i < 90; i = i+8) {
noStroke();
fill(random(200), random(150), random(200),random(255));
ellipse(i+355,190,10,10);
{
stroke(200);
point(random(0,500),random(0,335));} // estrelas
}
}}










