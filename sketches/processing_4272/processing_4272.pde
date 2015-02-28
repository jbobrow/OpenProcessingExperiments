
 PImage ritoque;  
  
 void setup(){  
  ritoque = loadImage ("ritoque4.JPG"); // carga la imagen  
  size(ritoque.width, ritoque.height); // carga la imagen                               
  noStroke();   
  noLoop();   
  colorMode(HSB); 
  smooth();   
  background(0);   
}  
  
 void draw(){  
  float sp = 2; 
    for(int y = 0; y < height; y += sp){
    for(int x = 0; x < width; x += sp){
      color c = ritoque.get(x,y); // toma los colores de la imagen  
      pincel(x, y, c, sp); // ejecuta el pincel  
      }  
    } 
  }  
  
 void pincel(float x, float y, color c, float d){ // variables del pincel
  int trazo = round(random(4)); // rectángulos alargados, aleatorios entre 0 y 4  
  for(int i  = 0; i <= trazo; i++){ 
    float h = hue(c); // mantiene los matices de la imagen
    float s = saturation(c) + random(50); // la saturacion original más una aleatoriedad entre 0 y 50  
    float b = brightness(c) + random(10); // el brillo original más una aleatoriedad entre 0 y 10  
    pushMatrix();  
    translate(x, y); 
    scale(random(1));
    rotate(random(PI*3)); 
    fill(h,s,b);  
    float p = random(d/2);  
    rect(random(-d, d), random(-d, d), random(20), random(p*2)); // el pincel son rectàngulos de forma variable 
    rect(random(-d, -d), random(-d, -d), random(p/3), random(60)); 
    popMatrix();         
  }  
}  

void keyPressed(){ // al presionar una tecla la imagen se redibuja
  redraw();  
} 

