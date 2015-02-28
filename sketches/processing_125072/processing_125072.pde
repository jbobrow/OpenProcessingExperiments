
float t = 15;
float contador = 0;


void setup(){
  
  background(200,100,50);
  colorMode(HSB, 360, 100, 100, 100);
  size(900,900);
  stroke(0,0,100,t);
  
}

void draw(){
  
  contador = contador + 0.001*(mouseX);
  
  fill(200,100,50,1.5);
  rect(0,0,width, height);
  translate((width/2),(height/2));
  
  float angulo = radians(contador);
  
  //t1
  rotate(angulo);
  triangle (249,119,250,107,262,115);
  fill (204,46,91,t);
  
  //t2
  rotate(angulo);
  triangle (190,159,220,128,235,161);
    fill (58,46,100,t);
  
  //t3
  rotate(angulo);
  triangle (226,100,229,129,250,116);
  fill (204,46,100,t);
  
  //t4
  rotate(angulo);
  triangle (229,154,277,101,287,170);
  fill (58,46,100,t);
  
  //t5
  rotate(angulo);
  triangle (202,243,279,155,320,246);
  fill (204,46,100,t);
  
  //t6
  rotate(angulo);
  triangle (262,184,326,45,437,185);
  fill (58,46,100,t);
  
  //t7
  rotate(angulo);
  triangle (41,67,225,297,337,71);
  fill (204,46,100,t);
  
}

