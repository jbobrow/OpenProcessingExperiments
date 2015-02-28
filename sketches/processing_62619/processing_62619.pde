
int x;
int y;
int l;
color c;
int r;
int g;
int b;

void setup(){
  background(255);
  //widescreen 16:9 - 144 cuadraditos
  size(640, 360);
  x = 0;
  y = 0;
  l = 40;
}

void draw(){
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  b = (255 - r) - g;
  c = color(r,g,b);
  noStroke();
  fill(c);
  println(r+g+b); 
  rect(x,y,l,l);
   
  x += 40;
  
  if(x>width){
   y += 40;
   x = 0;
   }
  if(y>height){
   noLoop(); 
   //y=0;
     
  }
  
  //void mousePressed() { 
 //background(255);
 //}
 
  
  
  
}
