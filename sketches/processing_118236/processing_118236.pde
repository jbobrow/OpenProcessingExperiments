
int x=200;
int y=200;
int x2=400;
float y2=200;
int x3=300;
int y3=400;
float t1 = 0;
float t2 = 1;
float t3 = .5;
void setup(){
  size(600,600);
  background(255);
  noStroke();
  //noFill();
  strokeWeight(.5);
  frameRate(900);
}
void draw(){
  t1+=.1;
  t2+=.1;
  t3+=.1;
  fill(0,100,0,2);
  //stroke(0,255,0,30);
  dot();
  fill(0,0,100,2);
  //stroke(0,0,255,30);
  dot2();
  fill(100,0,0,2);
  //stroke(255,0,0,30);
  dot3();
}
  
  
void dot(){
  ellipse(x,y,8,8);
  x += int(random(-1,1)*noise(t1)*3);
  //x+=1;
 y += int(random(-1,1)*noise(t1)*3); 
 //y+=6;
 if(x>width||x<0){
 x=200;
 y=200;
 }
 if(y>height||y<0){
   y=200;
   x=200;
 }
}
void dot2(){
  ellipse(x2,y2,8,8);
  x2 += int(random(-1,1)*noise(t2)*3);
  //x+=1;
 y2 += int(random(-1,1)*noise(t2)*3); 
 //y+=6;
 if(x2>width||x2<0){
 x2=400;
 y2=200;
 }
 if(y2>height||y2<0){
   y2=200;
   x2=400;
 }
}
void dot3(){
 ellipse(x3,y3,8,8);
 x3 += int(random(-1,1)*noise(t3)*3);
 y3 += int(random(-1,1)*noise(t3)*3); 
 if(x3>width||x3<0){
 x3=300;
 y3=400;
 }
 if(y3>height||y3<0){
   y3=400;
   x3=300;
 }
}
