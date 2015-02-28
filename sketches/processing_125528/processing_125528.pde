
color[] colors = {color(0,0,0),color(255,255,255)};
Boolean jitterOn = true;
Boolean backgroundNoise = false;
Boolean centeredNoise = true;
int lowBound = 250; //square starts
int highBound = 550; //square ends
PImage snakes;


void setup(){
  size(800,800);
  snakes = loadImage("rotsnakes.png");
  makeNoise();
}

void draw(){
  loadPixels();
  if(jitterOn){  
    for(int i = 0;i<800*800;i++){
      if(centeredNoise && i%800>lowBound && i%800<highBound && i>lowBound*800 && i<highBound*800){
        pixels[i] = colors[floor(random(2))];
      }else if(!centeredNoise && (i%800<lowBound || i%800>highBound) && (i<lowBound*800 || i>highBound*800)){
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
  }else if(mouseButton == RIGHT && !jitterOn){
    centeredNoise = !centeredNoise;
  }
}

void drawFixCross(){
  stroke(#FF0000);
  strokeWeight(4);
  line(390,400,410,400);
  line(400,390,400,410);
}

void makeNoise(){
  image(snakes,0,0);
}


