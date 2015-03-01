
int diam =30;

float t = millis()*0.001;
float rectW =100;
float rectH =100;
float dis;
float i, j;
float co;


void setup() {

  size(700, 700);
}
void draw() {
  background(255);

  rectMode(CENTER);
  for (i = rectW/2; i < width; i+=rectW ) {
    for (j = rectH/2; j < height; j+=rectW ) {
      dis = dist(mouseX, mouseY, i, j);
      rect(i, j, rectW, rectH); 
      co = map(dis, 0, 1000, 0, 255);
      fill(co,0,255);
      stroke(co);
      println(i, j,dis);
    }
    
  }
}



