
float subida;//posiçao y da bola
float x; //posiçao x da bola

float vel; //volucidade das bolas
float count; //contagem das jogadas
PImage nivel3;
PImage moldura;
PImage losearea;
PImage perdeu;//aparece quando deixa chegar a bola ao topo


//nivel3-----------------------------------------------------------------------
float x2; //posiçao x da 2ª bola
float subida2;//posiçao y da 2ª bola
float vel2; //volucidade da 2ºda bola
//----------------------------------------------------------------------------



int bolastartX;
int bolastartY;








void setup(){
smooth();
size(1200,600);

//inicio das variaveis
subida=565;
x = 50; 
vel = 0; 
count = 575 ; 



//nivel3--------------------------------------------------------
x2 = 850;  
subida2=565;
vel2 = 0;
//--------------------------------------------------------------------------------


  //start
 bolastartX= 450;
 bolastartY= height/2;
 
//load da imagems
nivel3 = requestImage("nivel3.jpg");
moldura = requestImage("moldura.png");
losearea= requestImage("losearea.jpg");
perdeu = requestImage("perdeu.png");
}

void draw(){

background(255); 
//condicao do carregamenro da imagem
  if (nivel3.width == 0) {
    // Image is not yet loaded
  } else if (nivel3.width == -1) {
    // This means an error occurred during image loading
  } else {
    // Image is ready to go, draw it
    image(nivel3, 0, 0);
  }
   image(losearea, 0,-540);
   image(moldura, 0, 0);
   
                                        //start
   fill( 50);            
   ellipse (bolastartX, bolastartY, 100,100);  
   fill( 200); 
   triangle(bolastartX-20, bolastartY+25, bolastartX-20, bolastartY-30, bolastartX+35, bolastartY);


  
fill(153,0,153);
//condçao que torna a bola vermelha se chegar ao topo
if(subida<40) {
fill(153,0,0);
  //e mostra a imagem "perdes-te"
}

//nivel3------------------------------------------------------------------------------------------------

//condçao que torna a 2ª bola vermelha se chegar ao topo
if(subida2<40) {
fill(153,0,0);
 //e mostra a imagem "perdes-te"
}
//----------------------------------------------------------------------------------------------









/*condiçao: se os valores do rato(x e Y) estiverem na mesmas 
coodenadas da bola:
-a bola volta a sair de baixo = y650
-sai de uma posiçao x random
-a variavel da veloçidade incrementa = a bola sobe mais depresssa
-e encrementa a varial count = contagem das bolas que apanhas-te
*/
if( mouseX >x-20 && mouseX <x+20 && mouseY <subida+20  && mouseY > subida -20) 
{subida=565;
x = random (50,870);
vel = vel + 0.1;
count = count-5.5; 

;}

//bola de jogo
ellipse(x,subida,40,40);

subida=subida-vel;

//nivel3  ----------------------------------------------------------------------------------------------


if( mouseX >x2-20 && mouseX <x2+20 && mouseY <subida2+20  && mouseY > subida2 -20) 
{subida2=565;
x2 = random (50,870);
vel2 = vel2 + 0.1;
count = count-5.5; 

;}

//2ªbola de jogo

fill(240,255,0);
ellipse(x2,subida2,40,40);

subida2=subida2-vel2;
//---------------------------------------------------------------------------------------



/*bola da pontução que sobe consuante o incremeto da variavel count = a bola 
sobe conforme as bolas que acertamos*/
fill(153,0,0);
ellipse(900,count,15,15);


/*condiçao:se a bola chegar ao topo:
-a posiçao y vai para 50 = a bola para la no topo
-contagem volta a 0*/
if(subida<40) {
subida=40;
subida2=40;
vel=0.5;
vel2=0.5;
image(perdeu, 350, 350);  
}


//nivel3------------------------------------------------------------------------------------------------

/*condiçao:se a 2ª bola chegar ao topo:
-a posiçao y vai para 50 = a bola para la no topo
-contagem volta a 0*/
if(subida2<40) {
subida2=40;
subida=40;
vel2=0.5;
vel=0.5;
image(perdeu, 350, 350); 
}
//----------------------------------------------------------------------------------------------



println(subida);
println(count); 

}


void keyPressed() {
  
  if (key == 's') { // 1º se for premida a tecla espaço 
  
   vel=0.5;
    bolastartX= 2000;
     bolastartY= 2000;
  } 
  
  if (key == ' ') { // 1º se for premida a tecla espaço 
  
   count = 575;
   vel=0.5;
   subida=565;
      subida2=565;
     
  } 
}

void mousePressed() {
  
if (mousePressed == true &&  mouseX >bolastartX-50 &&mouseX <bolastartX+50 && mouseY <bolastartY+50  && mouseY > bolastartY -50) {
    vel=0.5;
      vel2=0.5;
    bolastartX= 2000;
     bolastartY= 2000;
 
}
}


