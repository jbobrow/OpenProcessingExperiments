
void setup (){
  size(600,500);
  background(0);
}

void draw(){
  monoA(20,10,150,50,255); //cooox, cooy, color cara, tamaño ojos, color ojos
  monoA(200,10,200,40,0);
  monoB(220,280,90,30,230);
  monoB(220,90,240,40,10);
}

void monoA (int x, int y, color cuerpo, int sizeEyes, color Eyes){
  pushMatrix();
  translate(x,y);
  fill(cuerpo);
  rect(30,60,150,350,20);
  fill(Eyes);
  ellipse(75, 120, sizeEyes, sizeEyes);
  ellipse(135, 120, 30, 30);
  stroke(0);
  line(20,55,60,55);
  popMatrix();
}

void monoB (int x, int y, color cuerpo, int sizeEyes, color Eyes){
  pushMatrix();
  translate(x,y);
  fill(cuerpo);
  ellipse(250,60,100,150);
  fill(Eyes);
  ellipse(230, 40, sizeEyes, sizeEyes);
  ellipse(270, 45, 20, 20);
  stroke(0);
  popMatrix();
}
