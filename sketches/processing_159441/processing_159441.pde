
int perro=50;// bola a la izquierda
void setup(){
 size(800,600);
 background(255,0,0);
}
void draw(){
  //background(255,0,0);
  perro=perro+1;
  ellipse(perro,300,100,100);
  ellipse(perro*0.5,200,10,10);
   ellipse(perro,350,100,100);
  ellipse(perro*0.5,250,100,100);
    ellipse(perro*0.5,200,150,150);
      ellipse(perro*0.5,350,200,200);
        ellipse(perro*0.5,400,250,250);
        ellipse(perro*0.5,450,300,3000);
}

