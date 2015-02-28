
color bgcolor = color (0,0,0);
color gridcolor = color (102,250,81,60);
color radarcolor = color (66,173,51,200);
color sweepercolor = color (102,250,81);
color flashcolor = color (102,250,81);
float s;
float rond;
int fadeout;
int fadeouttime = 50;

boolean rd = false;
float rNrX;
float rNrY;

void setup(){
  size(800, 640, JAVA2D);
} 

void draw(){
  background(bgcolor);
  smooth();
  grid();  
  clock();
  sweeper();
  flash();
}

void grid(){
  strokeWeight(1);
  stroke(gridcolor);
  for(int i = -10; i <= width + 10; i+=15){
    line(-10,i, width+10, i);
    line(i,-10,i,height+10);
  }
} 

void clock(){
  // Variabelen
  noFill();
  float h = hour();
  int m = minute();
  int s = second();
  float begin = radians(270);
  float endh = radians(270+(h*30));
  float endm = radians(270+(m*6)+4);
  float ends = radians(270+(s*6)+4);  
  int clocksize = width-200;
  
  strokeWeight(10);
  strokeCap(PROJECT);
  stroke(radarcolor);
  
  // Hours  
  if(h > 12){
    h-=12;
    endh = radians(270+(h*30));
  } 
  arc(width/2, height/2, clocksize, clocksize, begin, endh); 
  
  // Minutes 
  arc(width/2, height/2, clocksize-100, clocksize-100, begin, endm); 
  
  // Seconds
  arc(width/2, height/2, clocksize-200, clocksize-200, begin, ends); 
}

void sweeper(){
  rond = map(millis(), 0, 6000, 0, TWO_PI);
  strokeWeight(7);
  float f = 0.01; 
  for(int i = 38; i>=1; i--){
  stroke(sweepercolor, 2*i);
  line(width/2, height/2, (width/2 + cos(rond-f) * 800), (height/2 + sin(rond-f) * 800));
  f += 0.01;
  }
}

void flash(){
   fill(flashcolor,fadeout);
   noStroke();
   rect(-5,-5, width+5, height+5);
   if(cos(rond) >= 0.00 && sin(rond) <= -0.99){
           fadeout = fadeouttime;
           rd = false; 
   }
   if(fadeout <= fadeouttime && fadeout > 0){
     fadeout --;
   }
}

