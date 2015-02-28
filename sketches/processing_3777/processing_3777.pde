
PImage puerta; 
int col;    
float rojo,verde,azul,bright;   
 
void setup(){ 
puerta = loadImage("ciudad abierta.jpg"); 
  size(puerta.width,puerta.height); 
  colorMode(RGB,255); 
   
  background (255); 
} 
void draw(){ 
 
int spaa = 30;  
  for(int y = 0; y < height; y += spaa){ 
    for(int x = 10; x <= width; x += spaa){ 
      col = puerta.get(x,y); 
    pincel(x, y, col, spaa); 
    } 
  } 
} 
void pincel(float x, float y, color col, float amp){
if (keyPressed){ 
  int puntos = round(random(5,10)); 
  for(int i = 0; i < puntos; i++){ 
    rojo=red(col); 
    verde=green(col); 
    azul=blue(col); 
    bright=(brightness(col)/255)*2; 
     amp=35.5;
    pushMatrix(); 
    translate(x,y); 
    rotate(amp-(random(2,5))); 
    fill(rojo,verde,azul,100);
    float tam = random(2, amp); 
    float alfa=map (tam,2,amp, 0,400); 
    stroke (rojo,verde,azul,60);  
    curve(random(amp, amp*2),random(amp, amp*2), tam/1.5, tam,tam,tam,0,0); 
    popMatrix(); 
    } 
  }
} 
  

