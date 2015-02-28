
PImage ritoque; 
 
void setup(){ 
  ritoque = loadImage("ritoque3.JPG"); // carga la imagen  
  size(ritoque.width, ritoque.height); // carga la imagen  
  noStroke(); 
  noLoop();  
  colorMode(HSB, 255); 
  smooth(); 
  background(255); 
} 
 
void draw(){ 
 
  int sp = 4;  
  for(int y = 0; y < height; y += sp){ 
    for(int x = 0; x < width; x += sp){ 
      color c = ritoque.get(x,y); // toma los colores de la imagen 
      pincelada(x, y, c, sp);  // ejecuta el pincel  
    } 
  } 
} 
 
void pincelada(float x, float y, color c, float p){ // variables del pincel  
  int rectangulos = round(random(7,10)); // rectángulos aleatorios entre 7 y 10 
  for(int i = 0; i <= rectangulos; i++){  
    float h = hue(c)- 40; 
    float s = saturation(c)- 255; 
    float b = brightness(c) -50; 
    pushMatrix(); 
    translate(x,y); 
    fill( h,s,b); 
    rotate(5); 
    float d = random(2,p*2); 
    rect(random(-p,p*2),random(-p,p*2),d/2,d*2); // el pincel son rectàngulos
    popMatrix(); 
  } 
} 
 
void keyPressed(){ 
  redraw();  
} 
 
 
 


