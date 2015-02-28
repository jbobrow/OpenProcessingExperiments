
int lengua = 0;
int colorLengua = color(255,0,0);
int colorPiel = color(255,204,153);
int fondo = color(0,255,0);//

void setup (){
//tamaño de fondo 
  size (300, 400);
}
void draw (){
  background(fondo);
  //println(mouseX+ "," +mouseY);
  stroke(1,1,1);
// cabeza rodones (x, y, width, hight)
  fill(255,204,153);
  ellipse(150, 200, 100, 130);
//cuello
  line(125, 255, 125, 290);
  line(175, 255, 175, 290);
//pelo
  //lado izquiero
  fill(1, 1, 1);
  triangle(90, 260, 70, 290, 80, 185);
  triangle(90, 260, 100, 210, 80, 185);
  triangle(100, 185, 100, 210, 80, 185);
  triangle(100, 185, 85, 135, 80, 185);
  triangle(100, 185, 85, 135, 115, 135);
  triangle(130, 135, 107, 165, 115, 135);
  triangle(123, 144, 130, 140, 125, 140);
  //lado derecho
  triangle(210, 260, 230, 290, 220, 185);
  triangle(210, 260, 200, 210, 220, 185);
  triangle(200, 187, 200, 210, 220, 185);
  triangle(200, 187, 215, 135, 220, 185);
  triangle(200, 187, 215, 135, 185, 135);
  triangle(193, 163, 170, 135, 185, 135);
  triangle(175, 140, 170, 140, 178, 145);
  //parte superior
  arc(150, 140, 130, 120, PI, TWO_PI);
//pestañas derecha
  if(mouseY >=169){
     mouseY= 169;
   }
  fill(255);
  line(170, 169, 169, mouseY);
  line(175, 166, 175, mouseY);
  line(180, 169, 181, mouseY);
  //pestañas inzquierda
  line(120, 169, 119, mouseY);
  line(125, 166, 125, mouseY);
  line(130, 169, 131, mouseY);
//ojo derecho
  fill(255, 255, 255);
  ellipse(175, 180, 15, 25);
  ellipse(175, 185, 15, 15);
  ellipse(175, 180, 15, 10);  
  //ojo izquierdo
  fill(255,255,255);
  ellipse(125, 180, 15, 25);
  ellipse(125, 185, 15, 15);
  ellipse(125, 180, 15, 10);
  fill(0,0,255);
  
//parpadear pupila derecha
    if (mousePressed){
    int relleno = int (random(255));
    fill(relleno,relleno*2,relleno/5);
  }
  else{
    fill(0,0,255);
  }
  ellipse(175, 180, 7, 10);
  fill(1,1,1);
  ellipse(175, 180, 3, 3);

  //parpadear
    if (mousePressed){
    int relleno = int (random(255));
    fill(relleno,relleno*2,relleno/5);
  }
  else{
    fill(0,0,255);
  }
  ellipse(125, 180, 7, 10);
  fill(1,1,1);
  ellipse(125, 180, 3, 3);
//cejas
  noFill();
  arc(175, 160, 20, 15, PI, TWO_PI);
  arc(125, 160, 20, 15, PI, TWO_PI);
// nariz
  arc(150, 200, 15, 10, 0, PI, OPEN);
// boca
if(lengua >= 50){
    lengua = 50;
  }
  fill(colorLengua);
  arc(150, 225, 16, lengua, 0, PI, OPEN);
  //velecidad para bajar la lengua
   lengua = lengua + 2;
  fill(255, 255, 255);
  rect(142, 219, 16, 5);

//mejilla derecha
  noStroke();
  fill(colorPiel);
  ellipse(175, 210, 20, 20);
    //mejilla izquierda
  ellipse(125, 210, 20, 20);}
  
void mousePressed(){
  //mejilla 
 //if (0<=mouseX && mouseX <= 400 & 0<=mouseY && mouseY <= 400) 
  colorPiel = color(255,173,153);//segundo color rosa
  fondo = color(0,0,255);//azul
  colorLengua = color(0,0,255);
  
}
void mouseReleased(){
  fondo = color(247,240,10);//amarillo
  colorPiel = color(255,204,153);
  colorLengua = color(255,0,0);

}


