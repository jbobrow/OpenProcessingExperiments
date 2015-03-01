
int [] sea = new int [100];
void setup(){
  size(1200,700);
}
void draw(){
  for (int i = 0; i < 100; i++){
    sea[i] = i*2;
    fill(mouseX*1,mouseX*1,mouseX+mouseY);
    ellipse(i*mouseX/2,i*mouseY/2,sea[i],sea[i]);
  }
}
