
float[] x = new float [1000];
PImage[] images = new PImage[1000];
int i =0;




void setup()
{
  size(1000, 1000);
  background(0);
  frameRate(12);
  images[0]  = loadImage("cameron_gray.jpg"); 
  images[1]  = loadImage("imaginism.jpg");
  images[2]  = loadImage("cubism.jpg");
  images[3]  = loadImage("dadaism.jpg"); 
  images[4]  = loadImage("expressionsim.jpg");
  images[5]  = loadImage("abstract1.jpg");
  images[6]  = loadImage("japanese art.jpg"); 
  images[7]  = loadImage("surrealism_charnine-8.jpg");
  images[8]  = loadImage("comic.jpg");
  images[9]  = loadImage("surrealism.jpg");
}



void draw()
{
  image(images[i], mouseX, mouseY, 300, 300); 
    

if (mousePressed && i<9) {
i++;
filter(BLUR);
}
else{
i=0;
}
}


void mousePressed(){
i++;
if (mouseButton == RIGHT) {
 i = 0;
}
}

void keyPressed() {
if (key == CODED) {
if (keyCode == UP) {
tint(0, 153, 170);
}
if (key == CODED) {
if (keyCode == DOWN) {
tint(180, 20 , 50);
}
}
}
if (key == CODED) {
if (keyCode == LEFT) {
filter(INVERT);
}
}
if (key == CODED) {
if (keyCode == RIGHT) {
filter(THRESHOLD);
}
}


}


