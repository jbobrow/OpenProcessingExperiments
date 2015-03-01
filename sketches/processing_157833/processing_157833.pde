

float angle[] = new float[48];
boolean run;

void setup(){
  size(600,600);
  for(int i=0;i<48;i++){
    angle[i]=0;
  }
  run = true;
}

void draw(){
  background(0);

  for(int i=0;i<48;i++){    
    float angle_t = (13*360/48*(49-(float)i))/1300;
    if (run) angle[i]+=angle_t;
    angle[i]%=360;;
  }

  for(int i=0;i<48;i++){
    pushMatrix();
    translate(300,300);
    rotate(angle[i]/180*PI);
    color c = rainbow(i);
    stroke(c);
    strokeWeight((float)i/5+3);
    point(i*5+5,0);
    popMatrix();    
  }
}

void keyPressed(){
  if (key == 'a') run = false;
  if (key == 's') run = true;
}

color rainbow(int k){
  int i = 160-k*160/48;
  int r; //0~40:255 40~80:255~0 80~160:0 160~200 0~255 
    int g; //0~40:0~255 40~120 255 120~160 255~0 ~200 0 
    int b; //0~80:0 80~120:0~255 ~200 255
    r = 255/40*(i-160);
    g = 0;
    b = 255;
    if (i<160){
      r = 0;
      g = 255/40*(40-(i-120));
    }
    if (i<120){
      g = 255;
      b = 255/40*(i-80);
    }
    if (i<80){
      r = 255/40*(40-(i-40));
      b = 0;
    }
    if (i<40){
      r=255;
      g=255/40*i;
      b=0;
    }
    color c = color(r,g,b);
    return c;
}
