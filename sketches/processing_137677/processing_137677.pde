
int sp = 25;
int w = 255;
int h = 255;
color fillc = color(255,0,0,0);
void setup(){
  
 size(255,255,JAVA2D);
 background(255);
 smooth();

stroke(255,0,0);
fill(255,0,0);
strokeWeight(1);
ellipse(sp,sp,sp,sp);
line(sp,sp-(sp/2)-1,w-sp,sp-(sp/2)-1);
line(sp,h-(sp/2)-1,w-sp,h-(sp/2)-1);
line(sp-(sp/2)-1,sp,sp-(sp/2)-1,h-sp);
line(w-(sp/2)-1,sp,w-(sp/2)-1,h-sp);


ellipse(w-sp,sp,sp,sp);

ellipse(sp,h-sp,sp,sp);
ellipse(w-sp,h-sp,sp,sp);
rectMode(CORNER);
noStroke();
//fill(255,0,0);
rect(sp,12,w-(sp*2),h-(sp*1));
//fill(0,255,0);
rect(sp-12,sp,w-(sp),h-(sp*2));





}

void makeit(int x,int y, int wt,int dp,color col){
  if(wt>x+25 && dp>y+25){
  int sp = 25;
  stroke(col);
fill(col);
strokeWeight(1);
ellipse(x,y,sp,sp);
line(x,x-(sp/2)-1,wt-sp,sp-(sp/2)-1);
line(x,dp-(sp/2)-1,wt-sp,dp-(sp/2)-1);
line(x-(sp/2)-1,sp,sp-(sp/2)-1,dp-sp);
line(wt-(sp/2)-1,sp,wt-(sp/2)-1,dp-sp);


ellipse(wt-sp,sp,sp,sp);

ellipse(sp,dp-sp,sp,sp);
ellipse(wt-sp,dp-sp,sp,sp);
rectMode(CORNER);
noStroke();
//fill(255,0,0);
rect(sp,12,wt-(sp*2),dp-(sp*1));
//fill(0,255,0);
rect(sp-12,sp,wt-(sp),dp-(sp*2));
  }

}

void draw(){
  background(255);
  makeit(25,25, mouseX,mouseY,color (255,0,0));
  
}
