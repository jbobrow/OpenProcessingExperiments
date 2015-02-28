
int h = hour();
int m = minute();
int s = second();
 
void setup(){
size(300,80);
background(255);}
 
void draw() {
  background(0);
  fill(204);
  ellipseMode(CENTER);
  ellipse(110,29,5,10);
  ellipse(110,45,5,10);
  ellipse(190,29,5,10);
  ellipse(190,45,5,10);
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text(h,width/4,55);
  text(m,width/2,55);
  text(s,width/4*3,55);

if (!mousePressed){
  h=hour();
  m=minute();
  s=second();}
else if(mousePressed){s=s+1; 
  if(s==59){m=m+1;s=0;}
  else if(m==59){m=0;h=h+1;}}
  h=constrain(h,0,23);
  m=constrain(m,0,59);
  s=constrain(s,0,59);}

