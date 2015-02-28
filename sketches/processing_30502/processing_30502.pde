
//definir variavel do espaco entre circulos. Quanto maior o numero, mais espacado fica.
int espacador = 27;
//definir tamanho da tela, modo de cor, velocidade a que o loop corre, e suavidade das formas 
void setup(){
  size ( 400, 400);
  colorMode (RGB);
  frameRate (10);
  smooth ();
}
//definir cor de fundo. funcao que desenha as bolas. 
void draw(){
  background(13,1,26);
  for (int y = 0; y < height; y += espacador){
    for (int x = 0; x < width; x += espacador){ 
  stroke(136,188,222);
     
      bolas(x,y);
    }
  }
}
//definir a variavel das bolas.    
void bolas (int _x, int _y){
float d = dist(0, 0, _x, _y); 
float a= noise(345);
float b= noise (45);
 
//definir translacao, rotacao aleatoria, tamanho aleatorio das formas, e cor aleatoria.
pushMatrix();{
  translate(_x,_y);
rotate(random (56));
fill(random(255), random (255), random (255), random (255));
noStroke();
ellipse(a,b,random(34,229),random(34));
 
}
popMatrix();
}
                                
