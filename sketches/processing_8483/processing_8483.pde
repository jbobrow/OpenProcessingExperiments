
PImage[] source = new PImage[8];

int imageIndex = 0;

class Riscos{
  
  Riscos(){}

void carrega(){
//Carregando imagens com nomes numerados
for(int i=0; i<source.length; i++){
  source[i] = loadImage("derivas" +i+ ".gif");

  }
}  

void probabilidadeCoisa(){
//probabilidade no aparecimento das imagens
//substitui o simples aparecimento randômico: int imageIndex = int(random(source.length)); 
float num = random(1);
float linha = 0.1;
float bloco = 0.9;

if (num < bloco){
  imageIndex = int(random(0,3));
}else{
  imageIndex = int(random(4,8));
}
}


void probabilidadeLugar0(){
//mostra a imagem de destino em lugares aleatórios segundo probabilidades:
//aparecem menos imagens em lugares mais longe do centro
// fixa x e y em um valor que nao ultrapasse as margens inferior e direita 
float x;
float y;
int w = source[imageIndex].width;
int h = source[imageIndex].height;
float num = random(0.3);
float centro = 0.1;
float casca = 0.1;
float fora = 0.1;
if (num<centro){
  x = random(290, 490);
  y = random(190, 390);
}else if(num<centro+casca){
  x = random(170, 630-w);
  y = random(70, 530-h);
}else{
  x = random(0, width-w);
  y = random(0, height-h);
}
image(source[imageIndex], x, y);
}

void probabilidadeLugar1(){
//mostra a imagem de destino em lugares aleatórios segundo probabilidades:
//aparecem menos imagens em lugares mais longe do centro
// fixa x e y em um valor que nao ultrapasse as margens inferior e direita 
float x;
float y;
int w = source[imageIndex].width;
int h = source[imageIndex].height;
float num = random(0.3);
float centro = 0.05;
float casca = 0.15;
float fora = 0.15;
if (num<centro){
  x = random(350, 450-w);
  y = random(80, 260-h);
}else if(num<centro+casca){
  x = random(240, 560-w);
  y = random(20, 560-h);
}else{
  x = random(0, width-w);
  y = random(0, height-h);
}
image(source[imageIndex], x, y);
}

void probabilidadeLugar2(){
//mostra a imagem de destino em lugares aleatórios segundo probabilidades:
//aparecem menos imagens em lugares mais longe do centro
// fixa x e y em um valor que nao ultrapasse as margens inferior e direita 
float x;
float y;
int w = source[imageIndex].width;
int h = source[imageIndex].height;
float num = random(0.3);
float centro = 0.1;
float casca = 0.15;
float fora = 0.05;
if (num<centro){
  x = random(70, 300-w);
  y = random(60, 290-h);
}else if(num<centro+casca){
  x = random(10, 620-w);
  y = random(10, 620-h);
}else{
  x = random(0, width-w);
  y = random(0, height-h);
}
image(source[imageIndex], x, y);
}
 
void probabilidadeLugar3(){
//mostra a imagem de destino em lugares aleatórios segundo probabilidades:
//aparecem menos imagens em lugares mais longe do centro
// fixa x e y em um valor que nao ultrapasse as margens inferior e direita 
float x;
float y;
int w = source[imageIndex].width;
int h = source[imageIndex].height;
float num = random(1);
float centro = 0.35;
float casca = 0.35;
float fora = 0.3;
if (num<centro){
  x = random(150, 300);
  y = random(40, 200);
}else if(num<centro+casca){
  x = random(440, 670-w);
  y = random(330, 560-h);
}else{
  x = random(0, width-w);
  y = random(0, height-h);
}
image(source[imageIndex], x, y);
}

void probabilidadeLugar4(){
//mostra a imagem de destino em lugares aleatórios segundo probabilidades:
//aparecem menos imagens em lugares mais longe do centro
// fixa x e y em um valor que nao ultrapasse as margens inferior e direita 
float x;
float y;
int w = source[imageIndex].width;
int h = source[imageIndex].height;
float num = random(1);
float centro = 0.4;
float casca = 0.35;
float fora = 0.25;
if (num<centro){
  x = random(0, width-w);  
  y = random(random(0, 60-h),random(540, 600-h));
}else if(num<centro+casca){
  x = random(0, width-w);
  y = random(random(60, 200-h),random(400, 540-h));
}else{
  x = random(0, width-w);
  y = random(200, 400);
}
image(source[imageIndex], x, y);
} 

void probabilidadeLugar5(){
//mostra a imagem de destino em lugares aleatórios segundo probabilidades:
//aparecem menos imagens em lugares mais longe do centro
// fixa x e y em um valor que nao ultrapasse as margens inferior e direita 
float x=100;
float y=110;
int w = source[imageIndex].width;
int h = source[imageIndex].height;
float num = random(1);
float centro = 0.3;
float fora = 0.7;
if (num<centro){
for (int i=0; i<541; i+=180){
  for (int j=0; j<241; j+=240){
  int W = 65;
  int H = 170;
  image(source[imageIndex], random((x+i),(x+i+W-w)), random((y+j),(y+j+H-h)));}
}
}else{
  x = random(0, width-w);
  y = random(0, height-h);
  image(source[imageIndex], x, y);
 }
} 



}

