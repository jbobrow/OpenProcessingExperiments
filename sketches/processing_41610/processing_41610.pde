
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;


void setup() {
  size (600, 500);
a= loadImage ("Data/1.png");
b= loadImage ("Data/2.png");
c= loadImage ("Data/3.png");
d= loadImage ("Data/4.png");
e= loadImage ("Data/5.png");
f= loadImage ("Data/6.png");
g= loadImage ("Data/7.png");
h= loadImage ("Data/8.png");
i= loadImage ("Data/9.png");
j= loadImage ("Data/10.png");
k= loadImage ("Data/11.png");
 
}

void draw (){
  background (200);
  smooth();
  backlegs();
  frontlegs();
  tail ();
  body();
  face();
  body1();
  maskzz();
 
  
}

  

void face (){
     float swish=.004*sin(frameCount/10);
 
  pushMatrix();
  rotate ( swish);
    image (a, 100, 100, width/2, height/2);
    
  popMatrix();
}

void body1 (){
     float swish=.002*sin(frameCount/10);
 
  pushMatrix();
  rotate ( swish);
  
       image (b, 100, 100, width/2, height/2);
       image (g, 100, 100, width/2, height/2);
  popMatrix();
}
void body (){
     float swish=.003*sin(frameCount/10);
 
  pushMatrix();
  rotate ( swish);
    image (e, 100, 100, width/2, height/2);
       image (c, 100, 100, width/2, height/2);
  popMatrix();
}


void frontlegs (){
     float swish=.005*sin(frameCount/10);
 
  pushMatrix();
  rotate ( swish);
    image (j, 100, 100, width/2, height/2);
     image (h, 100, 100, width/2, height/2);
  popMatrix();
}
void backlegs (){
     float swish=.004*sin(frameCount/10);
 
  pushMatrix();
  rotate ( swish);
    image (d, 100, 100, width/2, height/2);
     image (f, 100, 100, width/2, height/2);
  popMatrix();
}


void tail (){
     float swish=.005*sin(frameCount);
 
  pushMatrix();
  rotate ( swish);
    image (i, 100, 100, width/2, height/2);
  popMatrix();
}

void maskzz(){
     float swish=.005*sin(frameCount/5);
 
  pushMatrix();
  rotate ( swish);
  fill (random (0, 2550), random (0, 255), random (0, 255));
  rect (150, 160, 40, 40);
 image (k, 100, 100, width/2, height/2);
  popMatrix();
}

  


