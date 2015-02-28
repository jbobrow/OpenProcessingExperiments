
//variables
float locH;
float locJ;
float a;
float b;
float c;
float backgrounda;
float backgroundb;
float backgroundc;
  
void setup(){
size(900,900);
}
   
//background color
void draw(){
a=random(255);
b=random(255);
c=random(255);
background(a,b,c);
 
//mouse pressed makes background black
 if (mousePressed){
 background(0);
 
}
  
locH=random(0,900);
locJ=random(0,900);
  
//key is pressed makes red circles
if (keyPressed && !mousePressed){
  fill(255,0,0);
  ellipse(locH,locJ,90,90);
    
//mouse and key pressed makes diffrent colores cirlces on black background
}else if (mousePressed && keyPressed){
  fill(a,b,c);
  ellipse(locH,locJ,90,90);
  
}
}



