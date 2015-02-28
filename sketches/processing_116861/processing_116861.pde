
//David Escudero Moyano
void setup(){
  size(300,300);
  background(255,255,255);
}
void draw(){
  ellipse(150,150,180,250); //Circulo que forma la cara
    fill(0,0,0);//color sombrero
  rect(100,10,100,20); //parte de arriba sombrero
  rect(50,30,200,30); //parte de abajo sombrero
    fill(255,255,255); //Color de circulos de ojos
  ellipse(120,120,30,20); //Ojo Izquierdo
  line(100,90,135,105); //ceja izquierda
  ellipse(175,120,30,20); //Ojo Derecho
  line(160,105,190,90); //ceja derecha
    fill (#BDB76B); //color de la pupila
  ellipse(120,120,10,10); //pupila izquierda
  ellipse(175,120,10,10); //pupila derecha
    fill (0,0,0);//color punto negro
  ellipse(120,120,4,4);//punto izquierdo
  ellipse(175,120,4,4);//punto derecho
  //nariz
  ellipse(135,160,5,5);
  ellipse(150,160,5,5);
  line(115,235,115,250);
  line(115,250,175,250);
  line(175,250,175,235);
  line(110,200,170,200);//boca enfadada
    fill(#FFDF80); //Color del circulo de la cara
println(mouseX+", "+mouseY); 
}


