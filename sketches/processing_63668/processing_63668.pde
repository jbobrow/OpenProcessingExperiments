

void setup()
{
 size(500,500);  
 colorMode(HSB);
 //smooth();
 rectMode(CENTER);
}
// variables color y transparencia
int col = 0;
int trans = 100;
void draw()
{
background(255); //fondo
col = (col+1) % 256; //para que cambien los colores de la trama continuamente de manera gradual
// a partir de aca cada if identifica diferentes posiciones del mouse
//para cambiar el color de fondo y hacer desaparecer gradualmente la trama 
//y va de afuera hacia adentro
if(mouseX >= width/2-225 && mouseX <= width/2+225 && mouseY >= height/2-225 && mouseY <= height/2+225)
  { background(0);
    fill(col, 255, 255);
    rect(width/2, height/20+25, 450, 50);//rectangulo superior
    rect(width/2, height-50, 450, 50);//rectangulo inferior
    rect(width/20+25, height/2, 50, 450);//rectangulo izquierdo
    rect(width-50, height/2, 50, 450);//rectangulo derecho
   };  
if(mouseX >= width/2-175 && mouseX <= width/2+175 && mouseY >= height/2-175 && mouseY <= height/2+175)
   {
    background(255);//restablece el valor de fondo 
    };      
if(mouseX >= width/2-125 && mouseX <= width/2+125 && mouseY >= height/2-125 && mouseY <= height/2+125)
   {background(0); 
    fill(col, 255, 255);
    rect(width/2, height/20+125, 250, 50);//rectangulo superior
    rect(width/2, height-150, 250, 50);//rectangulo inferior
    rect(width/20+125, height/2, 50, 250);//rectangulo izquierdo
    rect(width-150, height/2, 50, 250);//rectangulo derech0
};  
if(mouseX >= width/2-75 && mouseX <= width/2+75 && mouseY >= height/2-75 && mouseY <= height/2+75)
   {
    background(255);//restablece el valor de fondo 
    };      
if(mouseX >= width/2-25 && mouseX <= width/2+25 && mouseY >= height/2-25 && mouseY <= height/2+25)
   {background(0);
    fill(col, 255, 255);
    rect(width/2, height/2, 50, 50);//cuadrado central
    };   
// crea los bordes 
for (int x1 = 50; x1 < width; x1 = x1 + 100) 
     {
      noFill();//sin relleno
      stroke(0);//color negro
      rect(width/2, height/2, x1, x1);//posicion centrado 
     };
noStroke();  //para que la trama no tenga los contornos marcados
// crea los circulos verde/cian
for (int x1 = 0; x1 < width+50; x1 = x1+50) 
     {for (int y1 = 0; y1 < height+50; y1 = y1+50) 
          {
           fill(col+50, 255, 255, trans);
           ellipse(x1*2, y1*2, 50,50); 
           fill(col+50, 255, 255, trans);
           ellipse(x1*2, y1*2, 40,40);
           fill(col+50, 255, 255, trans);
           ellipse(x1*2, y1*2, 30,30);    
          };
     };
// crea los cuadrados amarillos/magenta   
for (int x1 = 25; x1 < width+50; x1 = x1+50) 
     {for (int y1 = 0; y1 < height+50; y1 = y1+50) 
          {
           fill(col+25, 255, 255, trans);
           rect(x1*2, y1*2, 50,50); 
           fill(col+25, 255, 255, trans);
           rect(x1*2, y1*2, 40,40);
           fill(col+25, 255, 255, trans);
           rect(x1*2, y1*2, 30,30);    
          };
     };
// crea los circulos amarillo/verde
for (int x1 = 25; x1 < width-50; x1 = x1+50) 
     {for (int y1 = 25; y1 < height-50; y1 = y1+50) 
          {
           fill(col, 255, 255, trans);
           ellipse(x1*2, y1*2, 50,50); 
           fill(col, 255, 255, trans);
           ellipse(x1*2, y1*2, 40,40);
           fill(col, 255, 255, trans);
           ellipse(x1*2, y1*2, 30,30);    
          };
     };   
// crea los cuadrados verde/azul
for (int x1 = 0; x1 < width-50; x1 = x1+50) 
     {for (int y1 = 25; y1 < height-50; y1 = y1+50) 
          {
           fill(col+75, 255, 255, trans);
           rect(x1*2, y1*2, 50,50); 
           fill(col+75, 255, 255, trans);
           rect(x1*2, y1*2, 40,40);
           fill(col+75, 255, 255, trans);
           rect(x1*2, y1*2, 30,30);    
          };
     };      
}

