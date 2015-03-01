
int a;
int b;
int x,y;
int c;
int d;
int e,f;
int g;
int h;


void setup(){
  size(500,500);
  background(255);
  noStroke();
  textSize(40);
  for(int a=0;a<=500;a+=20){
    for(int b=0;b<=500;b+=40){
      fill(255,random(255),a);
      ellipse(10+a,10+b,10,10);}}
  for(int c=0;c<=500;c+=20){
    for(int d=0;d<=500;d+=40){
    fill(c,255,random(255));
    rect(10+c,10+d,10,10);}}
  for(int g=0;g<=500;g+=20){
    for(int h=0;h<=500;h+=40){
    fill(random(255),g,255);
    triangle(15+g,10+h,10+g,20+h,20+g,20+h);}}    
}

void draw(){
  fill(0,random(255),100);
  ellipse(mouseX,mouseY,x,y);
  fill(100,0,random(255));
  rect(mouseX,mouseY,e,f);
}

void mouseDragged(){
  x=20;
  y=20;
  e=0;
  f=0;}
void mouseReleased(){
  x=0;
  y=0;}

void mousePressed(){
  e=20;
  f=20;}

void keyPressed(){
  size(500,500);
  background(255);
  
      
 switch(key){
   case'e':
   for(int a=0;a<=500;a+=20){
    for(int b=0;b<=500;b+=40){
      fill(255,random(255),a);
      ellipse(10+a,10+b,10,10);}}
      fill(0,100,255);
   text(key,460,40);
   break;
   
    case'r':
    for(int c=0;c<=500;c+=20){
    for(int d=0;d<=500;d+=40){
    fill(c,255,random(255));
    rect(10+c,10+d,10,10);}}
    fill(0,100,255);
   text(key,460,40);
   break;
   
   case't':
   for(int g=0;g<=500;g+=20){
    for(int h=0;h<=500;h+=40){
    fill(random(255),g,255);
    triangle(15+g,10+h,10+g,20+h,20+g,20+h);}}
    fill(0,100,255);
   text(key,460,40);
   break;
   
   case'a':
   for(int a=0;a<=500;a+=20){
    for(int b=0;b<=500;b+=40){
      fill(255,random(255),a);
      ellipse(10+a,10+b,10,10);}}
      
       for(int c=0;c<=500;c+=20){
    for(int d=0;d<=500;d+=40){
    fill(c,255,random(255));
    rect(10+c,10+d,10,10);}}
    
    for(int g=0;g<=500;g+=20){
    for(int h=0;h<=500;h+=40){
    fill(random(255),g,255);
    triangle(15+g,10+h,10+g,20+h,20+g,20+h);}}
    fill(0,100,255);
   text(key,460,40);
   break;
   
   case'z':
   background(255);
   fill(0,100,255);
   text(key,460,40);
   break;
   
   case'x':
   for(int a=0;a<=500;a+=20){
    for(int b=0;b<=500;b+=40){
      fill(255,random(255),a);
      ellipse(10+a,10+b,10,10);}}
      for(int c=0;c<=500;c+=20){
    for(int d=0;d<=500;d+=40){
    fill(c,255,random(255));
    rect(10+c,10+d,10,10);}}
      fill(0,100,255);
   text(key,460,40);
   break;
   
   case'c':
   for(int a=0;a<=500;a+=20){
    for(int b=0;b<=500;b+=40){
      fill(255,random(255),a);
      ellipse(10+a,10+b,10,10);}}
   for(int g=0;g<=500;g+=20){
    for(int h=0;h<=500;h+=40){
    fill(random(255),g,255);
    triangle(15+g,10+h,10+g,20+h,20+g,20+h);}}
    fill(0,100,255);
   text(key,460,40);
   break;   
   
   case'v':
   for(int c=0;c<=500;c+=20){
    for(int d=0;d<=500;d+=40){
    fill(c,255,random(255));
    rect(10+c,10+d,10,10);}}
    for(int g=0;g<=500;g+=20){
    for(int h=0;h<=500;h+=40){
    fill(random(255),g,255);
    triangle(15+g,10+h,10+g,20+h,20+g,20+h);}}
    fill(0,100,255);
   text(key,460,40);
   break;
 }}
   
   



