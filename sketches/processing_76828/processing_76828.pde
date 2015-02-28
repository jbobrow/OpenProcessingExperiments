
//Autor: Lulu Z.
int posicion=0;
int posicion2=0;
int relleno=0;
void setup(){
  size(400,400);//Pantalla
}
void draw(){
  background(300,300,300);//fundo blanc
  
  fill(150,200,posicion);//relleno azul
  ellipse(100,100,mouseX/3,mouseY/3);
  fill(posicion,200,200);//relleno rosa
  ellipse(300,100,mouseX/3,mouseY/3);
  
  stroke(300,300,300);
  fill(250,posicion,100);//relleno amarillo
  ellipse(200,200,250,230);
  posicion=(posicion+1)%300;
  
  fill(300,300,300);//r.blanco
  ellipse(150,170,mouseX/5,mouseY/5);
  ellipse(250,170,mouseX/5,mouseY/5);
  
  stroke(300,300,300);
  fill(relleno);//r.negro
  ellipse(150,170,mouseX/6,mouseY/6);
  ellipse(250,170,mouseX/6,mouseY/6);
  
  stroke(300,300,300);
  fill(300,300,300);//r.blanco
  ellipse(161,161,mouseX/16,mouseY/16);
  ellipse(261,161,mouseX/16,mouseY/16);
  
  stroke(300,300,300);//arco
  fill(300,300,300);
  arc(200,230,mouseX/5,mouseY/5,6.2,9.5);
  
  stroke(posicion,posicion,posicion);
  fill(posicion2,posicion2,posicion2);
  quad(80,50,85,65,80,80,75,65);//brillantes
  quad(45,65,48,75,45,85,42,75);
  quad(330,250,335,265,330,280,325,265);
  quad(370,215,373,225,370,235,367,225);
  posicion2=(posicion2+10)%300;
  
}
void mousePressed(){
  relleno=190;
}
void mouseReleased(){
  relleno=0;
}


