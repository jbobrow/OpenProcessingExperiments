
/*
SANDRA LETICIA RAMIREZ TIRADO
MONDRIAN PROYECT
01/20/2011
*/

void setup(){
  size(800,800);
  background(255,255,255);
  
}
void draw(){

  fill(237,215,6);//amarillo izq abajo
  noStroke();
  rect(0,800,105,-195);
  fill(237,215,6);//amarillo derecha arriba
  rect(480,0,285,300);
    fill(220,42,27);//rojo derecha abajo
  rect(760,600,80,200);
  stroke(0);
   line(300,150,300,785);//vertical 3
      line(190,10,190,500);//vertical 2
  /*LINES*/
  stroke(0,0,0);
  strokeWeight(8);
  line(300,770,760,770);//horizontal 6
  line(10,100,760,100);//horizontal 1
  line(10,300,760,300);//horizontal 2

/*FIGURES*/ 
  noStroke();
  fill(0,0,0);//negro izq arriba
  rect(105,705,192,-208);
  fill(0,0,0);//negro abajo
  rect(296,770,190,-73);
  fill(200,201,198);//gris abajo del rojo, junto al negro
  rect(296,705,190,-208);
  fill(220,41,27);//rojo grande
  rect(105,505,380,-400);
   
  /*LINES-2*/
  stroke(0);
  strokeWeight(8);
  line(110,500,760,500);//horizontal 3
  line(110,700,760,700);//horizontal 5
  line(105,100,105,785);//vertical 1
  
  fill(31,28,164);//azul abajo
  noStroke();
  rect(480,770,280,-170);
  stroke(0);
  line(480,10,480,765);//vertical 4
  line(760,10,760,785);//vertical 8
   line(620,300,620,500);//vertical 7
  line(10,600,800,600);//horizontal 4
  line(400,770,760,770);//horizontal 6
}
