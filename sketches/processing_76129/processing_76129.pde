
PImage foto;
int x;
int y;
void setup(){
size(400,400);
foto=loadImage("lena.jpg");
x=-400;
y=-400;
}
void draw(){
  background(0);
if(x!=0){
image(foto,x,y);
x++;
y++;
}
else{
  image(foto,0,0);
}
  

}


