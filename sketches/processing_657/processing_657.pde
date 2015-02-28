




void setup() {
  size(600, 600);
  noStroke();
  
}
int segundos;
int minutos;
int horas;


void draw() {
  background(0);
 

  
  segundos = second();
  minutos = minute();
  horas = hour();
  smooth();

//circulo del centro

  strokeWeight(0);
  noStroke();
  fill(255,255,0);
  for(int i=0; i<650;i=i+10){
    ellipse(i,20,10,10);
   
  }
  //horas
pushMatrix();
  strokeWeight(3);
  translate(300,300);
  rotate((PI/6)*hour());
  fill(255,255,0);
  stroke(255,255,0);
  strokeWeight(9);
  line(0,-50,0,40);
    popMatrix();


//lineas
  noStroke();
  fill(255,255,0);
  for(int i=1; i<600;i=i+15){
rect(1,i,segundos*10,8); 
  }
   
    noStroke();
  fill(255,0,0);
  for(int i=1; i<600;i=i+15){
rect(0,1,1,1); 
  }
 
  //minutos 
 
 strokeWeight(3);
  translate(300,300);
  rotate((PI/30)*minute());
  fill(255);
  stroke(random(8),0,0);
  strokeWeight(80);
  point(0,-190);
 


}


