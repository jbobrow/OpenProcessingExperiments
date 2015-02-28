
PImage I;
int i,x,y,w=450,h=450;
void setup(){
  size(w,h);
  I=loadImage("247EA356-5F2F-4CB3-B438-085E29C87.jpg");
} 
void draw(){
  
  for(i=0;i++<w*h;)set((x=i%w)^mouseX,(y=i/w)^mouseY,I.get(x,y));
}


