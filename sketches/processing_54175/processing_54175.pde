
int windowSize = 600;            //tamaño de ventana (cuadrada)
int rowColNum = 10;              //retícula: número de filas x columnas
int padding = 20;                //espaciado entre columnas
int R = (windowSize / rowColNum ) - padding;               //tamaño resultante del cuadrado
color[] colores = {#FF9E00, #2A66DB, #262983, #FF0808};    //paleta de colores
float par1; float par2; float par3; float par4;            //parámetros para el dibujo
int aaa = 200;    //transparencia
 
void setup(){
rectMode(CORNER);
smooth();
background(255);
noStroke();
noLoop();
size(windowSize+padding,windowSize+padding);
}
 
void draw(){
//loops anidados i=filas j=columnas
for ( int i = 0; i < rowColNum; i++ ){
  for ( int j = 0; j < rowColNum; j++ ){
    //posición: situar la referencia para dibujar dentro de la matriz
    //de filas y columnas definida
    pushMatrix();
    translate(j*(windowSize/rowColNum)+padding,i*(windowSize/rowColNum )+padding);
     
    //asignar parámetros aleatorios para el dibujo
    par1 = R/3 + random(0.5)*R;
    par2 = R/3 + random(0.5)*R;
    par3 = R/3 + random(0.5)*R;
    par4 = R/3 + random(0.5)*R;
     
    //para cada color, dibujar un cuadrilátero
    fill(colores[2],aaa);
    quad(0,0,par1,abs(par3-par2),par2,par3,0,par4);
     
    fill(colores[1],aaa);
    quad(R,0,R,par1/2,par2/2,par3/2,par4/2,0);
    
    fill(colores[0],aaa);
    quad(R,R,par1-R/5,par3,par2,par3-R/5,R,par4-R/5);
     
    fill(colores[3],aaa);
    quad(0,R,R/2,R-par4,R,par3,par2-R/8,R);
    popMatrix();
  }
}
//guardar imagen
//saveFrame();
 
}

