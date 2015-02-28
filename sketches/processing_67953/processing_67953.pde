
//René Hernandez
boolean fin = true;
int i,j;

void setup()
{
  noFill();    
  smooth();  
  background(255);  
  size(400,200);   
  strokeWeight(5);  
}
void draw()
{
  background(255);
  stroke(0,0,255);
  ellipse(50,50,100,100);
  stroke(0,0,0);
  ellipse(130,50,100,100);
  //Verde
  stroke(0,255,0);
  ellipse(200,100,100,100);
  //Amarillo
  stroke(255,255,0);
  ellipse(100,100,100,100);  //EL PRIMER PUNTO ES DEL CENTRO
  //Rojo
  stroke(255,0,0);
  
  if(fin)
  {
  i =(int)random(50,300);
  j =(int)random(50,370);
  if(j>265 && j<275)
    fin = false;
  }
  else
  {
    i = 50;
    j= 200;
  }
  ellipse(j,i,100,100);
}



