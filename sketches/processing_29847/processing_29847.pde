
float subida;//posiçao y das bolas
float x; //posiçao x das bolas
float vel; //volucidade das bolas
float count; //contagem das jogadas

                      //nivel 4-------------------------------------------------------
                        float descendo;
                        float perder;
                      //------------------------------------------------------------------
PImage nivel4;
PImage moldura;
PImage losearea;
PImage perdeu;//aparece quando deixa chegar a bola ao topo

int bolastartX;
int bolastartY;
                                                                                  //gate------------------------
                                                                                          boolean start; 


void setup(){
smooth();
size(1200,600);

//inicio das variaveis
subida=565;
x = 50;    
vel = 0; 
count = 575 ; 


                                                                                          //gate------------------------
                                                                                                  start = false; 
             //nivel 4-------------------------------------------------------
                  descendo=-540;
                  perder=40;
             //-------------------------------------------------------------------

  //start
 bolastartX= 450;
 bolastartY= height/2;
 
//load da imagems
nivel4 = requestImage("nivel4.jpg");
moldura = requestImage("moldura.png");
losearea= requestImage("losearea.jpg");
perdeu = requestImage("perdeu.png");
}

void draw(){

background(255); 
//condicao do carregamenro da imagem
  if (nivel4.width == 0) {
    // Image is not yet loaded
  } else if (nivel4.width == -1) {
    // This means an error occurred during image loading
  } else {
    // Image is ready to go, draw it
    image(nivel4, 0, 0);
  }
  
                        //nivel 4-------------------------------------------------------
                           image(losearea, 0,descendo);
                        // -------------------------------------------------------------------------
  
   image(moldura, 0, 0);
   
   
                                        //start
   fill( 50);            
   ellipse (bolastartX, bolastartY, 100,100);  
   fill( 200); 
   triangle(bolastartX-20, bolastartY+25, bolastartX-20, bolastartY-30, bolastartX+35, bolastartY);


  
fill(153,0,153);
//condçao que torna a bola vermelha se chegar ao topo


             //nivel 4-------------------------------------------------------
                 if(subida<perder) {
fill(153,0,0);
image(perdeu, width/2-265, height/2-100);    //e mostra a imagem "perdes-te"

}




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

/*bola da pontução que sobe consuante o incremeto da variavel count = a bola 
sobe conforme as bolas que acertamos*/
fill(153,0,0);
ellipse(900,count,15,15);


/*condiçao:se a bola chegar ao topo:
-a posiçao y vai para 50 = a bola para la no topo
-contagem volta a 0*/
if(subida<perder) {
subida=40;
vel=0.5;

   //nivel 4-------------------------------------------------------
                  descendo=-540;
                  perder=40;
}





subida=subida-vel;
println(subida);
println(count); 

   //nivel 4-------------------------------------------------------
                                     //gate------------------------          
                                              if ( start == true ){
                                                descendo=descendo+0.1;
                                               perder=perder+0.1;
                                                               }
                       
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
     
  } 
}

void mousePressed() {
  
if (mousePressed == true &&  mouseX >bolastartX-50 &&mouseX <bolastartX+50 && mouseY <bolastartY+50  && mouseY > bolastartY -50) {
    vel=0.5;
    bolastartX= 2000;
     bolastartY= 2000;
                                                                                      //gate------------------------
                                                                                               start = true; 
     
     
   

            
 
}
}


