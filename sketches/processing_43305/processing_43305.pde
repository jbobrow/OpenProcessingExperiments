
int s;
int m;
int h;
color f = color(0,0,0, 25);

int [] dots = new int[10];

void setup(){
  size(600,600);
  background(255);
  frameRate(1);
  smooth();
  s = second();
  m = minute();
  h = hour();
}

void draw(){
  s = second();
  m = minute();
  h = hour();
  
  for (int i=dots.length-1; i>0; i--){
    dots[i] = dots[i-1];
    dots[0] = s*15;
  }
  for (int i=dots.length-1; i>0; i--){
    noStroke();
    fill(f);
    ellipse(dots[i],random(0,height), 7,7);
  }
  if ((m%5 == 1)&&(s%5 == 0)){
    filter(ERODE);
  }
  if (s%10 == 1){
    f=color(207,211,0, 50);
  }else{
    f=color(0,0,0, 25);
  }
  if(m%5 == 2){
    f = color (36,39,170, 25);
  }
  if(h%2 == 1){
    f = color (255,255,255, 25);
    if ((m%5 == 1)&&(s%5 == 0)){
      filter(ERODE);
    }
    if (s%10 == 1){
      f=color(207,211,0, 50);
    }else{
      f=color(255,255,255, 25);
    }
    if(m%5 == 2){
      f = color (167,171,255, 25);
    }
  }
}



