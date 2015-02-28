
int maxImages = 6;
int imageIndex = 0;
PImage[] images = new PImage [maxImages];

void setup (){
  size (240,240);
  background (190,30,45);
  for (int i = 0; i <images.length; i++){
    images [i] = loadImage ("dice" + i + ".png");
    
  }
}

void draw () {
  image (images [imageIndex],40,50);
  fill(255,242,0);
rect(90, 15, 60, 20);
fill(0);
text("ROLL", 105, 30);
}
void mousePressed () {
  if (mouseX >90 && mouseX<150 && mouseY >15 && mouseY<35){
  imageIndex = int (random(images.length));}
}


