
color c1 = color(random(255),random(15),random(30));
color c2 = color(random(30),random(225),random(25));
color c3 = color(random(285),random(240),random(55));
int i;
float  miRandom;
float a;

void setup(){
  size(400,400);
  smooth();
  frameRate(80);

}

void draw(){
  background(0,80);
  noFill();
  translate(width/(random(20)),height/(random(20)));
  a = random(2);
  strokeWeight(a);
  //filter(BLUR, 0.58);  
  int a = int(random(2));
  //miRandom=random(2);
    switch(a){
    case 0:
      stroke(c1);
      bucle();
      break;  
    case 1:
       stroke(c2);
       bucle();
      break;
    case 2:
      stroke(c3);
      bucle();
      break;
  } 
  
}

void bucle(){
  //rect(random(290),random(180),random(400),random(350));
      for(i=0; i<30; i++){
      filter(BLUR, 0.60);  
      filter(INVERT);
      quad(random(390),random(180),random(110),random(400),random(400),random(350),random(400),random(250));
      }
}


