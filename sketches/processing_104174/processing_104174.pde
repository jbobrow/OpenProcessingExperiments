
int time = 0;
 
void setup(){
  size(500, 500);
  noFill();
  stroke(250 );
  colorMode(RGB, 255);
}
 
void draw(){
  background(255,0);


  for(int i = 0; i < 360; i+= random(3,5)){
    float x = cos(radians(i)) * 200 + width / 2;
    float y = sin(radians(time + i)) * 200/PI + height / 2;
    float w = cos(radians(time + i)) * 4;
    w = abs(w);
    stroke(i-300, i/2, 255, 80);
    ellipse(x, y, w, w);
    ellipse(y, x, w, w);
     stroke(i-300, i/2, 255, w+20);
    ellipse(x, y, w*4, w*4);
    ellipse(y, x, w*4, w*4);
  }
    for(int i = 0; i < 360; i+= random(4,5)){
    float x = cos(radians(i)) * 200 + width / 2;
    float y = sin(radians(time + i)) * -200/PI + height / 2;
    float w = cos(radians(time + i)) * 4;
    w = abs(w);
    stroke(i-300, i/2, 255, 80);
     if(time> 120){
     stroke(255, i/3, i/3, 153);
     }
    
    ellipse(x, y, w, w);
    ellipse(y, x, w, w);
     stroke(i-300, i/2, 255, w+20);
    
    ellipse(x, y, w*4, w*4);
    ellipse(y, x, w*4, w*4);
  }
  for(int i = 0; i < 360; i+= random(3,8)){
    float x = cos(radians(i)) * 15 + width / 2;
    float y = sin(radians( i)) * -30/PI + height / 2;
    float w = cos(radians(time + i)) * 8;
    w = abs(w);
    stroke(255, i/3, i/3, time/153);
    ellipse(x, y, w, w);
    ellipse(y, x, w, w);
     stroke(i-300, i/2, 255, time/100);
    ellipse(x, y, w*3, w*3);
    ellipse(y, x, w*3, w*3);
  }
    for(int i = 0; i < 360; i+=random (3,8)){
    float x = cos(radians(i)) * 15 + width / 2;
    float y = sin(radians( i)) * 40 + height / 2;
    float w = cos(radians(time + i)) * 12;
    w = abs(w);
    
     stroke(i-300, i/2, 255, w-12);
    ellipse(x, y, w*3, w*3);
    ellipse(y, x, w*3, w*3);
    stroke(255, i/3, i/3, w-12);
    ellipse(x, y, w, w);
    ellipse(y, x, w, w);
  }
  time++;
}
