
float rectX=10;
float rectY=10;
float rectdX=10;
float rectdY=2;
int [] sea = new int[100];
void setup(){
  size(1200,700);
}
void draw(){
  rectX=rectX+rectdX;
  rectY=rectY+rectdY;
  for (int i = 0; i < 100; i++){
    sea[i] = i*2;
    stroke(0,255,0);
    fill(255,0,0);
    rect(i*rectX/2,i*rectY/2,sea[i],sea[i]);
  }
}
