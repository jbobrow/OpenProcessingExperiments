
int a = 0;
int b=200;
int c=600;
int randMax;
int randMin;
float d = -20;
int color1;
int color2;
int color3;
int color4;
int rand;

void setup(){

  size(600, 800);
  background(255);
  frameRate (15);
    noStroke ();
      smooth ();
  
  randMin = int(random(200, 300));
  randMax = int(random(310, 500));
  rand = int(random(1,3));
  if ( rand == 1) { 
    color1 = 255; 
    color2 = 0;
    color3 =72;
    color4 = 136;
  } 
  else {
    color1 = 72;
    color2 = 136;
   color3 = 255;
   color4 = 0;
   
  } 
  
   println (rand);
}

void draw(){

  a+=2;
  
if (a<=randMin){ 
  fill (color1,a,color2, 1); 
  rect (0, 0, width, height);
  ellipse (300,a+20,a,a);
}

if ((a>=randMin)&&(a<=randMax)){
  ellipse (300,a,b+=5,200);
  fill (color2,165,color1,d+=0.3);
  frameRate(20);
}

if ((a>=randMax)&&(c>=0)){
    ellipse (300,a,c-=5,200);
    fill (color3,165,color4,d+=0.3);
    frameRate(10);
}
  

}

