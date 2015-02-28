
void setup(){
 colorMode(HSB);
 size(512,512);
 smooth();
 noStroke();
 frameRate(16);
}
int s=256;
void draw(){
 translate(256,256);
 colorTriangle(256,s%256);
 s=s+1;
}
void colorTriangle(float i, int a){
 if(i > 0){
  if(atan2(mouseY-256,mouseX-256)>0){
    fill((a+256-(atan2(mouseY-256,mouseX-256))*256/(2*PI))%256,256,256);
  }
  else{
    fill((a-(atan2(mouseY-256,mouseX-256))*256/(2*PI))%256,256,256);
  }
  rotate(radians(5.625/4));
  triangle(0,0,128*tan(radians(5.625/4)),256,-128*tan(radians(5.625/4)),256);
  colorTriangle(i-1, a+1);
 }
}


