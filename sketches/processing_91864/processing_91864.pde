
void setup(){
 size(500,500); 
  
  float rectHi;
  float rectWi;
  background(0);
  float x,y;
  float xstep, ystep;
  x = 10;
  y = 10;
  xstep = 10;
  ystep = 10;
 
 // DrawPerlinRect(100,100,100,100);
  strokeWeight(2);
  stroke(255,182,193,200); 
 
  for(x=0;x<width; x+=xstep){
    xstep = 2+random(10)*3;
    for(y=0; y<height; y+=ystep){
      ystep = 5 + random(10)*5;
      
  
      DrawPerlinRect(x,y,xstep-3,ystep-3);
    } 
   
  }
 
}


void DrawPerlinRect(float x, float y, float wi, float hi){
  float lastx,lasty;
  lasty = DrawPerlinLineX(x,y,x+wi,y);
  lastx = DrawPerlinLineY(x+wi,lasty,x+wi,y+hi);
  lastx = DrawPerlinLineY(x,y,x,y+hi);
  DrawPerlinLineX(lastx,y+hi,x+wi,y+hi);
  

}


float DrawPerlinLineX(float startx, float starty, float endx, float endy){
 float xstep = 3;
 float ystep = 3;
 float lastx, lasty;
 float y = starty;
 float ynoise = random(10);

 lastx = startx;
 lasty = starty;
 for(float x = startx; x<=endx; x+=xstep){
  y = y + ((endy-starty)/(endx-startx)) * xstep + noise(ynoise)-0.5;
  line(x,y,lastx, lasty);
  lastx = x;
  lasty = y;
  ynoise +=0.001;
 } 
 return lasty;
}


float DrawPerlinLineY(float startx, float starty, float endx, float endy){
 float xstep = 3;
 float ystep = 3;
 float lastx, lasty;
 float x = startx;
 float xnoise = random(10);

 lastx = startx;
 lasty = starty;
 for(float y = starty; y<=endy; y+=ystep){
  x = x + noise(xnoise)-0.5;
  line(x,y,lastx, lasty);
  lastx = x;
  lasty = y;
  xnoise +=0.001;
 } 
 return lastx;
}


