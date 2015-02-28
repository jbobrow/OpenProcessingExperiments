
PImage button;
int rectsize= 60;
color hitcolour = color(255,0,0);
void setup(){
 size(255,255); 
 loadPixels();
 nx=0;
 ny=0;
 scr=createImage(width,height,ARGB);
 rectMode(CENTER);
  button = createImage(rectsize,rectsize,ARGB);
 for (int i=0;i<button.pixels.length;i++){
  button.pixels[i]=hitcolour;
 } 
 imageMode(3);
}
boolean mouseup = true;
void mousePressed(){
   if(mouseup && is_hit ){
    offx=nx-mouseX;
    offy=ny-mouseY;
//    offx=offx/2;
//    offy=offy/2;
  }
  mouseup=false;
}
void mouseDragged(){
 if(get(mouseX,mouseY)==hitcolour)
 {is_hit=true; 
 }
 else
 {
  is_hit=false; 
 }
 
 if (is_hit && mouseup == false){
  nx=mouseX+offx;
 ny = mouseY+offy; 
 }
}
color nowcolor = 0;
boolean is_hit=false;
float nx,ny,offx,offy;
PImage scr;
void draw(){
  loadPixels();
background(128);
fill(1);
//scr=get();
//scr.copy(g,0,0,width,height,0,0,width,height);
imageMode(3);
 background(128);
image( button,nx,ny);
nowcolor = get(mouseX,mouseY);
if(mousePressed){
  
  updatenx();
}
rect(nx,ny,rectsize,rectsize); 
imageMode(1);
  //image(scr,0,0);
}

void updatenx(){
   if(get(mouseX,mouseY)==hitcolour)
 {is_hit=true; 
 }
 else
 {
  is_hit=false; 
 }
 
   if (is_hit && mouseup == false){
  nx=mouseX+offx;
 ny = mouseY+offy; 
 background(128);
 }
 
}               
