
float eyeX,eyeY, x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,fColor1,fColor2,fColor3,fColor4,fColor5,fColor6;
void setup(){
  size(600,600);
  smooth();
  noStroke();
  rectMode(CENTER);
  fColor1=255;
  fColor2=255;
  fColor3=255;
  fColor4=255;
  fColor5=255;
  fColor6=255;
  
  
  x1=250;
  y1=200;
    
  x2=310;
  y2=200;
  
  x3=370;
  y3=200;
  
  x4=250;
  y4=260;
  
  x5=310;
  y5=260;
  
  x6=370;
  y6=260;
  
  eyeX=300;
  eyeY=130;
}

void draw(){
  background(255);
  fill(0);
  rect(300,180,300,220);
  
  float ff =constrain(mouseX,250,350);
  float fy =constrain(mouseY,110,150);
  
  fill(255);
  
   ellipse(300,130,100,50);
    fill(0);
  
   
  ellipse(ff,fy,40,30);
  
  fill(fColor1);
  rect(x1,y1,50,50);
 
  fill(fColor2);
  rect(x2,y2,50,50);
  
  fill(fColor3);
  rect(x3,y3,50,50);
  
  fill(fColor4);
  rect(x4,y4,50,50);
  
  fill(fColor5);
  rect(x5,y5,50,50);
  
  fill(fColor6);
  rect(x6,y6,50,50);

}
void mousePressed (){

  if(dist(x1,y1,mouseX,mouseY) < 50){
 fColor1=0;fColor2=255;fColor3=255;fColor4=255;fColor5=255;fColor6=255;}

 if(dist(x2,y2,mouseX,mouseY) < 50){
  fColor1=255;fColor2=0;fColor3=255;fColor4=255;fColor5=255;fColor6=255;}

 if(dist(x3,y3,mouseX,mouseY) < 50){
  fColor1=255;fColor2=255;fColor3=0;fColor4=255;fColor5=255;fColor6=255;}

 if(dist(x4,y4,mouseX,mouseY) < 50){
   fColor1=255;fColor2=255;fColor3=255;fColor4=0;fColor5=255;fColor6=255;}
 
 if(dist(x5,y5,mouseX,mouseY) < 50){
   fColor1=255;fColor2=255;fColor3=255;fColor4=255;fColor5=0;fColor6=255;}

 if(dist(x6,y6,mouseX,mouseY) < 50){
   fColor1=255;fColor2=255;fColor3=255;fColor4=255;fColor5=255;fColor6=0;}
 
}

