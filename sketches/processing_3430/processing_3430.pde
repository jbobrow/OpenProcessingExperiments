
void setup() {
  size(121,361);
}

void draw() {
  background(204);
  segundos();
  minutos();
  horas();
}

void segundos(){
  int s = second();  // 0 - 59
  fill(s*4,0,0);
  rect(0,0,120,120);
  delay(0);
}

void minutos(){
  int m = minute();  // 0 - 59
  fill(0,m*4,0);
  rect(0,120,120,240);
  delay(0);
}

void horas(){
  int h = hour();  // 0 - 23
  fill(0,0,h*10);
  rect(0,240,120,360);
  delay(0);
}




