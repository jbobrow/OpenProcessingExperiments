
//midterm
//by maria fang

PImage tree;
int a=340;
int b=50;
float x1,x2,x3,x4,x5,x6,x7,x8,x9,x10;
float y1=1,y2=1,y3=1,y4=1,y5=1,y6=1,y7=1,y8=1,y9=1,y10=1;
float g=2;
float vy=1;
float friction=-.8;
boolean click=false;
boolean grow=false;

void setup(){
  size(578, 800);
  tree = loadImage("tree.jpg");
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  smooth();
  //photoFilter();
  x1=random(100,450);
  x2=random(100,450);
  x3=random(100,450);
  x4=random(100,450);
  x5=random(100,450);
  x6=random(100,450);
  x7=random(100,450);
  x8=random(100,450);
  x9=random(100,450);
  x10=random(100,450);
}


void draw(){
  background(tree);
  noStroke();
  fill(58,50,99,50);
  ellipse(a,b,200,200);
  fill(22,78,98);
  stroke(50);
  strokeWeight(.5);
  //orange
  ellipse(x1, 200+y1, 55, 55);
  ellipse(x2, 430+y2, 40, 40);
  ellipse(x3, 300+y3, 50, 50);
  ellipse(x4, 370+y4, 45, 45);
  ellipse(x5, 253+y5, 40, 40);
  ellipse(x6, 340+y6, 43, 43);
  ellipse(x7, 270+y7, 36, 36);
  ellipse(x8, 280+y8, 20, 20);
  ellipse(x9, 235+y9, 30, 30);
  ellipse(x10, 415+y10, 40, 40);
  if(keyPressed == true && key == 'f') {
    click=true;
  }  
  if(click){
   if(y1*g<500) y1*=g; else y1=500;    
   if(y2*g<270) y2*=g; else y2=270;   
   if(y3*g<400) y3*=g; else y3=400;   
   if(y4*g<330) y4*=g; else y4=330;   
   if(y5*g<447) y5*=g; else y5=447;
   if(y6*g<360) y6*=g; else y6=360;   
   if(y7*g<430) y7*=g; else y7=430;
   if(y8*g<420) y8*=g; else y8=420;
   if(y9*g<465) y9*=g; else y9=465;
   if(y10*g<285) y10*=g; else y10=285;

  }

 
  if(y1==500) {
    a=320;
    b=130;
    loadPixels();
    int picSize = width * height;
    for(int i= 0; i< picSize; i++){
    color cp= pixels[i];
    float h = hue(cp);
    float s = saturation(cp);
    float b = brightness(cp);
    if(h == 22){
      h +=200;
      fill(random(h),s,b);
      noStroke();
      ellipse(i%width, i/width,35,35);
    }
    if(h>90 && h<100){
      h =50;
      fill(h,s,b);
      stroke(51,88,99,50);
      line(320, 130, i%width, i/width);
      stroke(44,42,97,60);
      line(320, 130, i%width, i/width);
    }
    }

    if (keyPressed == true && key=='g') {
      //a=a;
      //b=b;
      click=false;      
      y1=1;
      y2=1;
      y3=1;
      y4=1;
      y5=1;
      y6=1;
      y7=1;
      y8=1;
      y9=1;
      y10=1;
      x1=random(100,450);
      x2=random(100,450);
      x3=random(100,450);
      x4=random(100,450);
      x5=random(100,450);
      x6=random(100,450);
      x7=random(100,450);
      x8=random(100,450);
      x9=random(100,450);
      x10=random(100,450);
    }
  }
}


