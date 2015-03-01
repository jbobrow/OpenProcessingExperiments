
//Paula Buffone
//Dibujo de Damero utilzando variables
//Trabajo realizado partiendo de lo resuelto por Pinto Rocío Anyelén. 
//Investigación en los ejmplos ofrecidos por www.biopus.com.ar; www.processing.org; www.openprocessing.org


//variables que definen el máximo de columnas (y) y filas (x)
int columnas = 8;
int filas = 8;
//tamaño de casillero
int ladoDeCuadro = 60;

//eje X del damero
int ladoDeDameroX = filas * ladoDeCuadro;
//eje Y del damero
int ladoDeDameroY = columnas * ladoDeCuadro;

//las medidas utilizadas en las variables me darán el tamaño total del damero
size(ladoDeDameroX,ladoDeDameroY);
//recorro la coordenada de Y para dibujar los cuadros
for(int c=0 ; c<columnas ; c++){ 
for(int i=0 ; i<filas ; i++){
//dibujo el casillero
rect( i * ladoDeCuadro , c * ladoDeCuadro , ladoDeCuadro , ladoDeCuadro ); 

//Pinto de negro los casilleros pares
if( (i+c) % 2 == 0 ){
fill( 0 );
//pinto azarosamente de distintos colores el resto de los casilleros
}else{

fill( random(255),random(255),  random(255));

}
rect( i * ladoDeCuadro , c * ladoDeCuadro , ladoDeCuadro , ladoDeCuadro );

}
}


  
