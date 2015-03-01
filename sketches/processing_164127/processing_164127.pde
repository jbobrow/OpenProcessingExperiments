
PImage wolf ;
float r;
float g;
float b;
float diam;
float x;
float y;
float hue = 0.2;
int z = 1;

float a = 0.0;
float s = 0.5;

void setup() {
  size(500,500);
  background(HSB,257,56,23);
  smooth();    
  frameRate(50);
  noStroke();
  colorMode(HSB, 300,100,100);
 wolf= loadImage("wolf.jpg") ;
 
  
}

void draw() {
  r = random(200);
  g = random(200);
  b = random(200);
  diam = random(20);
  x = random(width);
  y = random(height);
  noStroke();
  fill(r,g,b);
  rect(x,y,diam,diam);

z = z + 1;
if (z==50){
  ellipse(300,300,200,200);
}  
 if (z==100);{
  ellipse(0, 0, 200, 200); 
 }
  if (z==150){
    ellipse(0, 200, 300, 300);
 }
 if (z==200){
   ellipse(200, 0, 400, 400);
 }
 if(z==225){
   ellipse(100,400,400,400);
   fill(HSB, 100, 200,200);
 }
 if(z==250){
 ellipse(300, 300, 100,100);
 }
  if (z==275){
   ellipse (300, 200, 350, 400);
   }
  if (z==300){  
   image(wolf, 0, 100);
   }
     if (z==330){
    tint(300, 127);  
      image(wolf, 0, 100);
     filter(GRAY);
  }
if (z==360){
  tint(300, 127);  
      image(wolf, 0, 100);
     filter(THRESHOLD);
  }
   if (z==390){
  tint(300, 127);  
      image(wolf, 0, 100);
    filter(INVERT);
}
 if (z==420){
  tint(300, 127);  
      image(wolf, 0, 100);
    filter(POSTERIZE, 50);
 }
  a = a + 0.5;
  s = cos(a)* 2;
 translate(75, 0);
 translate(0,75);
  fill(255);
  scale(s);
  fill(HSB,200,45,100);
  rect(300,300, 50, 50);
 
}



