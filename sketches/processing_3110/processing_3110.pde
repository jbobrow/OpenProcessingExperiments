
void setup(){
  size(500,500);
  smooth();
  noStroke();
  //noLoop();
}
void draw(){
  background(255,30,10);

  fill(4.25*second());//SEGUNDOS
  rect(1,1,8.3*second(),20);

  fill(4.25*minute());//MINUTOS
  rect(1,120,8.3*minute(),20);

  fill(10.625*hour());//HORAS
  rect(1,230,20.63*hour(),20);

  fill(8.22*day());//DIA  DE SEMANA
  rect(1,340,16.29*day(),20);

  fill(21.25*month());//MESES
  rect(1,450,41.67*month(),20);

}



