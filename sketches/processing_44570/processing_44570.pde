
void setup(){
size(700,700,P3D);
smooth();


}
void draw(){
  background(40);
float xnoise = 0.0; 
float ynoise = 0.0; 
float znoise = 0.0; 
float inc = 0.004;


for (int y = 0; y < 700; y++) {
for (int x = 0; x < 700; x++) {
  for (int z = 0; z < 10; z++) {
    noiseDetail(1,0.001);
  float value = noise(xnoise*0.2, ynoise,znoise) * 255; 
  stroke(value*y,value+x,value/z);
  point(x+value, y*value,z*value);
  xnoise = xnoise + inc;
  }
} 
}

xnoise = 0; 
ynoise = ynoise + inc;
znoise = 0;
}



