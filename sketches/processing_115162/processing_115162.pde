
int coordx;
int coordy;

int pasx;
int pasy;

void setup()
{
  size(400,420);
  background(200);
  strokeWeight(2);
  smooth();
}

void draw()
{
  //establezco los valores de cada paso
  
  pasx=40;
  pasy=52;
  
  //hago un for para modificar de forma sistemática mi coordx y coordy
  
  for(coordx=0;coordx<=width;coordx+=pasx)
  for(coordy=9;coordy<=height;coordy+=pasy)
{
  //cuerpo
  noStroke();
  fill(255,246,64);
  ellipse(coordx+20,coordy+10,30,30);
  rect(coordx+5,coordy+10,30,30);
  
  //ojo
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(coordx+20,coordy+10,20,20);
  
  //color ojo
  stroke(0);
  strokeWeight(1);
  fill(124,66,9);
  ellipse(coordx+20,coordy+10,5,5);
  
  //boca
  stroke(0);
  strokeWeight(2);
  line(coordx+10,coordy+27,coordx+30,coordy+27);
  
  //dientes
  stroke(0);
  strokeWeight(1);
  fill(255);
  rect(coordx+20,coordy+27,4,4);
  rect(coordx+24,coordy+27,4,4);
  
  //pantalon
  strokeWeight(1);
  fill(6,109,185);
  rect(coordx+5,coordy+35,30,5);
  }
}
