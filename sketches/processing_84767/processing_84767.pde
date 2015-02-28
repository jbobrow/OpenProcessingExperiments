
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
  colorTriangle(1,0,initial,initial);
  saturationChanger(i-1, initial-2);
 }
}
void colorTriangle(int iteration, int hue, int saturation,int h){
 if(iteration > 0){
  fill(hue%6,saturation,256);
  triangle(0,0,128*tan(radians(5.625*2)),h,-128*tan(radians(5.625*2)),h);
  rotate(radians(5.625*2));
  colorTriangle(iteration-1, hue+1, saturation, h);
 }
}
