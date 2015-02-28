
//Autor: Xavi Garcia.
//fondo
void setup (){
  size (200,200, P3D);
  background (250,213,139);
  fill (255);
  stroke(250,213,139);
}
void draw () {
//boca
  fill (0);
  rect (60,120,80,40);
  fill (255,0,0);
  //lengua
  stroke (0);
  ellipse (100,170,30,45);
  line (100,170,100,190);
//cejas
  fill (0);
  triangle (50,20,40,30,80,30);
  triangle (150,20,160,30,120,30);
//dientes
  fill (255);
  triangle (60,120,80,120,70,150);
  triangle (120,120,140,120,130,150);
//redonda ojos
  fill (0);
  ellipse (65,70,60,60);
  ellipse (135,70,60,60);
//lagrimal
  fill (255);
  ellipse (65,70,40,40);
  ellipse (135,70,40,40);
//ojos en movimiento
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight (255,0,0,-dirX,-dirY,-1);
  ellipse (65,70,20,20);
  ellipse (135,70,20,20);

  

}

