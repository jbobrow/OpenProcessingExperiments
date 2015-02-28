
float lineaX = 0;
float cuadros=2;
float matiz= random(200);
float diametro=10;


void setup(){
size(400,400);
smooth();
colorMode(HSB,255);
background(255);
}

void draw(){
//se borra el fgrame con el color

translate(width/2,height/2);
rectMode(CENTER);

noFill();
stroke(random(255),100+random(55),150 +random(55));
  strokeWeight(5+random(10));
  
//SCANER
lineaX +=1;

lineaX=lineaX % width;

//dibujo
for(int i=0;i< cuadros; i++){
  
  rotate(TWO_PI/cuadros+random(10));
rect(lineaX,lineaX,diametro+random(5),diametro+random(3));
}



}

