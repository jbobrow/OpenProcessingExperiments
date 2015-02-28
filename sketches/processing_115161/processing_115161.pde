
int coordx;
int coordy;

void setup()
{
  size(400,400);
  background(255);
  strokeWeight(2);
}

void draw()
{
  coordx=175;
  coordy=175;
  
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
