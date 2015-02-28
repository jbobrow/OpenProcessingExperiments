
/**
<strong>Estilo Impresionista</strong><br />
Se disponen tres pinceles impresionistas, los cuales van pintando<br />
el lienzo mediante la locación del mouse:<br />
'p' = simula el estilo puntillista<br />
'g' = se pinta por medio de trazos lineales<br />
'm' = se colorea con motas<br />

'c' = para detenerse y desocupar el pincel<br />
'r' = para mostrar la imagen original<br />
'b' = para reiniciar<br />
'v' = para reiniciar con un lienzo con fondo negro y líneas blancas<br />

**/


PImage ritoque; 
PImage ritoque2;
int pointillize = 30;

  
void setup(){  
  ritoque = loadImage ("casa-ritoque.jpg"); 
ritoque2 = loadImage ("casa-ritoquebyn.jpg");
  
  size(500, 375, P3D);                             
  noStroke();   
  
  colorMode(HSB);  
  smooth();  
  background(ritoque2);

  
 

    
}  
  
void draw(){ 
int x = mouseX;
int y = mouseY;

    int loc = x + y*ritoque.width;
loadPixels();
       float h = hue(ritoque.pixels[loc]);
  float s = saturation(ritoque.pixels[loc]);
  float b = brightness(ritoque.pixels[loc]);
     noStroke(); 
    fill(h,s,b,100);


if (key == 'p'){
    ellipse(x,y,pointillize,pointillize); 
}

  
 if (key == 'g'){
     int puntos = round(random(4)); 
  for(int i  = 0; i <= puntos; i++){ 
   
    pushMatrix();  
    translate(x, y); 
    scale(random(1));
    rotate(random(PI*3)); 

    float tam = random(6/2);  
    rect(random(-6, 6), random(-6, 6), random(10), random(tam*2)); 
    rect(random(-6, -6), random(-6, -6), random(tam), random(40)); 
    popMatrix();         
  
  }
   
 }
 
 if (key == 'm'){
   pushMatrix();   
    translate(x,y);   
    fill(h,s,b,150); 
    float d = random(1, 6/2);   
    ellipse(random(-6, 6),random(-6, 6), d*4, d*3);   
    popMatrix();  
 }
  
 if(key =='c'){
 }
  

if (key == 'r'){
image (ritoque,0,0);
    }
    
 if (key=='b'){
  setup(); 
 }
 
 if (key=='v'){
  setup();
 filter(INVERT); 
 }

  if(key == 's'){
    saveFrame("dg#######.png");
  }

  }  
 




 




  






