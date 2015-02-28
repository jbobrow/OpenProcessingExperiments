
//Reloj

int s;
int m;
int h;

void setup() {
  size(400, 400);
  colorMode(HSB, 100);
  background(0);
  smooth();
}

void draw() {
  s=second();
  m=minute();
  h=hour();

  if (h > 12) {
    h-=12;
  }

  translate(200, 200);
  rotate(radians(90));

  //segundos
  for (int i=0; i<s; i++) {
    noStroke();
    pushMatrix();
    rotate(radians(6*i));
    ellipse(-25, 0, 5, 5);
    popMatrix();
  }

  //minutos
  for(int f=0;f<m;f++){
     noStroke();
    pushMatrix();
    rotate(radians(6*f));
    ellipse(-100,0,10,10);
    popMatrix();
  }
  
  //horas
  for(int k=0; k<h;k++){
     noStroke();
     fill(90,70,70);
    pushMatrix();
    rotate(radians(30*k));
    ellipse(-100,0,30,30);
    popMatrix();
  }
  
  //hora
  if(h==0){
    noStroke();
    fill(100);
     ellipse(0,0,230,230);
  }else{
    noFill();
    strokeWeight(2);
    stroke(255);
    pushMatrix();
    rotate(radians(30*h));
    line(-100,0,150,0);
    popMatrix();
  }
  
  //minutos
  if(m==0){
    noStroke();
    fill(0,0,100);
    ellipse(0,0,190,190);
  } else {
    noFill();
    strokeWeight (5);
    stroke (50,70,70);
    pushMatrix();
    rotate(radians(6*m));
    line(-60,0,-90,0);
    popMatrix();
  }
   
  //second hand
  if (s==0) {
    noStroke();
    fill(50,0,100);
    ellipse(0,0,110,110);
  } else {
  strokeWeight(2);
  stroke(100, 70,70);
  pushMatrix();
  rotate(radians(6*s));
  line(-25,0, -25,0);
  popMatrix();
  }
}
