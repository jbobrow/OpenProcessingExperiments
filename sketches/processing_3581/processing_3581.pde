
/*Ritoque impresionista.
por Bernardo Silva Catrilef
 */  
  
PImage ritoque;//funcion que permite cargar una foto.  
  
void setup (){    
  size (682,511);  //tamaño de la imagen.  
  ritoque=loadImage ("ritoque.JPG");//carga la imagen agregada al sketch.   
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
      color c = ritoque.get(x,y);    
      pincelTotal(x,y,c,a);    
    }    
  }    
}    
  
void pincelTotal(int x, int y, int c, int p){// técnica del pincel  
  int pincel=round (random(3,6));    
  for(int e = 0; e <= pincel; e++){//esquema de color de la pincelada  
     float h = hue(c) + random(-16, 16);    
    float s = saturation(c) + random(59); //función de saturación del color   
    float b = brightness(c) + random(-50,10);;//función de luminocidad/opacidad del color    
 
    pushMatrix();    
    translate(x,y);    
    fill(h,s,b); // relleno de color,tomando los varoles(H,S,B)   
    float d = random(1, p/2);    
    ellipse(random(-p, p),random(-p, p), d*2, d*10);    
    popMatrix();    
  }    
}    
  
void keyPressed(){  // si el botón se aprieta "espacio"  
  redraw();// se redibuja     
}    
  


