
void setup(){//elementos estaticos e continuos

size(700,700);//definiçao da area de trabalho
background(255);//definiçao da cor de trabalho
PImage b;// Definiçao da image como b
b = loadImage("Annex - Grant, Cary (Arsenic and Old Lace)_05.jpg");//upload de imagem para data para a visualizaçao
image(b, -250, 0);//posicionamento da imagem 
PFont font;//Definiçao da imagem como font
font = loadFont("ArialMT-48.vlw"); //upload de font para data ,para a visualizaçao
textFont(font, 40); //defeniçao do tamanho da letra
text("Será que devemos recear o futuro?", 30, 150);//posicionamento da texto e a definiçao do mesmo 
noLoop();//ausencia de movimento
}
void draw(){// elementos em continua mudança
noStroke();// nao controno 
fill(random(0,255));//criaçao de preenchimento em tons cinza
quad(width/2+160,height-280,width/2+80,height-340,width/2+160,height-400,width/2+240,height-340);//quadrado tons cinza mais afastado entre beges
quad(width/2,height-400,width/2-80,height-460,width/2,height-520,width/2+80,height-460); //quadrado tons cinza entre verdes mais afastado de tudos
quad(width/2-160,height-280,width/2-240,height-340,width/2-160,height-400,width/2-80,height-340); //quadrado tons cinza entre amarelos mais afastado


fill(random(0,255));//criaçao de preenchimento em tons cinza
quad (width/2,height-120 ,width/2+80,height-60,width/2+80,height-140,width/2,height-200 );//quadrado tons cinza entre beges mais centrado 
fill(211,186,137);//criaçao de preenchimento
quad (width/2+80,height-220,width/2,height-160,width/2,height-80,width/2+80,height-140 );//quadrado bege junto ao amarelo
fill(random (0,255));//criaçao de preenchimento em tons cinza
quad (width/2+80,height-300,width/2,height-360,width/2,height-280,width/2+80,height-220 ); //quadrado tons cinza entre  verde e amarelo 

fill(211,186,137);//criaçao de preenchimento
quad (width/2+80,height-60 ,width/2+160,height-120,width/2+160,height-200,width/2+80,height-140 );//quadrado bege mais baixo
quad (width/2+160,height-280,width/2+80,height-220,width/2+80,height-140,width/2+160,height-200 ); //quadrado bege no meio dos beges
quad (width/2+160,height-360,width/2+80,height-300,width/2+80,height-220,width/2+160,height-280 ); //quadrado bege junto ao quadrado verde
quad (width/2+240,height-340,width/2+160,height-280,width/2+160,height-200,width/2+240,height-260 );//quadrado bege mais afastado 

fill(random (0,255));//criaçao de preenchimento em tons cinza
quad (width/2+160,height-480,width/2+80,height-420,width/2+80,height-340,width/2+160,height-400 ); //quadrado tons cinza entre  verdes mais proximo

fill(random (0,255));//criaçao de preenchimento em tons cinza
quad (width/2,height-120 ,width/2-80,height-60,width/2-80,height-140,width/2,height-200 );//quadrado tons cinza entre amarelos em baixo 
fill(255,249,62);//criaçao de preenchimento
quad (width/2-80,height-220,width/2,height-160,width/2,height-80,width/2-80,height-140 ); //quadrado amarelo mais proximo de nos 
fill(random (0,255));//criaçao de preenchimento em cinza
quad (width/2-80,height-300,width/2,height-360,width/2,height-280,width/2-80,height-220 ); // quadrado tons cinza  junto ao amarelo e verde

fill(255,249,62);//criaçao de preenchimento
quad (width/2-80,height-60 ,width/2-160,height-120,width/2-160,height-200,width/2-80,height-140 );// quadrado amarelo alinha com os dois seguintes
quad (width/2-160,height-280,width/2-80,height-220,width/2-80,height-140,width/2-160,height-200 ); //quadrado amarelo no centro dos amarelos
quad (width/2-160,height-360,width/2-80,height-300,width/2-80,height-220,width/2-160,height-280 ); // quadrado amarelo junto ao verde
quad (width/2-240,height-340,width/2-160,height-280,width/2-160,height-200,width/2-240,height-260 );  // quadrado amarelo mais afastado na horizontal

fill(random(0,255));//criaçao de preenchimento em cinza
quad (width/2-160,height-480,width/2-80,height-420,width/2-80,height-340,width/2-160,height-400 );//quadrado tonz cinza perto verde mais afastado na horizontal

fill(random(0,255));//criaçao de preenchimento  em cinza
quad(width/2,height-160,width/2-80,height-220,width/2,height-280,width/2+80,height-220);// quadrado tons cinza  junto ao amarelo e bege

fill(186,224,72);//criaçao de preenchimento
quad(width/2-80,height-300,width/2-160,height-360,width/2-80,height-420,width/2,height-360);// quadrado verde junto ao amarelo
quad(width/2+80,height-300,width/2,height-360,width/2+80,height-420,width/2+160,height-360);// quadrado verde junto ao bege
quad(width/2,height-360,width/2-80,height-420,width/2,height-480,width/2+80,height-420);// quadrado verde no centro dos verdes
quad(width/2-80,height-420,width/2-160,height-480,width/2-80,height-540,width/2,height-480); // quadrado verde mais afastado na horizontal
quad(width/2+80,height-420,width/2,height-480,width/2+80,height-540,width/2+160,height-480);// quadrado verde mais afastado na vertical 



}


