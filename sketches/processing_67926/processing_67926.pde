
//Practica2: El mouse debe mover el círculo rojo
void setup()
{

size(500,500);
noFill();
smooth();
stroke(0,0,255);
strokeWeight(5);
 
}
void draw()
{
 background(255,255,255);
stroke(0,0,255);
ellipse(60,80,60,60);//azul
stroke(255,255,0);
ellipse(100,110,60,60);//amarillo
stroke(0,0,0);
ellipse(140,80,60,60);//negro
stroke(0,255,0);
ellipse(180,110,60,60);//verde
stroke(255,0,0);
ellipse(mouseX,mouseY,60,60);//rojo

}
