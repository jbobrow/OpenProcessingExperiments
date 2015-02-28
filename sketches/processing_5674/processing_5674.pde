
float noiseRange=0.02;
float way;
int mesh=2;
void setup(){
size(400,400,P3D);
  noiseDetail(1,0.1);
}
void draw() {
  background(0);
  translate(random(195,200),random(195,200));
  way=way+1;
  for(int i=80; i < 300; i=i+mesh) {
    for(int j=20; j < 320; j=j+mesh) {
      float noiseVal = noise((way+i)*noiseRange, way*noiseRange);
      rotate(noiseVal/110);
      stroke(j,i,mouseX,30);
      line(i+noiseVal*80,j+noiseVal*80,j+noiseVal*80,i+noiseVal*80);

    }
  }
}







