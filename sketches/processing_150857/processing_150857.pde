
//Author : Kyle K
// Jun 8 2014
//
//  Rotating circles that create some really funky designs
//  Switch from color, to white, to grey and start and stop rotation to create
//  Interesting patterns
//
//  Key 'c' = color on
// Key 'g' = random greys
// Key 'w' = white
// Key 'p' = start/stop rotation\
// Key 's' = save image
// Mouse - Left click = add circle
//          Right click = delete circle
int r;
int num;
float theta;
int center;
int dt;
color c;
boolean colorOn;
boolean greyOn;
boolean stop;
void setup(){
  colorOn=true;
  greyOn=false;
  size(600,600);
  background(255);
  r=50;
  num=6;
  theta=360/num;
  dt=35;
  c=color(255);
}

void draw(){
  
  int center = width/2;
  fill(255);
  if(stop==false){
  theta+=sin(TWO_PI/PI);
  }
  for(int j=0;j<5;j++){
    if(colorOn==true){
     c = color(random(255),random(255),random(255));
    } else if(greyOn==true) {
     c = color(random(155));
    } else {
      c=color(255); 
    }
    r = j*mouseY;

      for(int i = 0;i<num;i++){
        float x = r*sin(TWO_PI*i/num + theta)+center;
        float y = r*cos(TWO_PI*i/num + theta)+center;
        fill(c);
       ellipse(x,y,r,r);
    }
  }

}

void mousePressed(){
 if(mouseButton==LEFT){
  num++;
 }

if(mouseButton==RIGHT){
    if(num>1){
  num--;
   } 
} 
}

void keyPressed(){
 if(key=='c'){
   colorOn=true;
   greyOn=false;
 }
 
 if(key=='g'){
   greyOn=true;
   colorOn=false; 
 } 
 
 if(key=='w'){
   greyOn=false;
   colorOn=false; 
 } 
 
 
 if(key=='p'){
   if(stop==false){
   stop=true;
   } else {
    stop=false; 
   }
 }
 
 if(key=='s'){
  saveFrame("saveimage.jpg"); 
 }
 
 if(key=='+'){
  num++; 
 }
 if(key=='-'){
   if(num>1){
  num--;
   } 
 }
 
 
 
}

