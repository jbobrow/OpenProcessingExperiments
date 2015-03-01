
float[]numbers= {
  17, 22, 3, 0, 26, 15, 12, 14, 11, 17
};
void setup() {
  size(500, 500);
}
void draw() {
  background(255);
  for(int i=0;i<numbers.length-1;i++){
  float x1=i*40;
  float y1=(numbers[i]*20);
  float x2=(i+1)*40;
  float y2=(numbers[i+1]*20);
  line(x1,y1,x2,y2);
}
noLoop();
}

