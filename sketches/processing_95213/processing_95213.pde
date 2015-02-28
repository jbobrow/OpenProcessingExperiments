
int xm=-80;                  //coordenada x do marcador
int ym;                  //coordenada y do marcador
char [] abc = {' ','A', 'B', 'C', 'D', 'E','F', 'G', 'H', 'I', 'J', 'K', 'L', 'M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9','+','-','*', '/','=','?','!',',','.','t'};
int xtxt = 100;         //posição em x do texto que escreve
int ytxt = 440;         //posição em y do texto que escreve
int fps = 15;           //determina o frameRate
int intervalo = fps*2; //intervalo de 5 segundos para marcar a letra
PFont f;                //f 


void setup (){
size(800,600);
background(255);
frameRate(fps);
smooth();
f = createFont("DialogInput.bold", 60, true);

}

void draw(){
  teclado();    //desenha aos quadrados de 80x80
  marcador();   //quadrado cursor de 80x80 
  letras();     //desenha as letras de abecedário e os númelos
  escrever();   //escreve as letras abaixo do teclado
  textSize(12); 
  fill(190);
  text("Aperte qualquer tecla para mexer no cursor e espere 4 segundos para escrever a letra seleccionada", 10, 590);
  text("Feito em Processing - versão teste 1 - março 2013 - deloscampos@gmail.com", 10, 600);
  

}

void  keyPressed() {
frameCount=0;           //se o contador de frames para que nseja fixada uma letra qqr 
xm=xm+80;               //se aperto qqr tecla do teclado mexe o cursor +80 em x            
if (ym==320 && xm==800)  //se o marcador está na última casa
{ym=0; xm=-80;}
else if (ym ==400)         //se y do marcador é maior q 250
{ym= 0; xm=0;}             //marcador va pro topo ,letra A
else if (xm==800)          // se o x do marcador é maior de 790
{xm =0; ym = ym+80;}      //marcador desce uma linha
//else if(xm
}

void letras(){
 // 
  textFont(f);                 //altura das letras do array abc
  fill(50);                     //cor las letras
//text(letra, 15, 65); 
int n = 0;
int abcposx=15;                  //posição da letra A em x
int abcposy=65;                  //posição da letra A em y

while (n < 47) {                 //escreve cada letra do array abc no teclado desenhado na tela
text(abc [n], abcposx,abcposy);  //escreve a lenta n da lista abc 
n = n + 1;
abcposx = abcposx+80;            //cada letra se separa 80px da anterior
if (abcposx >=800)                      //se a posição da letra igual a 800
{abcposx = 15; abcposy = abcposy + 80;}  //desce uma linha (de 80px)
}
}

void escrever(){ 
  if (frameCount == intervalo){             //se passam tantos segundos sem keyPressed escreve 


for (int lin1 = 0; lin1<800; lin1=lin1+80) { 
 
  if (xtxt>780) {ytxt = ytxt+20; xtxt=100;} 
  if (xm==lin1 && ym==0) {
  textSize(20);
  text(abc [xm/80], xtxt,ytxt); xtxt=xtxt+14; xm=-80; frameCount = 0;
  }
  else if (xm==lin1 && ym==80) {
  textSize(20); 
  text(abc [xm/80+10], xtxt,ytxt); xtxt=xtxt+14; xm=-80; ym=0;  frameCount = 0;
  }
  else if (xm==lin1 && ym==160){
  textSize(20); 
  text(abc [xm/80+20], xtxt,ytxt); xtxt=xtxt+14; xm=-80; ym=0;  frameCount = 0;
  }
  else if (xm==lin1 && ym==240){
  textSize(20); 
  text(abc [xm/80+30], xtxt,ytxt);  xtxt=xtxt+14;  xm=-80; ym=0; frameCount = 0;
  }
  else if (xm==lin1 && xm < 480 && ym==320){
  textSize(20); 
  text(abc [xm/80+40], xtxt ,ytxt); xtxt=xtxt+14;   xm=-80; ym=0; frameCount = 0;
  }
    else if (xm==lin1 && xm >= 480 && ym==320){
  textSize(20); 
 // text(abc [xm/80+20], xtxt ,ytxt); xtxt=xtxt+14;   xm=-80; ym=0; frameCount = 0;
  }
   if (xtxt==780) {ytxt = 420; xtxt=100;}

}//for*/
  frameCount = 0;}
}//escrever function

void marcador(){
noStroke();
fill(5,200,0,50);
rect (xm,ym,80,80);

}
void teclado(){          //desenha a base para as letras do teclado
   stroke(140);
   fill(220);
   rect(0,0,800,400);
   int x=0;
   int y=0;
   while(x <= 800 ){
     line( x, 0, x, 400);
     x=x+80;
   }
   while(y <= 400) {
     line (0,y, 800,y);
     y = y+80;
   }
}


