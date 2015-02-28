
  float r,g,b; // variaveis para a cor do triangulo
  float diametro; // variavel para o diametro (tamanho) do circulo
  float posX, posY; // variaveis para a posição horizontal e vertical dos objectos
  float tamanho;//variaveis para o tamanho do objecto
 
void setup()//comando setup
{
  size(500,500);//define o tamanho da janela
  background(255);
  smooth();//suaviza as formas
  noCursor();//esconde o cursor do rato na nossa janela
  frameRate(100);//define o numero de fotos por segundo na janela, mexe assim com a velocidade  
}

void draw()//comando de desenho
{
  stroke(50);//comando para o outline das figuras
  
  r=random(255);//cria um valor para a cor vermelha entre 0 e 255
  g=random(255);//cria um valor para a cor verde entre 0 e 255
  b=random(255);//cria um valor para a cor azul entre 0 e 255
  
  fill(r,g,b);//preenchimento com as cores rgb
  
  triangle(random(-50,250),random(-50,250),random(-50,250),random(-50,250),random(-50,250),random(-50,250));//desenha triangulos aleatorios
  
  posX=random(275,500);//posX representa a posição do objecto no eixo do X logo aqui vai ser um random entre 275 e 500 px
  posY=random(0,200);//posY representa a posição do objecto no eixo do y logo aqui vai ser um random entre 0 e 200 px
  diametro=random(5,100);//aqui o vai ser definido o diametro do circulo, que vai variar entre os 5 e os 100 px
  ellipse (posX, posY, diametro, diametro);//desenhar a elipse com os valores gerados e usando todas as variaveis criadas anteriormente
  
  posX=random(250,500);//novos valores para a localização do objecto no eixo do X
  posY=random(250,500);//novos valores para a localização do objecto no eixo do Y
  rect(posX,posY,diametro,diametro);//desenhar o quadrado com os valores gerados e usando todas as variaveis criadas anteriormente
  
  posX=random(0,250);//novos valores para a localização do objecto no eixo do X
  posY=random(250,500);//novos valores para a localização do objecto no eixo do Y
  line(posX,posY,random(250),posY);//desenhar as linhas com os valores gerados e usando todas as variaveis criadas anteriormente
}  

