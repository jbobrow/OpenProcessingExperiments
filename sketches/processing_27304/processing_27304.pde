
PImage a;
PImage b;
boolean firststart=true;
void setup(){
size(100,100,P2D);

a=createImage(width,height,ARGB);
b=createImage(width,height,ARGB);
for (int x=0;x<a.pixels.length;x++){
a.pixels[x]=color(255,0,0);
}
}

void draw(){


 if (firststart){
 background(1);
    a=get();
    firststart = false;
  }
  else
  {
  a=get();
  arraycopyx(a,b);
 b.filter(INVERT);
  imagex(b,mouseX,mouseY);
  }
  

}

void arraycopyx(PImage _a,PImage _b){

for (int i =0;i<_a.width*_a.height;i++){
_b.pixels[i]=_a.pixels[i];
}
}

void arraycopyxi(PImage _a,PImage _b){

for (int i =0;i<_a.width*_a.height;i++){
_b.pixels[i]=_a.pixels[i]*-1;
}
}

void imagex(PImage img,int xloc,int yloc){

for (int x=xloc;x<width;x++){
for (int y=yloc;y<height;y++){
set(x,y,img.get(x-xloc,y-yloc));
}
}
}
