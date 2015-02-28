
PImage duna;
int col;   
float r,g,b,bright;  

void setup(){
duna = loadImage("duna.jpg");
  size(duna.width,duna.height);
  colorMode(RGB,255);
  
  background (255);
}
void draw(){

int spacer = 4; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      col = duna.get(x,y);
    pincel(x, y, col, spacer);
    }
  }
}
void pincel(float x, float y, color col, float amp){//como se comporta el pincel
int puntos = round(random(5,10));
  for(int i = 0; i <= puntos; i++){
    r=red(col);
    g=green(col);
    b=blue(col);
    bright=(brightness(col)/255)*2;
    
    pushMatrix();
    translate(x,y);
    rotate(amp-(random(2,5)));
    fill(r,g,b,80);//se toman los colores reales de la foto
    float tam = random(2, amp);
    float alfa=map (tam,2,amp, 255,0);
    stroke (r,g,b,60);//se da un borde un poco más oscuro a las elipses
    ellipse(random(amp, amp*2),random(amp, amp*2), tam/1.5, tam);
    popMatrix();
  }
}
  

   

