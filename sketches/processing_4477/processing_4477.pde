
int halfw, halfh;

float sweepLOD;

int dim_avg;

PFont font;

boolean runonce = true;

float scalefact;

int fade;

boolean isSmall;

void setup(){
  size(480, 480);
  smooth();
  background(0);
  frameRate(55);

  font = loadFont("font.vlw");
  textFont(font);
  textAlign(CENTER);

  strokeWeight(5);

  //dim_avg = (width+height)/2;

  if(width<=height)dim_avg=width;
  else dim_avg=height;
  
  if(width<150 || height<150) scalefact=1.0;
  else{
    scalefact = .75;
    isSmall=true;
  }
  sweepLOD = (dim_avg*.0003);

  if(width>height || width==height)halfw = halfh = height/2;
  else halfw = halfh = width/2;

  //halfw = width/2;
  //halfh = height/2;

  fade = (int) (100/frameRate);

  if(runonce){
    for(int n=0; n<1000; n++)drawtime(n, 'u');
    for(int n=0; n<60; n++){
      drawtime(n, 's'); 
      drawtime(n, 'm');
    }
    for(int n=0; n<24; n++)drawtime(n, 'h');
  }
}

void draw(){
  fill(0, 20, 0, fade);
  stroke(0, 0);
  //ellipse(halfw-1, halfh-1, width-4, height-4);
  rect(0, 0, width, height);
  rect(halfw+15, halfh-10, 20, 15);

  //if(millis()%3==0)
  drawtime(abs(millis()), 'u');
  drawtime(second(), 's');
  drawtime(minute(), 'm');
  drawtime(hour(), 'h');

  fill(0, 225, 0);
  text(""+fmt(hour())
    +":"+fmt(minute())
    +":"+fmt(second())
    //+"."+millis()
  , halfw, halfh+3);

  //text(mouseX+", "+mouseY, mouseX, mouseY);
}

String fmt(int t){
  if(t<10) return "0"+t;
  else return ""+t;
}

void drawtime(int time, char unit){
  float multiplier = 0.0;
  float t = 0;
  if(unit=='h')     { 
    multiplier = 0.30; 
    t = time*360/24;
  }
  else if(unit=='m'){ 
    multiplier = 0.48; 
    t = time*6;
  }
  else if(unit=='s'){ 
    multiplier = 0.70; 
    t = time*6;
  }
  else if(unit=='u'){ 
    multiplier = 0.98; 
    t = time*360/1000;
  }
  else multiplier = t = 0;

  float lod = (sweepLOD)/multiplier;

  stroke(0, 255, 0);

  float i;
  for(i=-lod*1; i<(lod*3); i+=lod){
    line((int) halfw-(halfw*(multiplier)*sin(-radians(t+i))), 
    (int) halfh-(halfh*(multiplier)*cos(-radians(t+i))), 
    (int) halfw-(halfw*(multiplier*scalefact)*sin(-radians(t+i))), 
    (int) halfh-(halfh*(multiplier*scalefact)*cos(-radians(t+i))));
  }
}

