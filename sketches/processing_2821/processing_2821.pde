
int i;

void setup(){
  size(400,400);
  smooth();
  frameRate(80);

}

void draw(){
  float a = random(20);
  float b = random(40);
  float c = random(60);
  background(a, b, c, 40);
  //filter(INVERT);
  bucle();
 saveFrame();
}

void bucle(){
  //rect(random(290),random(180),random(400),random(350));
      for(i=0; i<30; i++){
      filter(BLUR, 0.60);  
      filter(INVERT);
      quad(random(390),random(180),random(110),random(400),random(400),random(350),random(400),random(250));
      }
}

