
int wide = 50;
PImage img;
int data[] = {3750, 1330, 1370, 2750, 1000, 3350, 1500, 1300, 500, 1200, 1000, 400, 900, 850, 600, 750, 800, 150, 140, 120, 150};

void setup(){
  size(1600,800);
  background(255);
  smooth();
  img = loadImage("Image32.gif");
}

void draw(){
  image(img,width/3,0);
  
  for(int i = 0; i < data.length; i++){
    float tall = map(data[i],120,3750,0,370);
    rect(i*75+20,410,50,tall);
    fill(0,200,200);}}


