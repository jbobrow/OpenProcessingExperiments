
void setup(){
 colorMode(HSB);
 size(512,512);
 translate(256,256);
 smooth();
 noStroke();
 saturationChanger(128,256);
}
void saturationChanger(int i, int initial){
 if(i > 0){
  colorTriangle(256,0,initial,initial);
  saturationChanger(i-1, initial-2);
 }
}
void colorTriangle(int iteration, int h, int s,int height){
 if(iteration > 0){
  fill(h%256,s,256);
  triangle(0,0,128*tan(radians(5.625/4)),height,-128*tan(radians(5.625/4)),height);
  rotate(radians(5.625/4));
  colorTriangle(iteration-1, h+1, s, height);
 }
}


