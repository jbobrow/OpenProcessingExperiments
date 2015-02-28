
//definir as variáveis float, com nomes definidos
float linhaX = 0;
float quadrado=5;
float diametro=10;
 
//definir tamanho da tela, suavidade das formas, modo de cor, e fundo 
void setup(){
size(400,400);
smooth();
colorMode(HSB,255);
background(255);
}

//definir o início da polarização (do centro) e consequente translacao
//definir random de cores, e grossura
void draw(){
 
translate(width/2,height/2);
rectMode(CENTER);
 
noFill();
stroke(random(255),100+random(55),150 +random(55));
strokeWeight(5+random(10));
   

linhaX +=1;
 
linhaX=linhaX % width;
 
//definir a forma (quadrado), e consequente rotacao
for(int i=0;i< quadrado; i++){
   
  rotate(TWO_PI/quadrado+random(10));
rect(linhaX,linhaX,diametro+random(5),diametro+random(3));
}
 
 
 
}
                                
