
int i;
PImage img;
PImage app;
void setup(){
size(601,680);
img =loadImage ("tree.gif");
app =loadImage ("apple.gif");
}
void draw(){
  background(0);


if(mousePressed==true){
  image(img,0,0);
  image(app,mouseX,mouseY);}
  else{
    image(img,0,0);}
}

