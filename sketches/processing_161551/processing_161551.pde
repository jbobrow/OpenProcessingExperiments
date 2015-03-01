
////variables para matriz de binarios
int fil=256;//capacidad por numero de bits/leds 2^numero de bits
int col=8;//numero de bits/leds
int numero=0;
int j=0;
/////////////////
////variables para placa de leds
int rleds=250;/*radio de los leds*/
int rcuad=235;
int rtex =240;
int x1=280+(50*(col));
/////////////////////////
int [][]A = new int [fil][col];
void setup(){
//////////placa con los leds/// es variar los leds al variar "col"
size(x1,350);
background(0);
smooth();
/////TEXTO
//TITULOS
fill(#DBC245);
textSize(35); 
text("DECIMAL", 20, 65);
text("BINARIO", 20, 165);
text("LEDS", 20, 265);
//// CAJAS BINARIOS
for (int xi=1;xi<=col;xi++/*tamaño en leds*/ ){
fill(#FFFFFF);
rect(rcuad,135,30,30);
rcuad=rcuad+50;
}
///// CAJA DECIMALES
fill(#FFFFFF);
rect(240,35,200,30);
/////ELLIPSE/ LEDS VIRTUALES
for (int xi=1;xi<=col;xi++/*tamaño en leds*/ ){
fill(#FFFFFF);
ellipse(rleds,250,30,30);
rleds=rleds+50;
}
////aclaracion encendido/apagado
textSize(15); 
fill(#FFFFFF);
text("cero", 450, 315);
fill(#FFFFFF);
ellipse(550,310,20,20);
fill(#FFFFFF);
text("uno", 250, 315);
fill(#FF0004);
ellipse(350,310,20,20);
/////////////////
frameRate(5);//velocidad de iteraccion
////////creacion de la matriz de binarios en orden acendente   
  for(int j=0;j<fil;j++){
  numero=j;
  for(int i=col-1;i>=0;i--){
    if(numero%2==0){
      A[j][i]=0;
    }
    if(numero%2==1){
      A[j][i]=1;
    }
    numero=numero/2;
  }
  }
///////////////////////////////////////////////
////////imprecion de la matriz sobre la consola 
  for(int j=0;j<fil;j++){
            for(int i=0;i<col;i++){
                  print(A[j][i]);
                  }
                  println();
            }
///////////////////////////////////////////////////

}
void draw(){
if(j<fil){
/////cajas binarios
rcuad=235;
for (int xi=1;xi<=col;xi++/*tamaño en leds*/ ){
fill(#FFFFFF);
rect(rcuad,135,30,30);
rcuad=rcuad+50;
}
////////CAJA DECIMAL
fill(#FFFFFF);
rect(240,35,200,30);
fill(#000000);
textSize(30); 
text(j, 300, 61);
////////////lectura de datos para accionar leds
  rleds=250;
  rtex=240;
  for(int i=0;i<col;i++){
    if(A[j][i]==1){
    fill(#FF0004);
    ellipse(rleds,250,30,30);
    fill(#000000);
    textSize(30); 
    text("1", rtex, 162);
    }
    if(A[j][i]==0){
    fill(#FFFFFF);
    ellipse(rleds,250,30,30);
    fill(#000000);
    textSize(30); 
    text("0", rtex, 162);
    }
    rleds=rleds+50;
    rtex=rtex+50;
  }
  j=j+1;
////////
}
else{
background(0);
fill(#FF0004);
textSize(30); 
text("el decimal maximo para este conteo es: ", 20, 300);
text(fil-1, 600, 300);
text("decimal maximo a convertir : ( 2 ^   ", 20, 340);
text(col,525, 340);
text(" ) - 1 ", 540, 340);
}
}
