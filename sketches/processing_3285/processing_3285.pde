
//valores de interaccion - valor de posicion que tiene cada circulo verde 
 int  val_1 = 0; //turno = 0
 int  val_2 = 0; //turno = 1
 int  val_3 = 0; //turno = 2
 int  val_4 = 0; //turno = 3
 int  val_5 = 0; //turno = 4
 int auxval = 0;//guarda temporalmente el valor que devuelve f_turno
   
 // flags de ejecucion
 boolean flag1 = true;
 boolean flag2 = true;
 boolean flag3 = true;
 boolean flag4 = true;
 //boolean flag5 = true;
 //
 
// VARIABLES GLOBALES
  int posicion = 0; // posicion = (posicion % 15);
  int turno = 0; // 
  int contador_tiempo = 0; //contador de frames frameCount
// notas
  int[] nota1 = {0,0,0,0};
  int[] nota2 = {0,0,0,0};
  int[] nota3 = {0,0,0,0};
  int[] nota4 = {0,0,0,0};
  int[] nota5 = {0,0,0,0};
// MATRIZ KERNEL 
int KERNEL[][] = {
                 {60,60,60,60,60,60,60},
                 {60,60,60,60,60,60,60},
                 {60,60,60,60,60,60,60},
                 };


//
float friccion = 0.96 ; // desacelera el movimiento de los objetos
//
int velo = 1; // es el velor para dividir la duracion en frames de las notas
//
boolean continua = false;
// fin pantalla
int limite = 70; 
// 
boolean clk = false;
 

