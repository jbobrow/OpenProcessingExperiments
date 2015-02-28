
int sp = 25;
int w = 255;
int h = 255;
color fillc = color(255,0,0,222);
void setup(){
  
 size(255,255,P2D);
 background(255);
 smooth();

stroke(1);
fill(fillc);
strokeWeight(0.5);
ellipse(sp,sp,sp,sp);
line(sp,sp-(sp/2)-1,w-sp,sp-(sp/2)-1);
line(sp,h-(sp/2)-1,w-sp,h-(sp/2)-1);
line(sp-(sp/2)-1,sp,sp-(sp/2)-1,h-sp);
line(w-(sp/2)-1,sp,w-(sp/2)-1,h-sp);


ellipse(w-sp,sp,sp,sp);

ellipse(sp,h-sp,sp,sp);
ellipse(w-sp,h-sp,sp,sp);


fill(fillc);
stroke(255);
//strokeWeight(5);
rect(sp-(sp/4),sp-(sp/4),w-(sp*2)+sp/2,h-(sp*2)+sp/2);



noStroke();
strokeWeight(.5);
rect(sp,sp-(sp/2),sp,sp);
rect(w-sp-sp,sp-(sp/2),sp,sp);
rect(sp,h-(sp/2)-1-sp,sp,sp);
rect(w-sp-sp,h-(sp/2)-1-sp,sp,sp);
rect(sp-(sp/2),sp,sp,sp);
rect(w-(sp/2)-1-sp,h-sp-sp,sp,sp);
rect(sp-(sp/2),h-sp-sp,sp,sp);
rect(w-sp-(sp/2)-1,sp,sp,sp);
}


void draw(){
  fillc = color(mouseX,mouseY,mouseX,252);
  background(255);
  w= mouseX;
  if(w<sp*3)w=sp*3;
 //  smooth();
  h= mouseY;
  if(h<sp*3)h=sp*3;
stroke(1);
fill(fillc);
strokeWeight(0.5);
ellipse(sp,sp,sp,sp);
line(sp,sp-(sp/2)-1,w-sp,sp-(sp/2)-1);
line(sp,h-(sp/2)-1,w-sp,h-(sp/2)-1);
line(sp-(sp/2)-1,sp,sp-(sp/2)-1,h-sp);
line(w-(sp/2)-1,sp,w-(sp/2)-1,h-sp);


ellipse(w-sp,sp,sp,sp);

ellipse(sp,h-sp,sp,sp);
ellipse(w-sp,h-sp,sp,sp);


fill(fillc);
stroke(fillc);
//strokeWeight(5);
rect(sp-(sp/4),sp-(sp/4),w-(sp*2)+sp/2,h-(sp*2)+sp/2);



noStroke();
strokeWeight(.5);

rect(sp,sp-(sp/2),w-(sp*2),sp);
rect(w-sp-sp,sp-(sp/2),sp,sp);
rect(sp,h-(sp/2)-1-sp,(w-sp*2),sp);
rect(w-sp-sp,h-(sp/2)-1-sp,sp,sp);
rect(sp-(sp/2),sp,sp,h-sp-sp);
rect(w-(sp/2)-1-sp,h-sp-sp,sp,sp);
rect(sp-(sp/2),h-sp-sp,sp,sp);
rect(w-sp-(sp/2)-1,sp,sp,h-sp-sp);

}
