
void setup (){
  
size(700,700);
background(255,255,0);

//caballete
beginShape();
fill(150,75,0);
vertex(108,614);
vertex(136,614);
vertex(305,133);
vertex(277,133);
endShape(CLOSE);

beginShape();
vertex(592,614);
vertex(564,614);
vertex(335,133);
vertex(363,133);
endShape(CLOSE);

beginShape();
vertex(66,434);
vertex(66,454);
vertex(594,454);
vertex(594,434);
endShape(CLOSE);

//lienzo
fill(255,255,255);
beginShape();
vertex(46,434);
vertex(614,434);
vertex(614,40);
vertex(46,40);
endShape(CLOSE);

}

boolean trigger = false;
boolean vermell = false;
boolean verd = false;
boolean blau = false;
boolean taronja = false;
boolean negre = false;
boolean morat = false;
boolean groc = false;
boolean borrar = false;
boolean aleatori = false;
int strokewheight=1;
float color1 = 0;
float color2 = 0;
float color3 = 0;


void draw(){
println(mouseX+","+mouseY);

//tornillos
fill(color1,color2,color3);
ellipse(177,445,10,10);
ellipse(500,445,10,10);

//lineas
 if(mousePressed && (mouseButton == LEFT)&& 46<mouseX && mouseX<614 && 40<mouseY && mouseY<434){
    stroke(color1,color2,color3);
    line(mouseX,mouseY,pmouseX,pmouseY); 
 }

//círculos
 if(key=='c'&& 46<mouseX && mouseX<614 && 40<mouseY && mouseY<434) {
    ellipse(mouseX,mouseY,10,10);
 }

//cuadrados
  if(key=='v' && 46<mouseX && mouseX<614 && 40<mouseY && mouseY<434){
    rect(mouseX,mouseY,10,10);  
  }
  
//borrar
if(key=='r'  && 46<mouseX && mouseX<614 && 40<mouseY && mouseY<434){
    borrar=true;
    fill(255,255,255);
    beginShape();
    vertex(46,434);
    vertex(614,434);
    vertex(614,40);
    vertex(46,40);
    endShape(CLOSE);
    stroke(0);
 }
 
 //grosor linia
 if(key=='+'  && 46<mouseX && mouseX<614 && 40<mouseY && mouseY<434){
   strokeWeight(1.5); 
 }
 if(key=='-'   && 46<mouseX && mouseX<614 && 40<mouseY && mouseY<434){
   strokeWeight(1);
 }
  
//colores
fill(255,0,0);
rect(234,434,20,20);
if (mousePressed && (mouseButton == LEFT) && 234<mouseX && mouseX<254 && 434<mouseY && mouseY<454 && vermell==true){
  color1=0;
  color2=0;
  color3=0;
  
  color1=255;
}
 stroke(0);
 

fill(0,255,0);
rect(264,434,20,20);
if (mousePressed && (mouseButton == LEFT) && 264<mouseX && mouseX<284 && 434<mouseY && mouseY<454 && verd==true){
  color1=0;
  color2=0;
  color3=0;

color2=255;

}

fill(0,0,255);
rect(294,434,20,20);
if (mousePressed && (mouseButton == LEFT) && 294<mouseX && mouseX<314 && 434<mouseY && mouseY<454 && blau==true){
  color1=0;
  color2=0;
  color3=0;

color3=255;

}

fill(230,95,0);
rect(324,434,20,20);
if (mousePressed && (mouseButton == LEFT) && 324<mouseX && mouseX<344 && 434<mouseY && mouseY<454 && taronja==true){
  color1=0;
  color2=0;
  color3=0;
  color1=230;
  color2=95;
  color3=0;

}

fill(0,0,0);
rect(354,434,20,20);
if (mousePressed && (mouseButton == LEFT) && 354<mouseX && mouseX<374 && 434<mouseY && mouseY<454 && negre==true){
  color1=0;
  color2=0;
  color3=0;
}
fill(150,30,87);
rect(384,434,20,20);
if (mousePressed && (mouseButton == LEFT) && 384<mouseX && mouseX<404 && 434<mouseY && mouseY<454 && morat==true){
  color1=0;
  color2=0;
  color3=0;

  color1=150;
  color2=30;
  color3=87;
}

fill(255,255,0);
rect(414,434,20,20);
if (mousePressed && (mouseButton == LEFT) && 414<mouseX && mouseX<434 && 434<mouseY && mouseY<454 && groc==true){
  color1=0;
  color2=0;
  color3=0;
  
  color1=255;
  color2=255;
  color3=0;
}

fill(255,255,255);
rect(444,434,20,20);
if(mousePressed && (mouseButton == LEFT) && 444<mouseX && mouseX<464 && 434<mouseY && mouseY<454 && aleatori==true){
  color1=0;
  color2=0;
  color3=0;
  
  color1=random(255);
  color2=random(255);
  color3=random(255);
}
}



void mousePressed(){

  trigger = true;
  vermell=true;
  verd = true;
  blau = true;
  taronja = true;
  negre = true;
  morat = true;
  groc = true;
  borrar = true;
  aleatori = true;

}

void mouseReleased(){

  trigger = false;
  vermell = false;
  verd = false;
  blau =  false;
  taronja = false;
  negre = false;
  morat = false;
  groc = false;
  borrar = false;
  aleatori = false;

}


