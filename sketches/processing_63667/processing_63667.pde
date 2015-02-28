
void setup()
{
size(400, 400);
strokeWeight(3);//ancho del trazo
 stroke(0); //color del trazo
rectMode(CENTER);
}
void draw()
{
 background(255);
//------------------------------------------------------
// los 8 cuadrados rojos de las esquinas (2 por c/esquina)
fill(255, 0, 0, 125);
// se el cursor se mueve en X van hacia el centro o hacia afuera, lo mismo si pasa en vertical con el eje Y
rect(0, 0, width-mouseX, height-mouseY);
rect(width, 0, width-mouseX, height-mouseY);
rect(width, height, width-mouseX, height-mouseY);
rect(0, height, width-mouseX, height-mouseY);
//-----
//si el cursor se mueve en Y los rectangulos se desplazan en X y visceversa
rect(0, 0, width-mouseY, height-mouseX);
rect(width, 0, width-mouseY, height-mouseX);
rect(width, height, width-mouseY, height-mouseX);
rect(0, height, width-mouseY, height-mouseX);
//------------------------------------------------------
//cuadrados amarillos. 
fill(255, 255, 0, 150);
rect(mouseX, mouseY, 50, 50); //siue al mouse
rect(mouseX+50, mouseY+50, 50, 50);
rect(mouseX-50, mouseY-50, 50, 50);
rect(mouseX-50, mouseY+50, 50, 50);
rect(mouseX+50, mouseY-50, 50, 50);
//---
rect(width-mouseX, height-mouseY, 50, 50);//opuesto al mouse
rect(width-mouseX+50, height-mouseY+50, 50, 50);
rect(width-mouseX-50, height-mouseY-50, 50, 50);
rect(width-mouseX-50, height-mouseY+50, 50, 50);
rect(width-mouseX+50, height-mouseY-50, 50, 50);
//---
rect(mouseX,  height-mouseY, 50, 50);//paralelo en X
rect(mouseX+50,  height-mouseY+50, 50, 50);
rect(mouseX-50,  height-mouseY-50, 50, 50);
rect(mouseX-50,  height-mouseY+50, 50, 50);
rect(mouseX+50,  height-mouseY-50, 50, 50);
//---
rect(width-mouseX, mouseY, 50, 50);//paralelo en Y
rect(width-mouseX+50, mouseY+50, 50, 50);
rect(width-mouseX-50, mouseY-50, 50, 50);
rect(width-mouseX-50, mouseY+50, 50, 50);
rect(width-mouseX+50, mouseY-50, 50, 50);
//------------------------------------------------------
//rectangulos naranjas. Los verticales se ensanchan al mover en X
// lor horizontales lo hacen al moverse en Y
fill(255, 128, 0, 100);
rect(0, 0, mouseX/2, height*2);
rect(200, 0, mouseX/4, height*2);
rect(400, 0, mouseX/2, height*2);
//---
rect(0, 0, width*2, mouseY/2);
rect(0, 200, width*2, mouseY/4);
rect(0, 400, width*2, mouseY/2);
//------------------------------------------------------
//cuadrados magentas
fill(255, 0, 255, 75);
// se mantienen en el centro, se agrandan segun la posicion del mouse
rect(width/2, height/2, mouseX-50, mouseY-50);
rect(width/2, height/2, mouseX-150, mouseY-150);
rect(width/2, height/2, width-mouseX-50, height-mouseY-50);
rect(width/2, height/2, width-mouseX-150, height-mouseY-150);
}

