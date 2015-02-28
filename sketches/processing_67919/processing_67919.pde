
float inicio=0.0;
float fin=0.0;
float x=0;
int t=0,t1=0;

void setup(){
  size(500,500);
  noFill();
  smooth();
  background(255);
  frameRate(1);
}

void draw(){
  background(0);
  if(t == 0)
  {
    inicio = QUARTER_PI;
    fin = PI+HALF_PI+QUARTER_PI;
    t=1;
    //DIENTES
    fill(250,250,250);
    triangle(280,220,300,200,300,220);
    triangle(280,280,300,300,300,280);
    //LENGUA
    fill(250,0,0);
    arc(250,250,50,50,0,TWO_PI);
    //BOLITA
    fill(255,255,0);
    arc(306,250,30,30,0,TWO_PI);
    
  }
  else
  {
    inicio = 0;
    fin = TWO_PI-0.02;
    t=0;
  }
  fill(255,255,0);
  arc(250,250,150,150,inicio,fin);
  //BOLITAS
  arc(348,250,30,30,0,TWO_PI);
  arc(388,250,30,30,0,TWO_PI);
  //OJO
  fill(0,0,0);
  arc(240,220,30,30,0,QUARTER_PI+HALF_PI);
  arc(240,220,30,30,PI+QUARTER_PI,TWO_PI);
}
