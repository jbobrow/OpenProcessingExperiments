
PImage ritoque;  
  
void setup (){  

  ritoque = loadImage ("ciudadabiertap.jpg"); //carga imagen
       size (ritoque.width, ritoque.height);  //tamaño

 background (251,255,250);
   colorMode(HSB, 155); //funcion para colores
  noStroke();  //sin contorno
  noLoop();  
  smooth();  //suaviza
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
    float h = hue(c) + random(-23, 25);  
    float s = saturation(c) +random(70);  
    float b = brightness(c) + random(-10, 15);  
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b,200);  
    float d = noise(1, p/2);  
   rotate(2);
   
triangle(random(20,25),random(25.28),random(10,15),random(18,9),28,random(18,15));
    
    popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
}  


