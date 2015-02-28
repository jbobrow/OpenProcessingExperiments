
//verdad
PFont tex;
float px=0, py=0, opa=0;
int nada;

void setup() {
  size(800, 400);
  background(255);
  smooth();
  tex = loadFont("CourierNew36.vlw"); 
  textFont(tex);
}

void draw() {
  strokeWeight(5);
  stroke(0, 3);
  for (int x=0; x<=width; x+=5) {
    for (int y=0; y<=height; y+=5) {
      point(px+noise(x)*random(width*2), py+noise(y)*random(height*2));
    }
  }
  scale(0.5);
  fill(255);
  text("la verdad se revelará tarde o temprano", width-width*0.9, height-height*0.85);
  scale(2);
  fill(255, opa);
  text("VERDAD?", width-width/5, height-height/9);
  opa+=0.005;
}


