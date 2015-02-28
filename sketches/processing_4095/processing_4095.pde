
/** 
 * <strong> Proyecto LC0: Rotación de Cubos Tanslúcidos 3D <strong>  
 *Por Antonia Biotti. 
 * Proyecto de Interacción. 
 *<strong> Descripción General <strong> 
  <p> Los cubos van rotando en diferentes tiempos creando el efecto de una estela a su alrededor (utilizando la función 
  translate, los cubo estan centrados en la ventana según los ejes x e y, y giran según la velocidad de rotación dada por 
  la función rotate) . Al hacer "click" con el botón izquierdo del mouse, en cualquier lugar de la imagen, los cubos harán 
  zoom dejándonos apreciar su interior con mayor claridad y cercanía. Al soltar el botón del mouse, los cubos se alejarán 
  volviendo a tu posición inicial (por la función mousePressed). 
  Los cubos están insertos en una imagen de fondo que ayuda al efecto de rotación de lo cubos dando una mayor luminosidad  
  a la imagen (la imagen es cargada por la función PImage y definida como fondo por background).<p> 
 */ 
 
 // Inspirado en los "examples" de processing y el sketch "rgb-dot-cube" de DeadDealer. 
  
 PImage fondo; 
 
  int dimension=15;  
  int sizeBox = 90;                 // Tamaño de los cubos 
  float a;                          // Angulo de rotacion de los cubos 
  float offset = PI/24.0;           // Angulo entre los cubos 
  int num = 10;                     // Cantidad de cubos 
  color[] colors = new color[num];  // Colores de lo cubos 
  
 void setup() {  
   
  size(640, 360, P3D); 
  fondo = loadImage("fondo.jpg");    // Imagen de fondo 
  colorMode(RGB, dimension);  
  for(int i=0; i<num; i++) { 
    colors[i] = color(255 * (i+1)/num); 
  } 
 }  
  
 
 void draw() {   
   
  background(fondo);  
  translate(width/2, height/2,0);      // Posición de los cubos en el centro de la ventana 
  rotateX(millis()*0.0004);  
  rotateY(millis()*0.0007);  
  strokeWeight(4.5);           // Líneas de las aristas de los cubos 
  a += 0.01;                   // Velocidad de rotación    
   
  for(int i = 0; i < num; i++) { 
  pushMatrix(); 
  fill(0,2);               // Color de los cubos 
  rotateY(a + offset*i); 
  rotateX(a/2 + offset*i); 
  
  //Zoom al hacer click 
  if (mousePressed == true){          
  sizeBox ++;    
  } else { 
  sizeBox -= 0.5;    // Aumenta el tamaño del los cubos logrando el efecto de zoom 
  sizeBox = 90;      // Vuelve a su tamaño inicial 
} 
 
    box(sizeBox); 
    popMatrix(); 
    drawFoo(); 
  } 
}  
 
 
  void drawFoo() {  
    
  translate(-dimension/2*offset, -dimension/2*offset, -dimension/2*offset);  
   for (int x=5; x<dimension; x++) { 
    for (int y=6; y<dimension; y++) {  
      for (int z=9; z<dimension; z++) {  
         if (x <= 0 || x > dimension - 2 || x % 8 == 0 ||  
             y <= 0 || y > dimension - 2 || y % 8 == 0 ||  
             z <= 0 || z > dimension - 2 || z % 8 == 0) {  
          stroke(x, y, z, 3);  
                     
       }  
      }  
    }  
  }  
}  
  


