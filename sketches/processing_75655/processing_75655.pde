
//Autor: Lulu Z.
int posicion=0;
int posicion2=0;
void setup(){
  size(400,400);//Pantalla
  background(100,100,100);//fundo blanco
  fill(100,170,200);//relleno azul
  ellipse(100,100,100,100);
  fill(300,200,200);//relleno rosa
  ellipse(300,100,100,100);
  stroke(300,300,0);
  fill(300,300,0);//relleno amarillo
  ellipse(200,200,250,230);
  fill(300,300,300);//r.blanco
  ellipse(150,170,65,65);
  ellipse(250,170,65,65);
  stroke(0);
  fill(0);//r.negro
  ellipse(150,170,45,45);
  ellipse(250,170,45,45);
  stroke(300,300,300);
  fill(300,300,300);//r.blanco
  ellipse(161,161,15,15);
  ellipse(261,161,15,15);
}
void draw(){
  stroke(100,posicion,posicion);
  fill(100,posicion,posicion);//relleno brillante
  ellipse(150,180,30,20);
  stroke(posicion,100,posicion);
  fill(posicion,100,posicion);
  ellipse(250,180,30,20);
  stroke(0);
  fill(0);
  ellipse(150,175,15,12);
  ellipse(250,175,15,12);
  stroke(posicion,posicion,100);
  posicion=(posicion+50)%500;//movimiento
  posicion2=(posicion2+100)%500;
  stroke(300,300,300);//arco
  fill(300,300,300);
  arc(200,230,100,100,6.2,9.5);
  stroke(posicion,posicion,posicion);
  fill(posicion2,posicion2,posicion2);
  quad(80,50,85,65,80,80,75,65);
  quad(45,65,48,75,45,85,42,75);
  quad(330,250,335,265,330,280,325,265);
  quad(370,215,373,225,370,235,367,225);
}


