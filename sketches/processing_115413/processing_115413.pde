
int x;
int y;
int cordX;

void setup(){
  size(400,400);
  background(255);
  smooth();
  x=50;
  y=300;
}

void draw(){
  
  for (y=10;y<height;y+=150){
    
  for (x=12;x<width;x+=110){
   
  dibujacoliflor();
}
  }  
  
    for (y=40;y<height;y+=150){
    
  for (x=85;x<width;x+=110){

  zanahoria();
}
  }  
  
}



void dibujacoliflor(){  
  
smooth();
  //cuerpo
fill(129,191,96);
noStroke();
quad(x+0,y+0,x+40,y+0,x+30,y+60,x+10,y+60);
fill(71,121,45);
stroke(129,191,96);

//pelo
ellipse(x+15,y-20,20,20);
ellipse(x+30,y-20,20,20);

ellipse(x+5,y-10,20,20);
ellipse(x+15,y-10,20,20);
ellipse(x+25,y-10,20,20);
ellipse(x+35,y-10,20,20);

ellipse(x+0,y+0,20,20);
ellipse(x+10,y+0,20,20);
ellipse(x+25,y+0,20,20);
ellipse(x+40,y+0,20,20);

//ojos
fill(0);
noStroke();
ellipse(x+25,y+30,2,4);
ellipse(x+15,y+30,2,4);

//sonrisa
noFill();
stroke(0);
beginShape();
vertex(x+15,y+40);
bezierVertex(x+15,y+40,x+20,y+50,x+25,y+40);
endShape();

//Ropa
cordX=10;
while(cordX<30)
{
fill(48,64,198);
stroke(48,64,198);
rect(x+cordX,y+60,5,5);
cordX=cordX+10;
}

cordX=15;
while(cordX<30)
{
fill(48,64,198);
stroke(48,64,198);
rect(x+cordX,y+65,5,5);
cordX=cordX+10;
}

cordX=10;
while(cordX<30)
{
fill(48,64,198);
stroke(48,64,198);
rect(cordX+x,y+70,5,5);
cordX=cordX+10;
}

noFill();
stroke(48,64,198);
rect(x+10,y+60,20,15);

//piernas
stroke(0);
line(x+15,y+75,x+15,y+87);
line(x+25,y+75,x+25,y+86);

//brazos

line(x+10,y+60,x,y+50);
line(x+30,y+60,x+40,y+50);
}


void zanahoria() {
  
//ZANAHORIO
 smooth();
  //cuerpo
  beginShape();
  stroke(247,149,27);
  fill(247,149,27);
 vertex(x,y-10);
 bezierVertex(x,y-10,x+5,y+10,x-20,y+65);
  vertex(x-20,y+65);
  bezierVertex(x-20,y+65,x,y+80,x+20,y+65);
  vertex(x+20,y+65);
  bezierVertex(x+20,y+65,x+15,y+10,x,y-10);
endShape();

//piernas
fill(0);
stroke(0);
line(x-8,y+80,x-8,y+95);
line(x+8,y+80,x+8,y+95);


//vestido
noStroke();
fill(120,211,85);
beginShape();
vertex(x-20,y+65);
  bezierVertex(x-20,y+65,x,y+80,x+20,y+65);
vertex(x+20,y+65);
bezierVertex(x+20,y+65,x+20,y+70,x+22,y+80);
vertex(x+20,y+80);
bezierVertex(x+20,y+80,x,y+80,x-22,y+80);
endShape();

//ojos
fill(0);
noStroke();
ellipse(x-2,y+50,2,4);
ellipse(x+8,y+50,2,4);

//sonrisa
noFill();
stroke(0);
beginShape();
vertex(x-6,y+60);
bezierVertex(x-6,y+60,x,y+70,x+10,y+60);
endShape();

//bracitos

line(x-20,y+65,x-27,y+60);
line(x+20,y+65,x+27,y+60);

  

}



