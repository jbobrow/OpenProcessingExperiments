
float wave1;
float wave2;
float wave;

int angle1; //the speed will change this
int angle2; //the pull will change this on angle1

float waveLength = 25;
int changeOfWave = 3;
int speed = 1;
int pull = 1;
int waveHeight = 50;

void setup(){
  size(800, 400);
  background(0);
  stroke(255);
  //strokeWeight(5);
}
void draw(){
  background(0);
  
  for(float i = 0; i < width; i+=5){
    stroke(120,0,0);
    strokeWeight(1);
    wave1 = waveHeight * sin(radians((waveLength)/10*(i + angle1)));
    point(i, wave1 + waveHeight);
    line(i, wave1 + waveHeight, i, 0);
    
    wave2 = waveHeight * sin(radians((waveLength + changeOfWave)/10*(i + angle2)));
    point(i, wave2 + height - waveHeight);
    line(i, wave2 + height - waveHeight, i, height);
    
    
    
    wave = wave1 + wave2;
    stroke(0,100,150);
    line(i, wave + height/2, i, height/2);
    strokeWeight(5);
    stroke(0,255,0);
    point(i, wave + height/2);
    
  }
  angle1+= speed + pull;
  angle2+= pull;
  
  stroke(100);
  fill(255);
  rect(10,10,30,60);
  fill(0);
  text(int(waveLength),15,25);
  text(changeOfWave,15,35);
  text(speed,15,45);
  text(pull,15,55);
  text(waveHeight,15,65);
}
void keyPressed(){
  if(key == 'q'){
    waveLength--;
  }
  if(key=='w'){
    waveLength++;
  }
  if(key=='g'){
    waveHeight--;
  }
  if(key=='h'){
    waveHeight++;
  }
  if(key=='a'){
    changeOfWave--;
  }
  if(key=='s'){
    changeOfWave++;
  }
  if(key=='z'){
    speed--;
  }
  if(key=='x'){
    speed++;
  }
  if(key=='c'){
    pull--;
  }
  if(key=='v'){
    pull++;
  }
}
