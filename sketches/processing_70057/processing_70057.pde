

int cx;
int cy;

int r,g,b;

//............................
void setup(){
  
  size(700,350);
  background(289,167,99);
  
  cx=width/2;
  cy=height/2;
  
  r=int(random(0,255));
  g=int(random(0,125));
  b=int(random(0,90));
  
}

//............................
void draw(){
  
  //background(289,167,99);   -> puede hacerse con background o creando un rectangulo como se indica abajo
  
  fill(289,167,99,25);
  noStroke();
  rect(0,0,width,height);
  
  fill(40,160,160,175);
  stroke(0,0,0,175);
  ellipse(cx,cy,10,10);
  
  r=int(random(0,255));
  g=int(random(0,125));
  b=int(random(0,90));
  
  stroke(r,g,b);
  line(cx,cy,random(0,width),random(0,height));
  
  cx=cx-2;
  if(cx < 1){
    cx=width;
  }
    
  //cx=cx%width;
  
}

