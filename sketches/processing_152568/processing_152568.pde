
int maxImages = 20;
int imageIndex = 1;
PImage[] images = new PImage[maxImages]; 
int y = 0;

void setup() {
  size(600, 890);
   for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage(  i + ".jpg" ); 
  }
}


void draw() {
 
  image(images[imageIndex],0,0,width,height); 
  
  
  y = constrain(mouseY, 0, height);
  for (int h = 0; h < height; h+=1) {
    color c = get(h, y);
    stroke(c);
    //line(h, 0, h, mouseY);//distorsion superior
    line(h, height, h, mouseY);//distorsion inferior
    //line(h + width/2, 0, h + width/2, height);
  }
 
  stroke(255,255,255,100);
  line(0, y, width, y);
}

void mousePressed() {
  imageIndex = int(random(images.length));
}


