
int a=200;
int b=200;
int max=200;
int x=0;
int y=0;
int z=0;
int g=1;
int peso=1;
int rell=100;
PFont font;


void setup(){ 
  
  size(700, 700);
  font=createFont("Courier",12);




} 
void draw(){
  frameRate(20);
  fill(0,1);
rect(0,0,width,height); 


translate(width/2, height/2); 
//cambiar el divisor en rotate para generar nuevos efectos
rotate(frameCount*PI/g);
fill(rell,mouseY/7);
stroke(255,10);
strokeWeight(peso);
rect(-100, -75, a, b);
ellipse(-100,-75,a/2,b/2);
ellipse(0+mouseX/2,0,a/4,b/2);
rect(100,70-mouseX/2,a/3,b/3);

rotate(-frameCount*PI/g);
noStroke();
fill(0);
rect(270,300,80,24);
textFont(font);
fill(255,0,0);
text("opacidad "+mouseY/7,270,320);
fill(255,0,0);
text("amplitud "+mouseX/7,270,310);

//a-=1;
//b-=1;
x+=1;
g+=1;
peso+=1;
rell+=1;

if(rell==255){
  rell=100;
}


if(peso==4){
  peso=0;
}

if(g==100){
  g=50;
}

if(x>=255){
  x=255;
}

if(a>0 && y==0){
  a-=1;
  
}

if(b>0 && y==0){
  b-=1;

} 
if(a==0){
  y=1;
  
}

if(y==1){
  a+=1;
  b+=1;
  
}



if(a==max){
  x=0;
  y=0;
}



}
 
  

  
                                    
