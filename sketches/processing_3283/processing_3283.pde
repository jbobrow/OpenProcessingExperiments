
/* 
 COTILLON
basado en sketch de Herbert Spencer
  
 en este ejemplo las rotaciones son acumulativas usando arreglos 
 */ 
 
int margen = 20;  // margen del dibujo 
int esp = 30;     // espaciador 
int numElements;  // total de hélices 
float[] punto;    // nuevo arreglo para almacenar las rotaciones 
int counter = 0;  // contador para recorrer el arreglo de puntos 
 
 
void setup(){ 
  size(600, 600); 
   
  /* calcular cuantas hélices existen. 
  Como esta variable es un int, los números están cuidadosamente asignados 
  para que el resultado no tenga parte decimal */ 
   
  numElements = ((width-margen)/esp) * ((height-margen)/esp); 
  // println(numElements); /* para saber el número de elementos */ 
   
  // inicializar el arreglo de floats "puntos" 
  punto = new float[numElements]; 
  fill(#E8CF3F,120); 
  stroke(#2FA8DE); 
  smooth(); 
} 
 
void draw(){ 
  background(#AADED6); 
  for (int y = margen; y < height-margen; y += esp){ 
    for (int x = margen; x < width-margen; x += esp){ 
      helix(x, y, counter); 
      counter++; 
    } 
  } 
  counter = 0; 
} 
 
void helix(int _x, int _y, int rot){ 
   
  // calcula la distancia ente el mouse y las coordenadas de entrada 
  float d = dist(mouseX, mouseY, _x, _y);  
   
  pushMatrix(); 
  { // resetea el sistema de coordenadas 
    translate(_x , _y); 
     
    /* la rotación de cada hélice se incrementa en una 
    cantidad proporcional a la distancia 'd' (entre su posición y el mouse) 
    acumulando diferencias entre cada una de ellas */ 
     
    punto[rot] += d/2; 
    rotate(punto[rot]); 

     
    // el eje 
    stroke(#2FA8DE); 
    line(-esp/3, 2, esp/3, 0);  
     
    // las aspas 
    stroke(49); 
    triangle(esp, 6, 10, 8,36,20); 
    triangle(esp/2, 10, 6, 6,35,40); 
    
    // mas cotillon
   
   stroke(#A53C9E); 
   line (39, 4, 12, 0);
  

  } 
  popMatrix(); 
} 
 


