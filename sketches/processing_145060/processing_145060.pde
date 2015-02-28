
float earX = 70, earY=70;
int a, b;
int _x, _y;
int posX, posY;
color colorback;
int velocidadX, velocidadY;

  
//Introduccion y definicion de variables.
void setup(){
  size(600,600);
  colorback= color(7,242,240);
  _x= width/2;
  _y= height/2;
  posX= _x;
  posY= _y;
  velocidadX= 2;//velocidad del bicho
  velocidadY= 2;


}

void draw(){
    //Fondo
  background(colorback);


  //Rebotes en x e y: cuando los extremos del dibujo lleguen a las paredes.
  if((posY>325) || (posY<112.5)){
  velocidadY= -velocidadY;
  }


  if((posX<175)||(posX>318)){
  velocidadX= -velocidadX;
  }
  
  posX= posX+velocidadX;
  posY= posY+velocidadY;
  
  //Dibujo en posicion inicial.
  dibujarBicho(posX,posY);
}

void mousePressed(){
  colorback=color(0,mouseX,mouseY);
}
  
  
void dibujarBicho(int _x,int _y)
{
  float d1, d2;
  d1=_x-70-earX*1.5;
  d2=_y-b+5+earY*1.5;
  a=150;
  b=175;
  stroke(0);
  strokeWeight(1.1);
//boca
  fill(255,0,0);
  beginShape();
  curveVertex(_x-25,_y+a);
  curveVertex(_x-25,_y+a);
  curveVertex(_x-5,_y+a+50);
  curveVertex(_x+50,_y+a+115);
  curveVertex(_x+97.5,_y+a+125);
  curveVertex(_x+a,_y+a+100);
  curveVertex(_x+a+20,_y+a);
  curveVertex(_x+a+20,_y+a);
  endShape(CLOSE);
  
//dientes
  fill(255);
  beginShape();
  vertex(_x-25,_y+a);
  vertex(_x-15,_y+a+40);
  vertex(_x,_y+a);
  vertex(_x+15,_y+a+40);
  vertex(_x+30,_y+a);
  vertex(_x+45,_y+a+40);
  vertex(_x+60,_y+a);
  vertex(_x+75,_y+a+40);
  vertex(_x+90,_y+a);
  vertex(_x+105,_y+a+40);
  vertex(_x+120,_y+a);
  vertex(_x+135,_y+a+40); 
  vertex(_x+150,_y+a);
  vertex(_x+165,_y+a+40);
  vertex(_x+170,_y+a);
  endShape(CLOSE);
//ojos y nariz
  ellipse(_x,_y,width/5,height/5);
  ellipse(_x+width/5,_y,width/5,height/5);
  
  fill(_x);//el color de la nariz cambiara en funcion de su posicion.
  ellipse(_x+width/6,_y+height/6.25,width/100,height/100);
  ellipse(_x+width/12,_y+height/6,width/100,height/100);
  
  fill(0);
  ellipse(_x,_y,width/12,height/12);
  ellipse(_x+width/5,_y,width/12,height/12);
//orejas 
  beginShape();
  curveVertex(_x+10,_y-60);
  curveVertex(_x-70,_y-a+40); 
  curveVertex(_x-70-earX,_y-b+5+earY); 
  curveVertex(d1,d2);
  curveVertex(_x-70-earX*.6,_y-a+40+earY*1.6); 
  curveVertex(_x+10,_y+60);
  endShape();
  
  beginShape();
  curveVertex(_x+75,_y-60);
  curveVertex(_x+b,_y-a+40); 
  curveVertex(_x+b+earX,_y-b+5+earY); 
  curveVertex(_x+b+earX*1.5,_y-b+5+earY*1.5);
  curveVertex(_x+b+earX*.6,_y-a+40+earY*1.6); 
  curveVertex(_x+75,_y+60);
  endShape();
}
