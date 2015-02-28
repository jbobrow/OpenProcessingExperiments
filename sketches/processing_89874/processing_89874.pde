
int j = 0;
void setup(){
  size(700,700);
  colorMode(HSB);
  frameRate(60);
  background(0);
}
void draw(){
  if(j < 699){
    translate(frameCount%(700), random(700));
     fill(frameCount%(255), 255, 255);
  j++;
  }
  if(j >= 699 && j < 1401){
    translate((-1*frameCount%(700))+700, random(700));
      fill(frameCount%(255), 0, 255);
      j++;
  }
  if(j >= 1401){
     translate(random(700), frameCount%(700));
     fill(frameCount%(255), 255, 255);
     j++;
  }
  noStroke();
ellipse(0, 0, 100, 100);
}
