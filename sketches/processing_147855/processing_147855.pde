
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOE Goeun
// ID: 201420111

void setup(){
size (1024, 768);
background(255);
smooth();
noLoop();
}

void draw(){
  
  //ellipse
  fill(255,255,255,0);
  for (int a=0; a<width; a=a+50){
    for (int b=0; b<height; b=b+50){
   //fill(random(255),random(200),random(180),30);
  fill(random(200));
  noStroke();
  ellipse(a,b,30,30);
  ellipse(a+15,b,30,30);
  ellipse(a,b+15,30,30);
  ellipse(a+15,b+15,30,30);
  }}
    
  //blank
  for (float c=32.5; c<width; c=c+100){
    for (float d=32.5; d<width; d= d+150){
      for (float e=32.5; e<width; e= e+200){
     fill(255);
     rect(c,d,50,50);
     rect(e,c,50,50);
     rect(d,e,50,50);
     rect(c,e,50,50);
     rect(e,d,50,50);
     rect(d,c,50,50);
  }}}}

void keyPressed(){
background(0);
redraw();} 
