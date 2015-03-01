
/* Try get click to equal 22, 35, 44, 49, 64 and 68 */
int click = 0;
float num = 0;
boolean doOnce = true;

void setup(){
  size(640, 640);
  noStroke();
}

void draw(){
  background(0);
  fill(255);
  for(int i = 0; i < 360; i++){
    float angle = cos(radians(i*click+num))*220;
    
    float x = width/2+sin(radians(i))*angle;
    float y = height/2+cos(radians(i))*angle;
    
    /* Change this to line(x, y, width/2, height/2); for a cool effect */
    ellipse(x, y, 5, 5);
  }
  num += 0.5;
  text("Click: " + click, 5, 15);
}

void mousePressed(){
  if(doOnce){
    doOnce = false;
    click++;
  } 
}

void mouseReleased(){
  doOnce = true;
}


