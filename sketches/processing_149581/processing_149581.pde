
int nb=40;
float angle[];
int distance[];
float posX;
float posY;
void setup() {
  size(700, 700);
  angle=new float[nb];
  distance=new int[nb];
  for (int i=0; i<nb; i++) {
    distance[i]=8*(i+1);
  }
  colorMode(HSB,360,100,100);
}
void draw() {
  background(0);
  translate(width/2,height/2);
  for(int i=0;i<nb;i++){
  posX=cos(radians(angle[i]))*distance[i];
  posY=sin(radians(angle[i]))*distance[i];
 fill(i*5,100,100);
 noStroke();
  ellipse(posX,posY,8,8);
  angle[i]+=(nb-(float)i+1)/40;
  }
}

