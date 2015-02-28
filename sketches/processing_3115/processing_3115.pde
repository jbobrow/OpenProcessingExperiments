
PImage ritoque;  
  
void setup (){  

  ritoque = loadImage ("ciudadabiertap.jpg"); //carga imagen
       size (ritoque.width, ritoque.height);  //tamaño

 background (251,255,250); //fondo
   colorMode(HSB, 155);    //funcion para colores
  noStroke();              //sin contorno
  noLoop();  
  smooth();               //suaviza
}  
  
  
void draw(){  
  
  int sp=5;  
  for (int y=0; y<height; y+=sp){  
    for (int x=0; x<width; x+=sp){  
      color c = ritoque.get(x,y);  
      pincelTotal(x,y,c,sp);  
    }  
  }  
}  
  
void pincelTotal(float x, float y, int c, int p){  
  int pincel=round (random(4,7));  
  for(int i = 0; i <= pincel; i++){  
    float h = hue(c) + random(10, 25);         //tonalidad
    float s = saturation(c) +random(85);       //saturacion
    float b = brightness(c) + random(15, 25);  //brillo
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b,45);                            //nitidez
    float d = noise(1, p/2);  
   rotate(1);
   
triangle(random(20,25),random(25.28),random(20,15),random(18,10),28,random(18,17));
    
    popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
}  


