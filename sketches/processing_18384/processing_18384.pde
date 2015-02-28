
// Proyecto de cubo rotante
// con foto de la jenny
// y la lia
// 22/01/11

//seLu l'Olleria

import processing.opengl.*;
float rotX = 0.0, rotY = 0.0;
int lastX, lastY;
float distX = 0.0, distY = 0.0;
// Textura
PImage foto;
void setup(){
size(400, 400, OPENGL);
noStroke();
foto = loadImage("lafoto.jpg");
// Vamos a referirnos a las coordenadas de la
// textura de (0,0) a (1,1)
textureMode(NORMALIZED);
}
void draw(){
background(0);
translate(width/2, height/2);
rotateX(rotX + distY);
rotateY(rotY + distX);
// Hacemos el cubo de 200 x 200 x 200
// Lo dibujamos de -1 a 1
scale(100, 100, 100);
beginShape(QUADS);
texture(foto);
// Proporcionamos los vértices
// 3D de cada cara del cubo.
// Los dos valores finales
// son las coordenadas de la
// textura que corresponde
// al vértice en cuestión
// +Z "front" face
vertex(-1, -1, 1, 0, 0);
vertex( 1, -1, 1, 1, 0);
vertex( 1, 1, 1, 1, 1);
vertex(-1, 1, 1, 0, 1);
// -Z "back" face
vertex( 1, -1, -1, 0, 0);
vertex(-1, -1, -1, 1, 0);
vertex(-1, 1, -1, 1, 1);
vertex( 1, 1, -1, 0, 1);
// +Y "bottom" face
vertex(-1, 1, 1, 0, 0);
vertex( 1, 1, 1, 1, 0);
vertex( 1, 1, -1, 1, 1);
vertex(-1, 1, -1, 0, 1);
// -Y "top" face
vertex(-1, -1, -1, 0, 0);
vertex( 1, -1, -1, 1, 0);
vertex( 1, -1, 1, 1, 1);
vertex(-1, -1, 1, 0, 1);
// +X "right" face
vertex( 1, -1, 1, 0, 0);
vertex( 1, -1, -1, 1, 0);
vertex( 1, 1, -1, 1, 1);
vertex( 1, 1, 1, 0, 1);
// -X "left" face
vertex(-1, -1, -1, 0, 0);
vertex(-1, -1, 1, 1, 0);
vertex(-1, 1, 1, 1, 1);
vertex(-1, 1, -1, 0, 1);
endShape();
}
void mousePressed()
{
lastX = mouseX;
lastY = mouseY;
}
void mouseDragged()
{
distX = radians(mouseX - lastX);
distY = radians(lastY - mouseY);
}
void mouseReleased()
{
rotX += distY;
rotY += distX;
distX = distY = 0.0;
}

