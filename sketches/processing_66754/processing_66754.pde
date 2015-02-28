
color [] c = new color [12];

int w;
int h;
int a;

float colorG=255;
float colorB=255;
float opacityA=100;

int [] xpos = new int [12];
int [] ypos = new int [12];
int [] spotdistance = new int [12];

void setup(){
  size(340, 400);
  frameRate(15);
  noStroke();
  smooth();
  background(0);
  
  a = 20;
  w = 20;
  
  // color(value);
  // color(value, alpha);
  // color(value, value, value);
  // color(value, value, value, alpha);
  
  // set colors for graph chart
  c[0] = color(86, 116, 185);
  c[1] = color(69, 140, 203);
  c[2] = color(126, 167, 216);
  c[3] = color(132, 147, 202);
  c[4] = color(136, 130, 190);
  c[5] = color(161, 135, 190);
  c[6] = color(244, 154, 194);
  c[7] = color(246, 152, 157);
  c[8] = color(247, 151, 122);
  c[9] = color(249, 173, 129);
  c[10] = color(253, 198, 138);
  c[11] = color(255, 247, 154);
  
  spotdistance[0] = 2*a;
  spotdistance[1] = 4*a;
  spotdistance[2] = 6*a;
  spotdistance[3] = 8*a;
  spotdistance[4] = 10*a;
  spotdistance[5] = 12*a;
  spotdistance[6] = 14*a;
  spotdistance[7] = 16*a;
  spotdistance[8] = 18*a;
  spotdistance[9] = 20*a;
  spotdistance[10] = 22*a;
  spotdistance[11] = 24*a;
}


void draw(){
  
  for(int x = 0; x < 12; x++){
    for(int y = 0; y < 12; y++){
    xpos[x] = x*29;
    ypos[y] = y;
    
    fill(c[x],colorG,colorB,opacityA);
    ellipse(xpos[x]+10,spotdistance[y]-20, 20, 20);
    
    colorG-=0.5;
    colorB-=0.5;
    opacityA-=0.5;
    
    if(colorG<2){
      colorG=255;
    }
    if(colorB<2){
      colorB=255;
    }
    if(opacityA<2){
      opacityA=100;
    }
  }
  }
}

