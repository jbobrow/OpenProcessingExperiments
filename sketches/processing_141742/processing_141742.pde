
float sz;
float a;
float varA;
float ruido=0.009;
float varSz;
float ruidoSz=0.009;
PVector segundos = new PVector(0, 0);
PVector minutos = new PVector(0, 0);
PVector horas = new PVector(0, 0);
float segundos_x2;
float segundos_y2;
float angle_s = 0;
float angle_m = 0;
float angle_h = 0;
float radius_s;
float radius_m;
float radius_h;
//  S E T U P 
void setup() {
  background(234, 234, 230);
  size(500, 500);
  smooth();
  frameRate(60);
}
// D R A W 
void draw() {
  fill(255, 0, 0);
  radius_s=random(200, 203);
  radius_m=random(150, 153);
  radius_h=random(100, 103);
  
  if (mousePressed) {
    relojLineas();
  }
  else {
    relojArcos();
  }
}

///A
void relojLineas () {
  fill(234, 234, 230, 20);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);
  varA+=ruido;
  a=noise(varA)*200;
  varSz+=ruido;
  sz=noise(varSz)*150;

  angle_s = map(second(), 0, 60, 0, -TWO_PI);
  angle_s += PI;
  segundos.x = width/2 + (radius_s * sin(angle_s));
  segundos.y = height/2 + (radius_s * cos(angle_s));

  angle_m = map(minute(), 0, 60, 0, -TWO_PI);
  angle_m += PI;
  minutos.x = width/2 + (radius_m * sin(angle_m));
  minutos.y = height/2 + (radius_m * cos(angle_m));

  angle_h = map(hour()%12, 0, 12, 0, -TWO_PI);
  angle_h += PI;
  horas.x = width/2 + (radius_h * sin(angle_h));
  horas.y = height/2 + (radius_h * cos(angle_h));
  noStroke();
  fill(143, 0, 222, a*2);
  triangle(width/2, height/2, segundos.x, segundos.y, horas.x, horas.y);
  noStroke();
  fill(0, 234, 146, a*2);
  triangle(width/2, height/2, segundos.x, segundos.y, minutos.x, minutos.y);
  noStroke();
  fill(125, 222, 0, a*2);
  triangle(width/2, height/2, horas.x, horas.y, minutos.x, minutos.y);
  noStroke();
  fill(255, 0, 0, a);
  ellipse(segundos.x, segundos.y, sz, sz);
  noStroke();
  fill(156, 0, 214, a);
  ellipse(minutos.x, minutos.y, sz*2, sz*2);
  noStroke();
  fill(237, 0, 119, a);
  ellipse(horas.x, horas.y, sz*3, sz*3);
}

///B
void relojArcos () {
  /////- - s e g u n d o s
  // mapeo de valores
  background(234, 234, 230);
  angle_s = map(second(), 0, 60, 0, -TWO_PI);
  angle_s += PI;
  // coordenadas x,y
  segundos.x = width/2 + (radius_s * sin(angle_s));
  segundos.y = height/2 + (radius_s * cos(angle_s));
  // - - - - - - m i n u t o s
  // mapeo de valores
  angle_m = map(minute(), 0, 60, 0, -TWO_PI);
  angle_m += PI;
  //coordenadas
  minutos.x = width/2 + (radius_m * sin(angle_m));
  minutos.y = height/2 + (radius_m * cos(angle_m));
  // - - - - - - - h o r a s 
  // mapeo de valores
  angle_h = map(hour()%12, 0, 12, 0, -TWO_PI);
  angle_h += PI;
  //coordenadas
  horas.x = width/2 + (radius_h * sin(angle_h));
  horas.y = height/2 + (radius_h * cos(angle_h));
  // - - - - - -  a r c o s - - - - - 
  // sec
  noStroke();  
  fill(218, 234, 0);
  arc(width/2, height/2, radius_s*2, radius_s*2, -PI/2, -angle_s+PI/2);
  fill(86, 147, 141);
  //min
  noStroke();
  fill(234, 0, 129);
  arc(width/2, height/2, radius_m*2, radius_m*2, -PI/2, -angle_m+PI/2);
  fill(86, 147, 141);
  //hr
  noStroke();
  fill(0, 116, 255);
  arc(width/2, height/2, radius_h*2, radius_h*2, -PI/2, -angle_h+PI/2);
}










