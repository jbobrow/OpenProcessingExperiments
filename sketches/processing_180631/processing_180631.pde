
Arbol arbol1;
Estrella estrella1; Estrella estrella2; Estrella estrella3;
Estrella estrella4; Estrella estrella5; Estrella estrella6;
Estrella estrella7; Estrella estrella8; Estrella estrella9;
Estrella estrella10; Estrella estrella11; Estrella estrella12;
color fondo, cTierra, cStroke, cVentanas, cTejado, cFachada, cChimenea;
int Y_AXIS = 1;
color b1, b2;

void setup(){
  size(600,600);
  cTierra = color(#FFFFFF);
  cStroke = color(#FCFCFC);
  cVentanas = color(#FDFFDE);
  cTejado = color(#6F4B4C);
  cFachada = color (#C6C5B9);
  cChimenea = color (#7D7461);
  b1 = color(#1E2536);
  b2 = color(#445986);
  background(fondo);
  arbol1 = new Arbol(50,50,10,100,90,100);
  estrella1 = new Estrella();
  estrella2 = new Estrella();
  estrella3 = new Estrella();
  estrella4 = new Estrella();
  estrella5 = new Estrella();
  estrella6 = new Estrella();
  estrella7 = new Estrella();
  estrella8 = new Estrella();
  estrella9 = new Estrella();
  estrella10 = new Estrella();
  estrella11 = new Estrella();
  estrella12 = new Estrella();
  

}
void draw(){
  // Background
  setGradient(0, 0, width, height, b1, b2, Y_AXIS);
  //estrellas
  estrella1.display();estrella2.display();estrella3.display();
  estrella4.display();estrella5.display();estrella6.display();
  estrella7.display();estrella8.display();estrella9.display();
  estrella10.display2();estrella11.display2();estrella12.display2();

  
  // tierra
  fill(cTierra);
  stroke(cTierra);
  ellipse(100,570,800,500);
  
  translate(-20,-20);
  fill(cStroke);
  ellipse(500,700,1200,700);
  translate(20,20);
    
  /*tapar elipse
  fill(fondo);
  stroke(fondo);
  beginShape();
  vertex(287,348);
  vertex(338,370);
  vertex(600,370);
  vertex(600,355);
  vertex(600,250);
  vertex(287,348);
  endShape();*/
  
  fill(cTierra);
  stroke(cTierra);
  ellipse(500,700,1200,700);
  
 /* arboles */
  pushMatrix();
  translate(40,240);
  arbol1.display();
  popMatrix(); 
  
  pushMatrix();
  translate(200,220);
  scale(0.8);
  arbol1.display();
  popMatrix();
  
  pushMatrix();
  translate(130,210);
  scale(0.7);
  arbol1.display();
  popMatrix();
  
   pushMatrix();
  translate(20,240);
  scale(0.5);
  arbol1.display();
  popMatrix();
  
  pushMatrix();
  translate(230,350);
  scale(0.9);
  arbol1.display();
  popMatrix();
  
  pushMatrix();
  translate(100,380);
  scale(1.2);
  arbol1.display();
  popMatrix();
  
 /* casita */
 
 pushMatrix();
 noStroke();
 fill(cTejado);
 translate(400,240);
 scale(0.6);
 quad(
 50,0,
 0,100,
 250,100,
 200,0);
 fill(cFachada);
 rect(25,100,200,100);
 //ventanas
 fill(cVentanas);
 stroke(cVentanas);
 rect(55,120,50,50);
 rect(145,120,50,50);
 //ventanas - divisiones
 strokeWeight(6);
 stroke(cFachada);
 line(55,145,105,145);
 line(80,120,80,170); 
 
pushMatrix();
translate(90,0);
 line(55,145,105,145);
 line(80,120,80,170);
 popMatrix();
 
//ventanas reflejo
pushMatrix();
noStroke();
translate(0,230);
quad(
 50,0,
 0,100,
 250,100,
 200,0);
 fill(cTierra);
 quad(
 50+60,0,
 0+100,100,
 250-100,100,
 200-60,0);
 //divisiones ventana reflejo
 stroke(5);
 stroke(cTierra);
 translate(0,-100);
 line(0,145,265,145);
 line(80,120-20,80-20,170+25);

 scale(-1,1);
 translate(-250,0); 
 line(80,120-20,80-20,170+25);
 popMatrix();

 //chimenea
 stroke(cChimenea);
 fill(cChimenea);
 rect(170,0,25,-52);

 
 popMatrix();
 
 
  
  
  
}

class Arbol {
  color c;
  color cTronco;
  float point1x;
  float point1y;
  float point2x;
  float point2y;
  float point3x;
  float point3y;
  float arbolEscalar;

  
  Arbol(
  float tempPoint1x, float tempPoint1y, 
  float tempPoint2x, float tempPoint2y, 
  float tempPoint3x, float tempPoint3y)  {    
  c = color(#395756); 
  cTronco = color(#837A75);
  arbolEscalar = 15;  
  point1x = tempPoint1x;
  point1y = tempPoint1y;
  point2x = tempPoint2x;
  point2y = tempPoint2y;
  point3x = tempPoint3x;
  point3y = tempPoint3y;
 
}
  
  void display() {
    noStroke();
    stroke(c);
    fill(c);
    triangle(point1x,point1y,point2x,point2y,point3x,point3y);
    translate(0,40);
    triangle(point1x,point1y,point2x-arbolEscalar,
    point2y+arbolEscalar,point3x+arbolEscalar,point3y+arbolEscalar);
    fill(cTronco);
    stroke(cTronco);
    rect(point1x-8,point1y+71,16,15);
  }

}

class Estrella {
  float xpos;
  float ypos;
  float yposTop;
  float sizeMin;
  float sizeMax;
  color c;
  float size;
  
  Estrella (){
  c = color(255);
  yposTop = random(0,130);
  xpos = random(0,600);
  ypos = random(0,320);
  size = random(2,5);
  }
  
  void display() {
    noStroke();
    fill(c);
    ellipse(xpos,ypos,size,size);
  }
  
  void display2() {
    noStroke();
    fill(c);
    ellipse(xpos,yposTop,size,size);
  }
}
  

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
}
