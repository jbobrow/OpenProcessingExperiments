
void setup(){
 size(480,800); 
  
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
  //strokeWeight(2);
  //stroke(255,182,193,200); 
 
 for(x=0;x<width; x+=xstep){
    xstep = 3 + random(8);
    for(y=0; y<height; y+=ystep){
      ystep = 20 + random(10)*10;
      
  
      DrawPerlinRectFill(x,y,xstep-7,ystep-10);
    } 
   
  }
 
 
 //   DrawPerlinRectFill(100,100,100,100);
   
}
void DrawPerlinRectFill(float x, float y, float wi, float hi){
 
 float xStartnoise = random(10);
 float xEndnoise = random(10);
 
 float xStart = x;
 float yStart = y;
 float xEnd = x + wi;
 float yEnd = y;
 
 float redVal = random(1) * 100;
 float greenVal = random(1)*100;
 //float blueVal = random(1)*150;
 float blueVal = 255;
 
 int lineCount = (int)(hi);
 
 strokeWeight(2);
 for(int i = 0;i < lineCount; i++){
   
   stroke(random(1)*redVal,random(1)*greenVal,random(1)*blueVal, 100);
   
   yStart = y + hi/lineCount * i;
   yEnd = yStart;
   xStart = x + noise(xStartnoise)*10 - 5;
   xEnd = x + wi + noise(xEndnoise)*10 - 5; 
   DrawPerlinLineX(xStart,yStart,xEnd,yEnd); 
   
   xStartnoise += 0.02;
   xEndnoise += 0.02;
 
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
 float xstep = 2;
 float ystep = 2;
 float lastx, lasty;
 float y = starty;
 float ynoise = random(10);

 lastx = startx;
 lasty = starty;
 for(float x = startx; x<=endx; x+=xstep){
  y = y + ((endy-starty)/(endx-startx)) * xstep + noise(ynoise)*2-1;
  line(x,y,lastx, lasty);
  lastx = x;
  lasty = y;
  ynoise +=0.1;
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


