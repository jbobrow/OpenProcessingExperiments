
float x1 = 125; //starting x position
float y1 = 125; //starting y position

float x2 = 150; //starting x position
float y2 = 50; //starting y position

float spd = 2;   //speed
float dm = 30;   //diameter
float sen = 40;  //sensitivity
float r = 0;     //shiver

void setup(){
  smooth();
  size(250, 250);
  ellipseMode(CENTER);
  strokeWeight(0.5);
}
void draw(){
  background(255);
////////////////////////////////////    
float xm = mouseX;
float ym = mouseY;
float dx = dist(x1, y1, xm, ym);
////////////////////////////////////    
if(spd >= 10){  //acceleration
  spd -=.008;
} else {
  spd +=.008;
}
//
if( xm >= x1){ 
x1 += -spd;
}else {
 x1 += +spd;
 }
 //
if( ym >= y1){ 
y1 += -spd;
}else {
 y1 += +spd;
 }
////
if( xm >= x1+sen){ 
  fill(255);
spd = 0;
r = 0;
}else{
  r = random(-1, 1);
  fill((dx*5), (dx*5), (dx*5));
}
//
if( xm <= x1-sen){ 
  fill(255);
spd = 0;
r = 0;
}
//
if( ym >= y1+sen){ 
  fill(255);
spd = 0;
r = 0;
}
//
if( ym <= y1-sen){ 
  fill(255);
spd = 0;
r = 0;
}

if(mousePressed){
  x1 = xm;
  y1 = ym;
  r = random(-2, 4);
}

if(keyPressed){
  if(key == ' '){
  x1 = 125;
  y1 = 125;
  }
}

ellipse(x1+r, y1+r, dm, dm);



}
                
