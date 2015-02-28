
PImage foto;
int x=-500,y=-500;
void setup(){
foto=loadImage("Lenna.jpg");
size(400,400);
}
void draw(){
  background(0);
    if((x!=0)&&(y!=0)){
  image(foto,x,y);
  x++;
  y++;
  print(x);
    }
    else{
       image(foto,x,y);
     noLoop();
  }
}

