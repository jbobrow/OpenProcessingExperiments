
PImage bild;

void setup(){
  size(700,700);
  bild = loadImage("stern.png");
  image(bild,0,0);
  smooth();
  frameRate(70);
}
void draw(){
background(0);
noStroke();
float cs = mouseX+64;
float cs1 = mouseX+48;


for(int j = 0; j<height/cs+1;j++){
for(int i = 0; i<width/cs+1;i++){
image(bild,i*cs,j*cs,cs,cs);
}
}
}



