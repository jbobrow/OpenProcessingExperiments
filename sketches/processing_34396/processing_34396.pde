
int w = 255;
int h =255;
PImage a;
PImage b;
public int dy=1;
public int dx=1;
color paw;
PImage c;
void setup(){

size(255,255);

//smooth();
a=createImage(w,h,ARGB);
b=createImage(w,h,ARGB);
c = createImage(w,h,ARGB);

}


void draw(){
  image(b,0,0,w+1,h+1);
for (int x = 0;x<w;x+=dx){
for (int y = 0;y<h;y+=dy){
  int pos = x+w*y;
 float dis = dist(x,y,mouseX,mouseY);
 if (dis<15){
  // stroke(1,111);
 
  pos = (x)+w*y;
  paw=c.pixels[pos];
   if(pos<w*h){
  a.pixels[pos]=color(paw,11);
   }
//  dx=1;
// dy=1;
 }
 else
 {
//   dx=5;
// dy=5;
 pos = (x*2)+w*(y*2);
 //stroke(255,0,0,111);
 if(pos<w*h){
    paw=c.pixels[pos];
 a.pixels[pos]=color(w-x,h-mouseY,x-y,23);
 //color(w-x,h-mouseY,0,23);
 }
 
 }

//point(x,y);
}
}
image(a,0,0);
//b.copy(a,0,0,w,h,0,0,w+1,h+1);
b = get(0,0,w+1,h+1);
b.resize(w/2,h/2);
b.resize(w,h);

} 
