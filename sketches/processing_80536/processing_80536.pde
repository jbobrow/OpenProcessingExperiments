
PImage foto;
int x;
int y;
void setup(){
size(200,200);
foto=loadImage("lena.jpg");
x=-400;
y=-400;
}
void draw(){
  background(255,255,0);
if(x!=0){
image(foto,x,y);
x=x+5;
y=y+5;
}
else{
  image(foto,0,0);
}
   
 
}


