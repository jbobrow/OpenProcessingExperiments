
/** "Ritoque" por Bernardo Silva C.
En este trabajo,el proposito es representar el arte impresionista,
por medio de bectores,simulando pinceladas(puntillista)y los tonos.
En este caso yo eleji al señor Henri Edmond Cross ,guiandome de su cuadro
River in Saint-Clair(1908).
*/

PImage ciudadAbierta;//funcion que permite cargar una foto.
  
void setup (){  
  size (682,511);  //tamaño de la imagen.
  ciudadAbierta=loadImage ("ritoque.jpg");//carga la imagen agregada al sketch. 
  colorMode(HSB, 255);//funcion para los colores(hue,saturation,brightness)
  background (255); 
  noStroke();//no contorno  
  noLoop();  
  smooth();//suavizado  
}  
  
  
void draw(){  
  int a=4;  
  for (int y=0; y<height; y+=a){  
    for (int x=0; x<width; x+=a){  
      color c = ciudadAbierta.get(x,y);  
      pincelTotal(x,y,c,a);  
    }  
  }  
}  
  
void pincelTotal(int x, int y, int c, int p){// técnica del pincel
  int pincel=round (random(6,4));  
  for(int e = 0; e <= pincel; e++){//esquema de color de la pincelada
    float h = hue(c) + random(-10, 20);  
    float s = saturation(c) + random(50); //función de saturación del color 
    float b = brightness(c) + random(-10,10);;//función de luminocidad/opacidad del color  
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b,150); // relleno de color,tomando los varoles(H,S,B) 
    float d = random(1, p/2);  
    ellipse(random(-p, p),random(-p, p), d*4, d*3);  
    popMatrix();  
  }  
}  
  
void keyPressed(){  // si el botón se aprieta "espacio"
  redraw();// se redibuja   
}  


