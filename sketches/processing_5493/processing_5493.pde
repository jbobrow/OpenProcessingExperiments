
int x=0;

void setup(){
  size(400, 400);
  smooth();
  colorMode(HSB, 360, 100, 100);
}


void draw(){
  
int h=hour();
int m=minute();
int s=second();
  
  if(h>=12){
    background(200, 100, 100-4.15*h);
  }else{
    background(200, 100, 0+4.15*h);
  }

  
  if(keyPressed==true){
    
 stroke(200, 50, 40);
 line(0, 100, 400, 100);
 strokeWeight(3);
 line(0, 200, 400, 200);
 strokeWeight(1);
 line(0, 300, 400, 300);
 
 line(100, 0, 100, 400);
  strokeWeight(3);
 line(200, 0, 200, 400);
  strokeWeight(1);
 line(300, 0, 300, 400);
  noStroke();
}
  
  
  if(m<1){//makes it so that minute bar is still visible on even-hour times
    m=1;
  }
  
    if(h<=1){//makes it so that hour bar is still visible from midnight to 1am
    h=1;
  }
  
  
   fill(44, 100, 80);
  noStroke();
  
  float cx=(.5*width)-8.33*h;
  float cy=(.5*height)-3.33*m;
  float tw=16.67*h;
  float th=6.67*m;
  
  rect(cx, cy, tw, th);
  
    noStroke();
   if(h>=12){
 fill(200, 100, 0+4.15*h);
  }else{
    fill(200, 100, 100-4.15*h, 100);
  }
  
  float sw=tw/60;
  
  rect(cx, cy, s*sw, th);

}

