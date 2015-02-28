
int posY=0;
int posX=0;
int i=0;

int cantidad=10;

float tamanio;
int tamanio=20;
int separacion;

int rectX=25;
int rectY=335;
int rectAncho=100;
int rectAlto=40;

void setup(){
background(100);
size(400, 400);

   separacion = int(height/cantidad);
      posX = 0;
      posY = 0;
      fill(255);
        while (posX<height) {
        
              ellipse(posX, posY, tamanio, tamanio);
        
              posX=posX+separacion;
              posY=posY+separacion;
          
            }
            
}

void draw(){
    fill(255);
    rect (rectX,rectY,rectAncho,rectAlto);
    
    fill(0);
    text (cantidad, rectX+rectAncho/2.2,rectY+rectAlto/1.7);
 }

void mousePressed()
{

if (mouseX>rectX && mouseX<rectX+rectAncho && mouseY > rectY && mouseY < mouseY+rectAlto){

    if (cantidad==10){cantidad=50;}
    else{cantidad=10;}

    background(100);
    separacion = int(height/cantidad);
      posX = 0;
      posY = 0;
      fill(255);
        while (posX<height) {
              ellipse(posX, posY, tamanio, tamanio);
              posX=posX+separacion;
              posY=posY+separacion;
            }     
}
       

}


