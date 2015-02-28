
color[] colors = {color(0,0,0),color(255,255,255)};
Boolean jitterOn = true;
Boolean backgroundNoise = false;
int lowBound = 300; //square starts
int highBound = 700; //square ends

void setup(){
  size(1000,1000);
  makeNoise();
}

void draw(){
  loadPixels();
  if(jitterOn){  
    for(int i = 0;i<1000*1000;i++){
      if(i%1000>lowBound && i%1000<highBound && i>lowBound*1000 && i<highBound*1000){
        pixels[i] = colors[floor(random(2))];
      }else if(backgroundNoise){
        pixels[i] = colors[0];
      }
    }
  updatePixels();
  drawFixCross();
  }
}

void mousePressed(){
  if(mouseButton == LEFT){
    jitterOn = !jitterOn;
    makeNoise();
    drawFixCross();
  }else if(mouseButton == RIGHT && jitterOn){
    backgroundNoise = !backgroundNoise;
    makeNoise();
  }
}

void drawFixCross(){
  stroke(#FF0000);
  strokeWeight(4);
  line(490,500,510,500);
  line(500,490,500,510);
}

void makeNoise(){
  loadPixels();
  for(int i = 0;i<1000*1000;i++){
    pixels[i] = colors[floor(random(2))];
  }
  updatePixels();
}


