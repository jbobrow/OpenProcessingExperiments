
int cordX;
PImage etiqueta;
PImage ikea;


void setup(){
  
size (400,400);
background(255);

etiqueta = loadImage ("etiqueta.jpg");
ikea = loadImage("ikea.jpg");
smooth();
}

void draw(){
  
  //logo
  pushMatrix();
  background(255);
  scale(0.4);
  image(ikea,20,20);
  popMatrix();
  
  //etiqueta
  pushMatrix();
  scale(0.6);
  translate( width-80,height);
  image(etiqueta,0,0);
  popMatrix();
  
  //Coli
  pushMatrix();
 // translate(mouseX,mouseY);
  translate(width/2,height/3);
  dibujacoliflor();
  popMatrix();
  
 //Zabahorio
 dibujazanahoria();
}
  
void dibujacoliflor(){  
   
//cuerpo
fill(129,191,96);
noStroke();
quad(0,0,40,0,30,60,10,60);
fill(71,121,45);
stroke(129,191,96);

//pelo
ellipse(15,-20,20,20);
ellipse(30,-20,20,20);

ellipse(5,-10,20,20);
ellipse(15,-10,20,20);
ellipse(25,-10,20,20);
ellipse(35,-10,20,20);

ellipse(0,0,20,20);
ellipse(10,0,20,20);
ellipse(25,0,20,20);
ellipse(40,0,20,20);

//ojos
fill(0);
noStroke();
ellipse(25,30,2,4);
ellipse(15,30,2,4);

//sonrisa
noFill();
stroke(0);
beginShape();
vertex(15,40);
bezierVertex(15,40,20,50,25,40);
endShape();

//Ropa
cordX=10;
while(cordX<30)
{
fill(48,64,198);
stroke(48,64,198);
rect(cordX,60,5,5);
cordX=cordX+10;
}

cordX=15;
while(cordX<30)
{
fill(48,64,198);
stroke(48,64,198);
rect(cordX,65,5,5);
cordX=cordX+10;
}

cordX=10;
while(cordX<30)
{
fill(48,64,198);
stroke(48,64,198);
rect(cordX,70,5,5);
cordX=cordX+10;
}

noFill();
stroke(48,64,198);
rect(10,60,20,15);

//piernas
fill(0);
stroke(0);
beginShape();
vertex(15,75);
bezierVertex(14,85,15,90,16,85);
line(16,85,15,75);
endShape();

pushMatrix();
translate(10,0);
beginShape();
vertex(15,75);
bezierVertex(14,85,15,90,16,85);
line(16,85,15,75);
endShape();
popMatrix();

pushMatrix();
translate(52,-5);
rotate(radians(45));
beginShape();
vertex(15,75);
bezierVertex(14,85,15,90,16,85);
line(16,85,15,75);
endShape();
popMatrix();

pushMatrix();
translate(-33,16);
rotate(radians(-45));
beginShape();
vertex(15,75);
bezierVertex(14,85,15,90,16,85);
line(16,85,15,75);
endShape();
popMatrix();
}


void dibujazanahoria(){
  
   //Zanahorio
  pushMatrix();
  translate(width/3,height/3);
 
  //cuerpo
  beginShape();
  stroke(247,149,27);
  fill(247,149,27);
 vertex(0,-10);
 bezierVertex(0,-10,5,10,-20,65);
  vertex(-20,65);
  bezierVertex(-20,65,0,80,20,65);
  vertex(20,65);
  bezierVertex(20,65,15,10,0,-10);
endShape();

//piernas
fill(0);
stroke(0);

pushMatrix();
translate(-20,0);
beginShape();
vertex(15,75);
bezierVertex(14,85,15,90,16,85);
line(16,85,15,75);
endShape();
popMatrix();

pushMatrix();
translate(-10,0);
beginShape();
vertex(15,75);
bezierVertex(14,85,15,90,16,85);
line(16,85,15,75);
endShape();
popMatrix();

//vestido
noStroke();
fill(120,211,85);
beginShape();
vertex(-20,65);
  bezierVertex(-20,65,0,80,20,65);
vertex(20,65);
bezierVertex(20,65,20,70,22,80);
vertex(20,80);
bezierVertex(20,80,0,80,-22,80);
endShape();

//ojos
fill(0);
noStroke();
ellipse(-2,50,2,4);
ellipse(8,50,2,4);

//sonrisa
noFill();
stroke(0);
beginShape();
vertex(-6,60);
bezierVertex(-6,60,0,70,10,60);
endShape();

//bracitos
line(-20,65,-27,60);
line(20,65,27,60);

  
  popMatrix();
}


