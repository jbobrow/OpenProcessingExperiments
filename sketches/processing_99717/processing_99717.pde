
// hago 4 puntos. las variables se declaran afuera de void setup
float x1, x2, x3, x4;
float y1, y2, y3, y4;
// les asigno 1 velocidad diferente a c/u
float velx1, velx2, velx3, velx4;
float vely1, vely2, vely3, vely4;

float c1;
float incC1;

float mouseVel = 0;
int indice = 0;

//-----

void setup (){
  size (640, 780);
  colorMode (HSB, 360,100,100,100);
  background (300,200,200);
  
  c1 = 0;
  incC1 = 1; //este valor nos dice q tan rápido cambia de color
  
  
  // dar valores aleatorios usando random - genera un número aleatorio dentro d un rango
  x1 = random(0, width);
// hacer lo mismo con todas las x y ys
  x2 = random(0, width);
  x3 = random(0, width);
  x4 = random(0, width);

  y1 = random(0, height);
  y2 = random(0, height);
  y3 = random(0, height);
  y4 = random(0, height);

  velx1 = random (-2,2);
  velx2 = random (-2,2);
  velx3 = random (-2,2);
  velx4 = random (-2,2);

  vely1 = random (-2,2);
  vely2 = random (-2,2);
  vely3 = random (-2,2);
  vely4 = random (-2,2);

}

//---------------

void draw () {
  
  //background (300,200,200);
  
  fill (0,90,100,5);
  noStroke();
  beginShape ();
  vertex (x1,y2);
  bezierVertex (x2,y2,x3,y3,x4,y4);
  endShape();
  
  
  //fill (0);
  //ellipse (x1,y1,10,10);
  //ellipse (x2,y2,10,10);
  //ellipse (x3,y3,10,10);
  //ellipse (x4,y4,10,10);
  

  mouseVel = dist (pmouseX,pmouseY, mouseX, mouseY);
  //fill ((c1+270) %360, 100,100,175);
  ellipse (mouseX, mouseY, mouseVel, mouseVel);

 // fill (c1,100,50,50);
  rect (x1, y1, x2, y2, x3, y3, x4, y4);  
  
  stroke (0,0,0,25);
 // fill (c1,100,50,50);
  quad (x1,y1, x2, y2, x3, y3, x4, y4);
  
 // fill ((c1+180)%360, 75,100,100);
  beginShape ();
  vertex (x1,y2);
  bezierVertex (x2,y2,x3,y3,x4,y4);
  endShape();
  
 // fill((c1+90)%360, 100, 50, 50);
  beginShape();
  vertex(x3, y3);
  bezierVertex(x1, y1, x2, y2, x4, y4);
  endShape();
  
  
  stroke ((c1+60)%360, 75, 100,75);
  line (mouseX, mouseY, x1,y1);
  stroke ((c1+128)%360, 75, 100,75);
  line (mouseX, mouseY, x2,y2);
  stroke ((c1+260)%360, 75, 100,75);
  line (mouseX, mouseY, x3,y3);
  stroke ((c1+70)%360, 75, 100,75);
  line (mouseX, mouseY, x4,y4);
  
  
//para que cada punto se mueva, hay que actulizarlo, es decir que se mueva dependiendo de la velocidad
  x1 = x1 + velx1;
  // también se puede expresar así: x1 += velx1;
x2 += velx2;
x3 += velx3;
x4 += velx4;

y1 += vely1;
y2 += vely2;
y3 += vely3;
y4 += vely4;

//actualizar color
c1 += incC1;
c1 %= 360;
//c1 = c1 % 360 // al poner el módulo, significa que cuando llegue a 360 regresará a 0


//fronteras x1 y y1
//if (x1 < 0 || x1 > width){
//  velx1 *= -1;
//}


if (x1 < 0){
  velx1 *=-1; // velx1 = velx1 * -1;
}

if (x1 > width){
velx1 *= -1;
}


if (y1 < 0){
  vely1 *=-1; // velx1 = velx1 * -1;
}

if (y1 > height){
vely1 *= -1;
}

//fronteras x2, y2
if (x2 < 0){
  velx2 *=-1; // velx1 = velx1 * -1;
}

if (x2 > width){
velx2 *= -1;
}


if (y2 < 0){
  vely2 *=-1; // velx1 = velx1 * -1;
}

if (y2 > height){
vely2 *= -1;
}


//fronteras x3, y3
//fronteras x2, y2
if (x3 < 0){
  velx3 *=-1; // velx1 = velx1 * -1;
}

if (x3 > width){
velx3 *= -1;
}


if (y3 < 0){
  vely3 *=-1; // velx1 = velx1 * -1;
}

if (y3 > height){
vely3 *= -1;
}


//fronteras x4, y4
//fronteras x2, y2
if (x4 < 0){
  velx4 *=-1; // velx1 = velx1 * -1;
}

if (x4 > width){
velx4 *= -1;
}


if (y4 < 0){
  vely4 *=-1; // velx1 = velx1 * -1;
}

if (y4 > height){
vely4 *= -1;
}

}


void keyPressed (){
//println(key);  // se imprime cualquier tecla que presiones

if (key == 's'){
  //save ("Recap" + indice + 'jpg'); para guardar las imágenes con el nombre que nosotros querramos
  saveFrame ();  //guarda una imagen de nuestro lienzo
}


}


